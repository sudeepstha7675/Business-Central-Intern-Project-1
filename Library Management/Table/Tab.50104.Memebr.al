// table 50104 Member
// {
//     Caption = 'Member';
//     DataClassification = CustomerContent;

//     fields
//     {
//         field(1; "Member ID"; Code[20])
//         {
//             caption = 'Member ID';
//             DataClassification = CustomerContent;
//         }
//         field(2; Name; Text[100])
//         {
//             Caption = 'Name';
//             DataClassification = CustomerContent;
//         }
//         field(3; Email; Text[50])
//         {
//             Caption = 'Email';
//             DataClassification = CustomerContent;
//             ExtendedDatatype = EMail;
//         }
//         field(4; "Membership Date"; Date)
//         {
//             Caption = 'Membership Date';
//             DataClassification = CustomerContent;
//         }
//     }
//     keys
//     {
//         key(PK; "Member ID")
//         {
//             Clustered = true;
//         }
//     }
// }