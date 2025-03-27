namespace ALProject.ALProject;

using Microsoft.Inventory.Item;

pageextension 50101 "Item Card Ext" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("Certification Code"; Rec."Certification Code")
            {
                ApplicationArea = All;

            }
        }
    }
}
