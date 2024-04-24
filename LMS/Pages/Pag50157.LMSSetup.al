page 50157 "LMS Setup"
{
    ApplicationArea = All;
    Caption = 'LMS Setup';
    PageType = Card;
    SourceTable = "LMS Setup";
    UsageCategory = Administration;
    Editable = true;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Transaction Nos."; Rec."Transaction Nos.")
                {
                    ToolTip = 'Specifies the value of the Transaction Nos. field.';
                    TableRelation = "No. Series".Code;
                    ApplicationArea = All;
                }
                field("Loan Nos."; Rec."Loan Nos.")
                {
                    ToolTip = 'Specifies the value of the Loan Nos. field.';
                    TableRelation = "No. Series".Code;
                    ApplicationArea = All;
                }
                field("Delayed Interest Rate (%)"; Rec."Delayed Interest Rate (%)")
                {
                    ToolTip = 'Specifies the value of the Delayed Interest Rate (%) field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
