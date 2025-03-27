// namespace ALProject.ALProject;

// page 50100 "BSV Item Certification Setup"
// {
//     PageType = List;
//     SourceTable = "BSV Item Certification";
//     ApplicationArea = All;

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field("Item Code"; "Item Code")
//                 {
//                     ApplicationArea = All;
//                 }

//                 field("Code"; "Code")
//                 {
//                     ApplicationArea = All;
//                 }

//                 field("Description"; "Description")
//                 {
//                     ApplicationArea = All;
//                 }

//                 field("Start Date"; "Start Date")
//                 {
//                     ApplicationArea = All;
//                 }

//                 field("End Date"; "End Date")
//                 {
//                     ApplicationArea = All;
//                 }

//                 field("Active"; "Active")
//                 {
//                     ApplicationArea = All;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             action("Active Certification")
//             {
//                 ApplicationArea = All;

//                 trigger OnAction()
//                 var
//                     CertificationRec: Record "BSV Item Certification";
//                     Today: Date;
//                 begin
//                     Today := Today();
//                     if CertificationRec.FindSet then
//                         repeat
//                             if (CertificationRec."Start Date" <= Today) and (CertificationRec."End Date" >= Today) then
//                                 CertificationRec."Active" := true
//                             else
//                                 CertificationRec."Active" := false;

//                             CertificationRec.Modify;
//                         until CertificationRec.Next = 0;
//                 end;
//             }
//         }
//     }
// }
