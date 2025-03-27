namespace ALProject.ALProject;

using Microsoft.Inventory.Item;

tableextension 50100 "Item Ext" extends Item
{
    fields
    {
        field(50100; "Certification Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BSV Item Certification"."Code" WHERE("Active" = const(True));
        }
    }
}
