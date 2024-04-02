// table 50105 "Book Loan"
// {
//     Caption = 'Book Loan Details';
//     DataClassification = CustomerContent;

//     fields
//     {
//         field(1; "Transaction ID"; Code[20])
//         {
//             Caption = 'Transacation ID';
//             DataClassification = CustomerContent;
//         }
//         field(2; "Book ID"; Code[20])
//         {
//             Caption = 'Book ID';
//             DataClassification = CustomerContent;
//             TableRelation = Book."Book ID";
//         }
//         field(3; "Member ID"; Code[20])
//         {
//             Caption = 'Member ID';
//             DataClassification = CustomerContent;
//             TableRelation = Member."Member ID";
//         }
//         field(4; "Borrow Date"; Date)
//         {
//             Caption = 'Borrow Date';
//             DataClassification = CustomerContent;
//         }
//         field(5; "Return Date"; Date)
//         {
//             Caption = 'Return Date';
//             DataClassification = CustomerContent;
//         }
//         field(6; Status; Option)
//         {
//             Caption = 'Status';
//             DataClassification = CustomerContent;
//             OptionMembers = Borrowed,Returned;
//         }
//     }
//     keys
//     {
//         key(PK; "Transaction ID")
//         {
//             Clustered = true;
//         }
//     }
// }