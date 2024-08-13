namespace CaseStudy.CaseStudy;

using Microsoft.Inventory.Item;

tableextension 90103 "Inventory Posting Group" extends "Inventory Posting Group"
{
    fields
    {
        field(90100; "Print Out"; Boolean)
        {
            Caption = 'Print Out';
            DataClassification = CustomerContent;
        }
    }
}
