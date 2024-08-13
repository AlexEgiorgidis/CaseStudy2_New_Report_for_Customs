namespace CaseStudy.CaseStudy;

using Microsoft.Inventory.Item;

pageextension 90101 "Inventory Posting Groups" extends "Inventory Posting Groups"
{
    layout
    {
        addafter(Description)
        {
            field("Print Out"; Rec."Print Out")
            {
                ApplicationArea = all;
            }
        }
    }
}
