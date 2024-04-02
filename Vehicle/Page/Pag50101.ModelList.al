page 50101 Model
{
    ApplicationArea = All;
    Caption = 'Model';
    PageType = List;
    SourceTable = Model;
    UsageCategory = Lists;
    CardPageId = "Model Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Make; Rec.Make)
                {
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field("Model No."; Rec."Model No.")
                {
                    ToolTip = 'Specifies the value of the Model No. field.';
                }
                field("Make Description"; Rec."Make Description")
                {
                    ToolTip = 'Specifies the value of the Model Description field.';
                    Editable = false;
                }
                field(Decription; Rec.Decription)
                {
                    ToolTip = 'Specifies the value of the Decription field.';
                }
                field("Vehicle Type"; Rec."Vehicle Type")
                {
                    ToolTip = 'Specifies the value of the Vehicle Type field.';
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ToolTip = 'Specifies the value of the Fuel Type field.';
                }
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
