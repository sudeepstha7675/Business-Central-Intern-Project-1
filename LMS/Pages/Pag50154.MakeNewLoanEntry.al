page 50154 "Open Loan Record"
{
    ApplicationArea = All;
    Caption = 'Make New Loan Entry';
    PageType = List;
    SourceTable = "Loan Borrow Entry";
    CardPageId = "Loan Borrow Entry";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Loan No"; Rec."Loan No")
                {
                    ToolTip = 'Specifies the value of the Loan No field.';
                }
                field("Borrower ID"; Rec."Borrower ID")
                {
                    ToolTip = 'Specifies the value of the Borrower ID field.';
                }
                field("Loan Amount"; Rec."Loan Amount")
                {
                    ToolTip = 'Specifies the value of the Loan Amount field.';
                }
                field("Loan Start Date"; Rec."Loan Start Date")
                {
                    ToolTip = 'Specifies the value of the Loan Start Date field.';
                }
                field("loan End Date"; Rec."loan End Date")
                {
                    ToolTip = 'Specifies the value of the Loan End Date field.';
                }
                field("EMI Period"; Rec."EMI Period")
                { }
            }
        }
    }
    // trigger OnOpenPage()
    // begin
    //     Rec.SetFilter("Borrower ID",Rec."Borrower ID");
    // end;
}
