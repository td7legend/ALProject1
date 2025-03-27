namespace ALProject.ALProject;
using Microsoft.Inventory.Item;

report 50100 "BSV Item Certification Report"
{
    Caption = 'BSV Item Certification Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './BSVItemCertificationReport.rdl';
    dataset
    {
        dataitem(BSVItemCertification; "BSV Item Certification")
        {
            column(Today; Today) { }
            column(No_; "Item Code") { }
            column(Name; Description1) { }
            column(TotalCertCount; "TotalCertCount")
            {
            }
            column(ActiveCertCount; "ActiveCertCount")
            {
            }
            column(ExpiredCertCount; "ExpiredCertCount")
            {
            }

            column(Active; Active)
            {

            }
            column(Code; "Code")
            {
            }
            column(Description; Description)
            {
            }
            column(EndDate; "End Date")
            {
            }
            column(ItemCode; "Item Code")
            {
            }
            column(StartDate; "Start Date")
            {
            }
            trigger OnPreDataItem()
            begin
                Today := Today();
            end;

            trigger OnAfterGetRecord()
            var
                RecordItem: Record "Item";
            begin
                ExpiredCertCount := 0;
                ActiveCertCount := 0;
                RecordItem.Get(BSVItemCertification."Item Code");
                Description1 := RecordItem.Description;
                TotalCertCount := 1;
                if ("End Date" < Today()) then
                    ExpiredCertCount := 1
                else
                    ActiveCertCount := 1;
            end;
        }



    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        TotalCertCount: Integer;
        ActiveCertCount: Integer;
        ExpiredCertCount: Integer;
        Today: Date;
        Description1: Text[100];

}


