tableextension 50150 CustomerTableExtension extends Customer

{
    fields
    {
        field(50150; "Is Borrower?"; Boolean)
        {
            Caption = 'Is Borrower?';
            DataClassification = CustomerContent;
        }
        field(50151; "Total Loan Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Loan Transaction Details"."Transaction Amount" where("Document Type" = const('Loan Borrow Entry'), "Borrower ID" = field("No.")));
        }
        field(50152; "Total EMI Paid TD"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Loan Transaction Details"."Transaction Amount" where("Document Type" = const('EMI Payment Entry'), "Borrower ID" = field("No.")));
        }
        field(50153; "Remaining EMI"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Loan Transaction Details"."Transaction Amount" where ("Borrower ID" = field("No.")));
        }
    }
}
