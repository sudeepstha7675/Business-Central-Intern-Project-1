table 50101 Model
{
    Caption = 'Model';
    DataClassification = CustomerContent;

    fields
    {
        field(1; Make; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Make';
            TableRelation = Make.Code;
        }
        field(2; "Model No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Model No.';
        }
        field(3; Decription; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Decription';
        }
        field(4; "Vehicle Type"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Vehicle Type';
            OptionMembers = " ",Bike,Scooter,Car,Bus,Truck;
        }
        field(5; "Fuel Type"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Fuel Type';
            OptionMembers = " ",Diesel,Petrol,Electric;
        }
        field(6; Cost; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Cost';
        }
        field(7; "Custom Duty"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Custom Duty';
            trigger OnValidate()
            begin
                VAT := (Cost + "Custom Duty") * 13 / 100;
                "Total Cost" := "Custom Duty" + "Custom Duty" + VAT;
            end;
        }
        field(8; VAT; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'VAT';
        }
        field(9; "Total Cost"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Total Cost';
        }
    }
    keys
    {
        key(PK; Make, "Model No.")
        {
            Clustered = true;
        }
    }
}
