table 50156 PostedEMIPaymentEntry
{
    Caption = 'EMIPaymentEntry';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Loan No"; Code[20])
        {
            Caption = 'Loan No';
            DataClassification = CustomerContent;
            // TableRelation = "Loan Borrow Entry"."Loan No" where("Borrower ID" = field("Borrower ID"));
        }
        field(2; "Borrower ID"; Code[20])
        {
            Caption = 'Borrower ID';
            DataClassification = CustomerContent;
        }
        field(3; "Borrower Name"; Text[100])
        {
            Caption = 'Borrower Name';
            // FieldClass = FlowField;
            // CalcFormula = lookup(Customer.Name where("No." = field("Borrower ID")));
        }
        field(4; "Transaction Date"; Date)
        {
            Caption = 'Transaction Date';
            DataClassification = CustomerContent;
        }
        field(5; "EMI Payment Amount"; Decimal)
        {
            Caption = 'EMI Payment Amount';
            DataClassification = CustomerContent;
        }
        field(6; "Fine Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(7; "Transaction ID"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(8; Period; Integer)
        {
            DataClassification = CustomerContent;
            // TableRelation = "Payment Schedule".Period where("Loan No." = field("Loan No"));
        }
        field(9; "Expected Payment Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(10; "Transaction No Series"; Code[20])
        {
        }
    }
    keys
    {
        key(PK; "Loan No", "Transaction ID", "Borrower ID")
        {
            Clustered = true;
        }
    }
    // var
    // getnoseriescode: Record "LMS Setup";
    // noseriesmgmt: Codeunit NoSeriesManagement;
    // trigger OnInsert()
    // begin
    //     if "Transaction ID" = '' then
    //     getnoseriescode.Get();
    //     getnoseriescode.TestField("Transaction Nos.");
    //     noseriesmgmt.InitSeries(getnoseriescode."Transaction Nos.",xRec."Transaction No Series",0D,"Transaction ID","Transaction No Series");
    // end;
}
