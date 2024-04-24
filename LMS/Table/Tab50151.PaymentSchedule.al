table 50151 "Payment Schedule"
{
    Caption = 'Payment Schedule';
    DataClassification = CustomerContent;

    fields
    {
        field(1; Period; Integer)
        {
            Caption = 'Period';
        }
        field(2; "Payment Date"; Date)
        {
            Caption = 'Payment Date';
        }
        field(3; "Paid?"; Option)
        {
            Caption = 'Paid?';
            OptionMembers = No,Yes;
        }
        field(4; "Loan No."; Code[20])
        {
            TableRelation = "Loan Transaction Details"."Loan No";
        }
    }
    keys
    {
        key(PK; "Loan No.", Period)
        {
            Clustered = true;
        }
    }
}
