page 50159 "Posted Loan Borrow Entry"
{
    ApplicationArea = All;
    Caption = 'Loan Borrow Entry';
    PageType = Card;
    SourceTable = "Posted Loan Borrow Entry";
    Editable = false;

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
                    // trigger OnValidate()
                    // begin
                    //     rec."EMI Amount" := Rec."Loan Amount" / Rec."EMI Period";
                    //     Rec."loan End Date" := CalcDate('<CD+' + Format(Rec."EMI Period") + 'M>', Rec."Loan Start Date")
                    // end;

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
            //         action("Generate Payment Schedule")
            //         {
            //             ApplicationArea = All;
            //             trigger OnAction()
            //             var
            //                 ScheduleRec: Record "Payment Schedule";
            //                 i: Integer;
            //                 PaymentDate: Date;
            //                 Runpaymentschedulerecord: Record "Payment Schedule";
            //                 Runpaymentschedulepage: Page "Payment Schedule";
            //             begin
            //                 PaymentDate := Rec."Loan Start Date";
            //                 for i := 1 to rec."EMI Period" do begin
            //                     ScheduleRec.Init();
            //                     ScheduleRec.Period := i;
            //                     ScheduleRec."Payment Date" := CalcDate('<' + Format(i) + 'M>', PaymentDate);
            //                     ScheduleRec."Loan No." := Rec."Loan No";
            //                     ScheduleRec.Insert();
            //                 end;
            //                 Message('Schedule Generated Successfully');
            //                 Runpaymentschedulerecord.SetFilter("Loan No.", Rec."Loan No");
            //                 Runpaymentschedulepage.SetTableView(Runpaymentschedulerecord);
            //                 Runpaymentschedulepage.Run();
            //             end;
            //         }
            action("Open Payment Schedule")
            {
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
            //         action(Post)
            //         {

            //             ApplicationArea = All;
            //             Image = Post;
            //             trigger OnAction()
            //             var
            //                 PostedDocument: Record "Posted Loan Borrow Entry";
            //             begin
            //                 if Confirm('Do you want to Post the Document?', false) then begin
            //                     PostedDocument.Reset();
            //                     PostedDocument.SetRange("Transaction ID", Rec."Transaction ID");
            //                     if not PostedDocument.FindFirst() then begin
            //                         PostedDocument.Init();
            //                         PostedDocument.TransferFields(Rec);
            //                         PostedDocument.Insert(true);
            //                         Rec.Delete(true);
            //                         Message('The document has been posted successfully.');
            //                     end;
            //                 end;
            //             end;
            //         }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                //             actionref(Generate_Payment_Schedule_Promoted; "Generate Payment Schedule")
                //             { }
                actionref(Open_Payment_Schedule_Promoted; "Open Payment Schedule")
                { }
                //             actionref(Post_Promoted; Post)
                //             { }
            }
        }
    }
    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     Rec."Transaction Date" := WorkDate()
    // end;
}

