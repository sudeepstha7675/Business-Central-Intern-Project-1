page 50152 "Loan Borrow Entry"
{
    ApplicationArea = All;
    Caption = 'Loan Borrow Entry';
    PageType = Card;
    SourceTable = "Loan Borrow Entry";
    Editable = true;

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
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ToolTip = 'Specifies the value of the Transaction Date field.';
                }
                field("Borrower ID"; Rec."Borrower ID")
                {
                    ToolTip = 'Specifies the value of the Borrower ID field.';
                }
                field("Borrower Name"; Rec."Borrower Name")
                {
                    ToolTip = 'Specifies the value of the Borrower Name field.';
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
            }
            group("Loan Details")
            {

                field("Loan Start Date"; Rec."Loan Start Date")
                {
                    ToolTip = 'Specifies the value of the Loan Start Date field.';
                }
                field("Loan Amount"; Rec."Loan Amount")
                {
                    ToolTip = 'Specifies the value of the Loan Amount field.';
                }
                field("EMI Period"; Rec."EMI Period")
                {
                    ToolTip = 'Specifies the value of the EMI Period field.';
                    trigger OnValidate()
                    var
                        ScheduleRec: Record "Payment Schedule";
                    begin
                        rec."EMI Amount" := Rec."Loan Amount" / Rec."EMI Period";
                        Rec."loan End Date" := CalcDate('<CD+' + Format(Rec."EMI Period") + 'M>', Rec."Loan Start Date");
                        ScheduleRec.SetRange("Loan No.", Rec."Loan No");
                        if ScheduleRec.FindSet() then
                            repeat
                                ScheduleRec.Delete();
                            until ScheduleRec.Next() = 0;
                        Rec.Status := Rec.Status::Open;
                    end;
                }
                field("EMI Amount"; Rec."EMI Amount")
                {
                    ToolTip = 'Specifies the value of the EMI Amount field.';
                }
                field("loan End Date"; Rec."loan End Date")
                {
                    ToolTip = 'Specifies the value of the Loan End Date field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Generate Payment Schedule")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    ScheduleRec: Record "Payment Schedule";
                    i: Integer;
                    PaymentDate: Date;
                    Runpaymentschedulerecord: Record "Payment Schedule";
                    Runpaymentschedulepage: Page "Payment Schedule";
                begin
                    ScheduleRec.SetRange("Loan No.", Rec."Loan No");
                    if not ScheduleRec.FindFirst() then begin
                        PaymentDate := Rec."Loan Start Date";
                        for i := 1 to rec."EMI Period" do begin
                            ScheduleRec.Init();
                            ScheduleRec.Period := i;
                            ScheduleRec."Payment Date" := CalcDate('<' + Format(i) + 'M>', PaymentDate);
                            ScheduleRec."Loan No." := Rec."Loan No";
                            ScheduleRec.Insert(true);
                        end;
                        Message('Schedule Generated Successfully');
                    end
                    else begin
                        exit
                    end;
                    Runpaymentschedulerecord.SetFilter("Loan No.", Rec."Loan No");
                    Runpaymentschedulepage.SetTableView(Runpaymentschedulerecord);
                    Runpaymentschedulepage.Run();
                    rec.Status := Rec.Status::"Schedule Released";
                end;
            }
            action("Open Payment Schedule")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    Runpaymentschedulerecord: Record "Payment Schedule";
                    Runpaymentschedulepage: Page "Payment Schedule";
                begin
                    Runpaymentschedulerecord.SetFilter("Loan No.", Rec."Loan No");
                    Runpaymentschedulepage.SetTableView(Runpaymentschedulerecord);
                    Runpaymentschedulepage.Run();
                end;
            }
            action(Post)
            {

                ApplicationArea = All;
                Image = Post;
                trigger OnAction()
                var
                    PostedDocument: Record "Posted Loan Borrow Entry";
                    RecordDocument: Record "Loan Borrow Entry";
                    detailedentries: Record "Loan Transaction Details";
                begin
                    if Confirm('Do you want to Post the Document?', false) then begin
                        PostedDocument.Reset();
                        PostedDocument.SetRange("Transaction ID", Rec."Transaction ID");
                        if not PostedDocument.FindFirst() and
                        (Rec.Status = Rec.Status::"Schedule Released") then begin
                            detailedentries.Init();
                            recorddocument.Get(Rec."Loan No", Rec."Transaction ID", rec."Borrower ID");
                            detailedentries."Loan No" := RecordDocument."Loan No";
                            detailedentries."Transaction ID" := RecordDocument."Transaction ID";
                            detailedentries."Transaction Amount" := RecordDocument."Loan Amount";
                            detailedentries."Borrower ID" := RecordDocument."Borrower ID";
                            RecordDocument.CalcFields("Borrower Name");
                            detailedentries."Borrower Name" := RecordDocument."Borrower Name";
                            detailedentries."EMI Amount" := RecordDocument."EMI Amount";
                            detailedentries."EMI Period" := RecordDocument."EMI Period";
                            detailedentries."Loan Start Date" := RecordDocument."Loan Start Date";
                            detailedentries."loan End Date" := RecordDocument."Loan End Date";
                            detailedentries."Transaction Date" := RecordDocument."Transaction Date";
                            detailedentries."Document Type" := 'Loan Borrow Entry';
                            detailedentries.Insert(true);
                            PostedDocument.Init();
                            PostedDocument.TransferFields(Rec);
                            RecordDocument.CalcFields("Borrower Name");
                            PostedDocument."Borrower Name" := RecordDocument."Borrower Name";
                            PostedDocument.Insert(true);
                            Rec.Delete(true);
                            Message('The document has been posted successfully.');
                        end
                        else
                            Error('Payment Schedule Must be Generated beofre Posting the document');
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Generate_Payment_Schedule_Promoted; "Generate Payment Schedule")
                { }
                actionref(Open_Payment_Schedule_Promoted; "Open Payment Schedule")
                { }
                actionref(Post_Promoted; Post)
                { }
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Transaction Date" := WorkDate()
    end;
}

