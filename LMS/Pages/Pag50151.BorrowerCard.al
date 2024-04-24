page 50151 "Borrower Card"
{
    ApplicationArea = All;
    Caption = 'Borrower Card';
    PageType = Card;
    SourceTable = Customer;

    layout
    {

        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the customer''s name.';
                }
                field("Is Borrower?"; Rec."Is Borrower?")
                {
                    ToolTip = 'Specifies the value of the Is Borrower? field.';
                }
            }
            group("Address & Contact Details")
            {
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the customer''s address. This address will appear on all sales documents for the customer.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ToolTip = 'Specifies additional address information.';
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the customer''s city.';
                }
                field(County; Rec.County)
                {
                    ToolTip = 'Specifies the state, province or county as a part of the address.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ToolTip = 'Specifies the country/region of the address.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the customer''s email address.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the customer''s telephone number.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Create New Loan Record")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    Runmakeloanentry: Record "Loan Borrow Entry";
                    Runmakeloanentrypage: Page "Open Loan Record";
                begin
                    Runmakeloanentry.SetFilter("Borrower ID", Rec."No.");
                    Runmakeloanentrypage.SetTableView(Runmakeloanentry);
                    Runmakeloanentrypage.Run();
                end;
            }
            action("Create New EMI Payment Record")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    runmakeemipaymententry: Record EMIPaymentEntry;
                    runmakeemipaymententrypage: Page "Open EMI Payment Record";
                begin
                    runmakeemipaymententry.SetRange("Borrower ID", Rec."No.");
                    runmakeemipaymententrypage.SetTableView(runmakeemipaymententry);
                    runmakeemipaymententrypage.Run();
                end;
            }
            action("Open Posted Loan Entry")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    Runmakeloanentry: Record "Posted Loan Borrow Entry";
                    Runmakeloanentrypage: Page "Posted Loan Record";
                begin
                    Runmakeloanentry.SetFilter("Borrower ID", Rec."No.");
                    Runmakeloanentrypage.SetTableView(Runmakeloanentry);
                    Runmakeloanentrypage.Run();
                end;
            }
            action("Open Posted EMI Payment Entry")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    Runmakeloanentry: Record PostedEMIPaymentEntry;
                    Runmakeloanentrypage: Page "Posted EMI Payment Record";
                begin
                    Runmakeloanentry.SetFilter("Borrower ID", Rec."No.");
                    Runmakeloanentrypage.SetTableView(Runmakeloanentry);
                    Runmakeloanentrypage.Run();
                end;

            }
            action("Open Detailed Loan Entries")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    rundetailedrecord: Record "Loan Transaction Details";
                    rundetailedpage: Page "Open Detailed Loan Entries";
                begin
                    rundetailedrecord.SetFilter("Borrower ID", Rec."No.");
                    rundetailedpage.SetTableView(rundetailedrecord);
                    rundetailedpage.Run();
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Category5)
            {
                Caption = 'Posted Loan Record';
                actionref(Open_Posted_Loan_Record_Promoted; "Open Posted Loan Entry")
                { }
                actionref(Open_EMI_Payment_Record_Promoted; "Open Posted EMI Payment Entry")
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Make New Entry';
                actionref(New_Loan_Entry_Primoted; "Create New Loan Record")
                { }
                actionref(Create_New_EMI_Payment_Record_Promoted; "Create New EMI Payment Record")
                { }
            }
            group(Category_Category6)
            {
                Caption = 'Open Related Record';
                actionref(Open_Detailed_Loan_Entries_Promoted; "Open Detailed Loan Entries")
                { }
            }
        }
    }

    trigger OnNewRecord(IsBorrowerxRec: Boolean)
    begin
        Rec."Is Borrower?" := true;
    end;
}
