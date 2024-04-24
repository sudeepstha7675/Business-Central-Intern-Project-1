page 50150 "Borrower List"
{
    ApplicationArea = All;
    Caption = 'Borrower List';
    PageType = List;
    SourceTable = Customer;
    SourceTableView = sorting("No.") where("Is Borrower?" = const(true));
    UsageCategory = Lists;
    CardPageId = "Borrower Card";
    Editable = false;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';
                    LookupPageId = "Borrower Card";
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the customer''s name.';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the customer''s address. This address will appear on all sales documents for the customer.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ToolTip = 'Specifies the customer''s mobile telephone number.';
                }
                field("Total Loan Amount"; Rec."Total Loan Amount")
                {
                }
                field("Total EMI Paid TD"; Rec."Total EMI Paid TD")
                { }
                field("Remaining EMI"; Rec."Remaining EMI")
                { }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("LMS Report")
            {
                trigger OnAction()
                begin
                    Report.Run(Report::"LMS Report");
                end;

            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(LMS_Report_Promoted; "LMS Report")
                { }
            }
        }
    }
}
