table 50102 Vehicle
{
    Caption = 'Vehicle';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(2; Make; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Make';
            TableRelation = Make.Code;
            trigger OnValidate()
            begin
                Rec.Model := '';
                Rec."Registration Date" := 0D;
                Rec."Total Cost" := 0;
                Rec.VIN := '';
            end;
        }
        field(3; Model; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Model';
            TableRelation = Model."Model No." where(Make = field(Make));
            trigger OnValidate()
            var
                Model: Record Model;
            begin
                Model.Reset();
                Model.SetRange(Make, Rec.Make);
                Model.SetRange("Model No.", Rec.Model);
                if Model.FindFirst() then begin
                    Rec."Total Cost" := Model."Total Cost";
                end
                else
                    Rec."Total Cost" := 0;
            end;
        }
        field(4; VIN; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'VIN';
            trigger OnValidate()
            var
                VINRec: Record Vehicle;
            begin
                if VIN <> '' then begin
                    VINRec.SetRange(VIN, Rec.VIN);
                    if VINRec.FindFirst() and (VINRec.VIN = Rec.VIN) then
                        Error('A vehicle with this VIN already exists. Please enter a unique VIN.');
                end;
            end;
        }
        field(5; "Registration Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Registration Date';
        }
        field(6; "Total Cost"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Total Cost';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
