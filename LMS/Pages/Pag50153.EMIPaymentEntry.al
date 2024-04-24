page 50153 "EMI Payment Entry"
{
    ApplicationArea = All;
    Caption = 'EMI Payment Entry';
    PageType = Card;
    SourceTable = EMIPaymentEntry;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Loan No"; Rec."Loan No")
                {
                    ToolTip = 'Specifies the value of the Loan No field.';
                    trigger OnValidate()
                    var
                        amount: Record "Posted Loan Borrow Entry";
                        period: Record "Payment Schedule";
                    begin
                        amount.SetRange("Loan No", Rec."Loan No");
                        amount.FindFirst();
                        Rec."EMI Payment Amount" := amount."EMI Amount";
                        period.SetRange("Loan No.", Rec."Loan No");
                        period.SetRange(period."Paid?", period."Paid?"::No);
                        period.FindFirst();
                        Rec.Period := period.Period;
                        Rec."Expected Payment Date" := period."Payment Date";
                    end;
                }
                field("Borrower ID"; Rec."Borrower ID")
                {
                    ToolTip = 'Specifies the value of the Borrower ID field.';
                    Editable = false;
                }
                field("Borrower Name"; Rec."Borrower Name")
                {
                    ToolTip = 'Specifies the value of the Borrower Name.';
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ToolTip = 'Specifies the value of the Transaction Date field.';
                    trigger OnValidate()
                    var
                        Delayedduration: Integer;
                        percentage: Record "LMS Setup";
                        amount: Decimal;
                    begin
                        if Rec."Transaction Date" <= Rec."Expected Payment Date" then begin
                            Rec."Fine Amount" := 0
                        end
                        else begin
                            percentage.Get();
                            Delayedduration := Rec."Transaction Date" - Rec."Expected Payment Date";
                            amount := (Rec."EMI Payment Amount" * (percentage."Delayed Interest Rate (%)" / 100)) / 365 * Delayedduration;
                            Rec."Fine Amount" := amount;
                        end;
                    end;
                }
                field(Period; Rec.Period)
                {
                    ToolTip = 'Specifies the value of the Period.';
                    trigger OnValidate()
                    var
                        checkpaidstatus: Record "Payment Schedule";
                    begin
                        checkpaidstatus.Get(Rec."Loan No", Rec.Period);
                        if checkpaidstatus."Paid?" = checkpaidstatus."Paid?"::Yes then
                            Error('Payment entry for selected period is already posted.');
                    end;
                }
                field("Expected Payment Date"; Rec."Expected Payment Date")
                {
                }
                field("EMI Payment Amount"; Rec."EMI Payment Amount")
                {
                    Description = 'EMI Payemnt Amount';
                    ToolTip = 'Specifies the value of the EMI Payment Amount field.';
                    Editable = false;
                }
                field("Fine Amount"; Rec."Fine Amount")
                {
                    ToolTip = 'Specifies the value of the Fine Amount field.';
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = All;
                Image = Post;
                trigger OnAction()
                var
                    Postdocument: Record PostedEMIPaymentEntry;
                    recorddocument: Record EMIPaymentEntry;
                    detailedentries: Record "Loan Transaction Details";
                    updateschedule: Record "Payment Schedule";
                    updateborrowerlist: Page "Borrower List";
                begin
                    if Confirm('Do you want to Post the Document?', false) then begin
                        Postdocument.Reset();
                        updateschedule.Reset();
                        Postdocument.SetRange("Transaction ID", Rec."Transaction ID");
                        updateschedule.Get(rec."Loan No", rec.Period);
                        if not Postdocument.FindFirst() then begin
                            Rec.TestField("Borrower ID");
                            Rec.TestField("Loan No");
                            Rec.TestField("Transaction Date");
                            detailedentries.Init();
                            recorddocument.Get(Rec."Loan No", Rec."Transaction ID", rec."Borrower ID");
                            detailedentries."Loan No" := recorddocument."Loan No";
                            detailedentries."Transaction ID" := recorddocument."Transaction ID";
                            detailedentries."Transaction Date" := recorddocument."Transaction Date";
                            detailedentries."Borrower ID" := recorddocument."Borrower ID";
                            recorddocument.CalcFields("Borrower Name");
                            detailedentries."Borrower Name" := recorddocument."Borrower Name";
                            detailedentries."EMI Period" := recorddocument.Period;
                            detailedentries."Transaction Amount" := recorddocument."EMI Payment Amount" * -1;
                            detailedentries."Fine Amount" := recorddocument."Fine Amount";
                            detailedentries."Document Type" := 'EMI Payment Entry';
                            detailedentries."Expected Payment Date" := recorddocument."Expected Payment Date";
                            detailedentries.Insert(true);
                            Postdocument.Init();
                            Postdocument.TransferFields(Rec);
                            recorddocument.CalcFields("Borrower Name");
                            Postdocument."Borrower Name" := recorddocument."Borrower Name";
                            Postdocument.Insert(true);
                            updateschedule."Paid?" := updateschedule."Paid?"::Yes;
                            updateschedule.Modify(true);
                            Rec.Delete(true);
                            // updateborrowerlist.Update(true);
                            Message('The document has been posted successfully.');
                        end;
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Post_Promoted; Post)
                { }
            }
        }
    }
    trigger OnNewRecord(belowxREc: Boolean)
    begin
        Rec."Transaction Date" := WorkDate()
    end;
}
