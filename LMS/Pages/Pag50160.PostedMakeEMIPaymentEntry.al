page 50160 "Posted EMI Payment Entry"
{
    ApplicationArea = All;
    Caption = 'EMI Payment Entry';
    PageType = Card;
    SourceTable = PostedEMIPaymentEntry;
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
                    // trigger OnValidate()
                    // var
                    // amount: Record "Loan Borrow Entry";
                    // period: Record "Payment Schedule";
                    // begin
                    //     amount.SetRange("Loan No", Rec."Loan No");
                    //     amount.FindFirst();
                    //     Rec."EMI Payment Amount" := amount."EMI Amount";
                    //     period.SetRange("Loan No.", Rec."Loan No");
                    //     period.SetRange(period."Paid?",period."Paid?"::No);
                    //     period.FindFirst();
                    //     Rec.Period := period.Period;
                    //     Rec."Expected Payment Date" := period."Payment Date";
                    // end;
                }
                field("Borrower ID"; Rec."Borrower ID")
                {
                    ToolTip = 'Specifies the value of the Borrower ID field.';
                }
                field("Borrower Name"; Rec."Borrower Name")
                {
                    ToolTip = 'Specifies the value of the Borrower Name.';
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ToolTip = 'Specifies the value of the Transaction Date field.';
                }
                field(Period; Rec.Period)
                {
                    ToolTip = 'Specifies the value of the Period.';
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
}
