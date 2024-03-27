page 50102 "Vehicle List"
{
    ApplicationArea = All;
    Caption = 'Vehicle List';
    PageType = List;
    SourceTable = Vehicle;
    UsageCategory = Lists;
    CardPageId = "Vehicle Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Make; Rec.Make)
                {
                    ToolTip = 'Specifies the value of the Make field.';
                    LookupPageId = Make;
                }
                field(Model; Rec.Model)
                {
                    ToolTip = 'Specifies the value of the Model field.';
                    LookupPageId = Model;
                }
                field(VIN; Rec.VIN)
                {
                    ToolTip = 'Specifies the value of the VIN field.';
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ToolTip = 'Specifies the value of the Registration Date field.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ToolTip = 'Specifies the value of the Total Cost field.';
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action("Get Model Records")
            {
                Caption = 'Get Model Records';
                ApplicationArea = All;
                Image = Answers;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction()
                var
                    ModelPage: Record Model;
                    ModelPageID: Page "Model Card";
                begin
                    if Rec.Model <> '' then begin
                        ModelPage.SetRange(Make, Rec.Make);
                        ModelPage.SetRange("Model No.", Rec.Model);
                        if ModelPage.FindSet() then begin
                            ModelPageID.SetTableView(ModelPage);
                            ModelPageID.Run();
                        end
                        else begin
                            Message('No Model with this number');
                        end;
                    end
                    else begin
                        Message('Model number is Empty');
                    end;
                end;
            }
        }
    }
}
