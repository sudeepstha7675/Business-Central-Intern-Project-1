// table 50103 Book
// {
//     Caption = 'Book';
//     DataClassification = CustomerContent;

//     fields
//     {
//         field(1; "Book ID"; Code[20])
//         {
//             Caption = 'Book ID';
//             DataClassification = CustomerContent;
//             // trigger OnValidate()
//             // var
//             //     NoseriesMgmt: Codeunit NoSeriesManagement;
//             //     BookIDSetup: Record "Library Mgmt";
//             // begin
//             //     if "Book ID" = ''then begin
//             //         BookIDSetup.Get();
//             //         NoseriesMgmt.GetNextNo(BookIDSetup.BookID,0D)
//             //     end;
//             //     end;
//             // end;
//         }
//         field(2; Title; Text[100])
//         {
//             Caption = 'Title';
//             DataClassification = CustomerContent;
//         }
//         field(3; Author; Text[50])
//         {
//             Caption = 'Author';
//             DataClassification = CustomerContent;
//         }
//         field(4; Genre; Option)
//         {
//             Caption = 'Genre';
//             DataClassification = CustomerContent;
//             OptionMembers = "",Fiction,"Non-Fiction",Science,Hoistory;
//         }
//         field(5; "Is available"; Boolean)
//         {
//             Caption = 'Is Avaailable?';
//             DataClassification = CustomerContent;
//         }
//     }
//     keys
//     {
//         key(PK; "Book ID")
//         {
//             Clustered = true;
//         }
//     }
// }