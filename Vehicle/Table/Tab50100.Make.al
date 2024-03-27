table 50100 Make
{
    Caption = 'Make';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(4; "Country Code"; Code[20])
        {
            Caption = 'Country Code';
            TableRelation = "Country/Region".Code;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
