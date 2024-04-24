pageextension 50150 CustomerCardExtension extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Is Borrower?";Rec."Is Borrower?")
            {
                ApplicationArea = All;
            }
        }
    }
}
