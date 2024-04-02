page 50105 "Model Card"
{
    ApplicationArea = All;
    Caption = 'Model Card';
    PageType = Card;
    SourceTable = Model;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Model No."; Rec."Model No.")
                {
                    ToolTip = 'Specifies the value of the Model No. field.';
                }
                field(Make; Rec.Make)
                {
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field("Make Description"; Rec."Make Description")
                {
                    ToolTip = 'Specifies the value of the Make Description field.';
                    Editable = false;
                }
                field(Decription; Rec.Decription)
                {
                    ToolTip = 'Specifies the value of the Decription field.';
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ToolTip = 'Specifies the value of the Fuel Type field.';
                }
                field("Vehicle Type"; Rec."Vehicle Type")
                {
                    ToolTip = 'Specifies the value of the Vehicle Type field.';
                }
            }
            group("Cost Details")
            {
                field(Cost; Rec.Cost)
                {
                    ToolTip = 'Specifies the value of the Cost field.';
                }
                field("Custom Duty"; Rec."Custom Duty")
                {
                    ToolTip = 'Specifies the value of the Custom Duty field.';
                }
                field(VAT; Rec.VAT)
                {
                    ToolTip = 'Specifies the value of the VAT field.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ToolTip = 'Specifies the value of the Total Cost field.';
                }
            }
        }
    }
}
