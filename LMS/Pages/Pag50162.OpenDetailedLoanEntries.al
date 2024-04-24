page 50162 "Open Detailed Loan Entries"
{
    ApplicationArea = All;
    Caption = 'Open Detailed Loan Entries';
    PageType = List;
    SourceTable = "Loan Transaction Details";
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
                field("Borrower Name"; Rec."Borrower Name")
                {
                    ToolTip = 'Specifies the value of the Borrower Name field.';
                }
                field("Transaction Amount"; Rec."Transaction Amount")
                {
                    ToolTip = 'Specifies the value of the Transaction Amount field.';
                }
                field("EMI Period"; Rec."EMI Period")
                {
                    ToolTip = 'Specifies the value of the EMI Period field.';
                }
                field("Loan Start Date"; Rec."Loan Start Date")
                {
                    ToolTip = 'Specifies the value of the Loan Start Date field.';
                }
                field("loan End Date"; Rec."loan End Date")
                {
                    ToolTip = 'Specifies the value of the Loan End Date field.';
                }
                field("Transaction ID"; Rec."Transaction ID")
                {
                    ToolTip = 'Specifies the value of the Transaction ID field.';
                }
                field("Document Type";Rec."Document Type")
                {}
            }
        }
    }
}
