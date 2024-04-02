// page 50108 "Book Borrow List"
// {
//     Caption = 'Book Borrow Detailed List';
//     ApplicationArea = All;
//     PageType = List;
//     UsageCategory = Lists;
//     SourceTable = "Book Loan";

//     layout
//     {
//         area(Content)
//         {
//             repeater(General)
//             {
//                 field("Transaction ID"; Rec."Transaction ID")
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Book ID"; Rec."Book ID")
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Member ID"; Rec."Member ID")
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Borrow Date"; Rec."Borrow Date")
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Return Date"; Rec."Return Date")
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field(Status; Rec.Status)
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//             }
//         }
//     }
// }