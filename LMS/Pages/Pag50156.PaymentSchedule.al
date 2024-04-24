page 50156 "Payment Schedule"
{
    ApplicationArea = All;
    Caption = 'Payment Schedule';
    PageType = List;
    SourceTable = "Payment Schedule";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Period; Rec.Period)
                {
                    ToolTip = 'Specifies the value of the Period field.';
                }
                field("Payment Date"; Rec."Payment Date")
                {
                    ToolTip = 'Specifies the value of the Payment Date field.';
                }
                field("Paid?"; Rec."Paid?")
                {
                    ToolTip = 'Specifies the value of the Paid? field.';
                }
            }
        }
    }
}
