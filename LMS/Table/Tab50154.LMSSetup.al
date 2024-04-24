table 50154 "LMS Setup"
{
    Caption = 'LMS Setup';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
        }
        field(2; "Transaction Nos."; Code[20])
        {
            Caption = 'Transaction Nos.';
        }
        field(3; "Loan Nos."; Code[20])
        {
            Caption = 'Loan Nos.';
        }
        field(4; "Delayed Interest Rate (%)"; Decimal)
        {
            Caption = 'Delayed Interest Rate (%)';
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
