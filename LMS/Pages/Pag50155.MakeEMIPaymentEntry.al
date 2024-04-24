page 50155 "Open EMI Payment Record"
{
    ApplicationArea = All;
    Caption = 'Open EMI Payment Record';
    PageType = List;
    SourceTable = EMIPaymentEntry;
    Editable = false;
    CardPageId = "EMI Payment Entry";

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
