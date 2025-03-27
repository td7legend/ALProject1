table 50100 "BSV Item Certification"
{
    Caption = 'BSV Item Certification';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item"."No.";
        }

        field(2; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(3; "Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(4; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(5; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(6; "Active"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Item Code", "Code")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        Today: Date;
    begin
        Today := Today();
        if ("Start Date" <= Today) and ("End Date" >= Today) then
            "Active" := true
        else
            "Active" := false;
    end;
}
