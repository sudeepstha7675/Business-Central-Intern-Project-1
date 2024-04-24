table 50152 "Loan Borrow Entry"
{
    Caption = 'Loan Borrow Entry';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Loan No"; Code[20])
        {
            Caption = 'Loan No';
            DataClassification = CustomerContent;
        }
        field(2; "Transaction Date"; Date)
        {
            Caption = 'Transaction Date';
            DataClassification = CustomerContent;
        }
        field(3; "Borrower ID"; Code[20])
        {
            Caption = 'Borrower ID';
            DataClassification = CustomerContent;
            TableRelation = Customer."No." where("Is Borrower?" = const(true));
        }
        field(4; "Borrower Name"; Text[100])
        {
            Caption = 'Borrower Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Borrower ID")));
        }
        field(5; "Loan Start Date"; Date)
        {
            Caption = 'Loan Start Date';
            DataClassification = CustomerContent;
        }
        field(6; "Loan Amount"; Decimal)
        {
            Caption = 'Loan Amount';
            DataClassification = CustomerContent;
        }
        field(7; "EMI Period"; Integer)
        {
            Caption = 'EMI Period';
            DataClassification = CustomerContent;
        }
        field(8; "EMI Amount"; Decimal)
        {
            Caption = 'EMI Amount';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(9; "Loan End Date"; Date)
        {
            Caption = 'Loan End Date';
            DataClassification = CustomerContent;
        }
        field(10; "Transaction ID"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(11; "Loan No. Series"; Code[20])
        { }
        field(12; "Transaction No series"; Code[20])
        { }
        field(13; Status; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Open,"Schedule Released";
        }
    }
    keys
    {
        key(PK; "Loan No", "Transaction ID", "Borrower ID")
        {
            Clustered = true;
        }
    }
    var
        Getnoseriescode: Record "LMS Setup";
        Noseriesmgmt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        if "Loan No" = '' then begin
            Getnoseriescode.Get();
            Getnoseriescode.TestField("Loan Nos.");
            Noseriesmgmt.InitSeries(Getnoseriescode."Loan Nos.", xRec."Loan No. Series", 0D, "Loan No", "Loan No. Series");
        end;
        if "Transaction ID" = '' then begin
            Getnoseriescode.Get();
            Getnoseriescode.TestField("Transaction Nos.");
            Noseriesmgmt.InitSeries(Getnoseriescode."Transaction Nos.", xRec."Transaction No series", 0D, "Transaction ID", "Transaction No series");
        end;
    end;
}
