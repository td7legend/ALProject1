namespace ALProject.ALProject;

page 50101 "BSV Item Certification Setup"
{
    ApplicationArea = All;
    Caption = 'BSV Item Certification Setup';
    PageType = List;
    SourceTable = "BSV Item Certification";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Item Code"; Rec."Item Code")
                {
                    ApplicationArea = All;
                }
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                }

                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                }

                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }

                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }

                field("Active"; Rec."Active")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("Active Certification")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    CertificationRec: Record "BSV Item Certification";
                    Today: Date;
                begin
                    Today := Today();
                    if CertificationRec.FindSet then
                        repeat
                            if (CertificationRec."Start Date" <= Today) and (CertificationRec."End Date" >= Today) then
                                CertificationRec."Active" := true
                            else
                                CertificationRec."Active" := false;

                            CertificationRec.Modify;
                        until CertificationRec.Next = 0;
                end;
            }
        }
    }
}

