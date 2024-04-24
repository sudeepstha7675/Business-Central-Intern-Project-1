page 50161 "Posted EMI Payment Record"
{
    ApplicationArea = All;
    Caption = 'Open EMI Payment Record';
    PageType = List;
    SourceTable = PostedEMIPaymentEntry;
    CardPageId = "Posted EMI Payment Entry";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Borrower ID"; Rec."Borrower ID")
                {
                    ToolTip = 'Specifies the value of the Borrower ID field.';
                }
                field("Borrower Name"; Rec."Borrower Name")
                {
                    ToolTip = 'Specifies the value of the Borrower Name.';
                }
                field("Loan No"; Rec."Loan No")
                {
                    ToolTip = 'Specifies the value of the Loan No field.';
                }
                field(Period; Rec.Period)
                {
                }
                field("EMI Payment Amount"; Rec."EMI Payment Amount")
                {
                    ToolTip = 'Specifies the value of the EMI Payment Amount field.';
                }
            }
        }
    }
    // trigger OnOpenPage()
    // begin
    //     Rec.SetFilter("Borrower ID", Rec."Borrower ID");
    // end;
}
