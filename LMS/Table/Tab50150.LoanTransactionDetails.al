table 50150 "Loan Transaction Details"
{
    Caption = 'Loan Transaction Details';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Open Detailed Loan Entries";

    fields
    {
        field(1; "Loan No"; Code[20])
        {
            Caption = 'Loan No';
            DataClassification = CustomerContent;
        }
        field(2; "Borrower ID"; Code[20])
        {
            Caption = 'Borrower ID';
            DataClassification = CustomerContent;
        }
        field(3; "Transaction Amount"; Decimal)
        {
            Caption = 'Transaction Amount';
            DataClassification = CustomerContent;
        }
        field(4; "EMI Period"; Integer)
        {
            Caption = 'EMI Period';
            DataClassification = CustomerContent;
        }
        field(5; "EMI Amount"; Decimal)
        {
            Caption = 'EMI Amount';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(6; "Loan Start Date"; Date)
        {
            Caption = 'Loan Start Date';
            DataClassification = CustomerContent;
        }
        field(7; "loan End Date"; Date)
        {
            Caption = 'Loan End Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(8; "Document Type"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(9; "Transaction Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(11; "Expected Payment Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(12; "Borrower Name"; Text[100])
        {
        }
        field(13; "Fine Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(14; "Transaction ID"; Code[20])
        {
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Loan No","Transaction ID",  "Borrower ID" )
        {
            Clustered = true;
        }
    }
}
