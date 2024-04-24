report 50150 "LMS Report"
{
    ApplicationArea = All;
    Caption = 'LMS Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = EXCEL;
    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = sorting("No.") where("Is Borrower?" = const(true));
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(Address; Address)
            {
            }
            column(Address2; "Address 2")
            {
            }
            column(TotalLoanAmount; "Total Loan Amount")
            {
            }
            column(TotalEMIPaidTD; "Total EMI Paid TD")
            {
            }
            column(RemainingEMI; "Remaining EMI")
            {
            }
            column(compname; compname)
            { }
            column(compaddress; compaddress)
            { }
            column(reportname; reportname)
            { }
            trigger OnPreDataItem()
            var
                compinfo: Record "Company Information";
            begin
                compinfo.get();
                compname := compinfo.Name;
                compaddress := compinfo.Address;
                reportname := 'LMS Report';
            end;
        }
    }
    rendering
    {
        layout(EXCEL)
        {
            Type = Excel;
            LayoutFile = 'LMSReport.xlsx';
        }

    }
    var
        compname, compaddress, reportname : text[100];
}
