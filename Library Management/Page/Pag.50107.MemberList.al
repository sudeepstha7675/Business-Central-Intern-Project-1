// page 50107 MemberList
// {
//     caption = 'Member List';
//     ApplicationArea = All;
//     PageType = List;
//     UsageCategory = Lists;
//     SourceTable = Member;
//     CardPageId = "Member Card";

//     layout
//     {
//         area(Content)
//         {
//             repeater(General)
//             {
//                 field("Member ID"; Rec."Member ID")
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field(Name; Rec.Name)
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field(Email; Rec.Email)
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Membership Date"; Rec."Membership Date")
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//             }
//         }
//     }
// }