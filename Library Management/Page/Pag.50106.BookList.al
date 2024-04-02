// page 50106 Booklist
// {
//     Caption = 'Book List';
//     ApplicationArea = All;
//     PageType = List;
//     UsageCategory = Lists;
//     SourceTable = Book;
//     CardPageId = BookCard;

//     layout
//     {
//         area(Content)
//         {
//             repeater(General)
//             {
//                 field("Book ID"; Rec."Book ID")
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field(Title; Rec.Title)
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field(Author; Rec.Author)
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field(Genre; Rec.Genre)
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Is available"; Rec."Is available")
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//             }
//         }
//     }
// }