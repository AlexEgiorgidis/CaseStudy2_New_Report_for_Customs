namespace CaseStudy_NewReportforCustoms.CaseStudy_NewReportforCustoms;

using Microsoft.Sales.Document;

pageextension 90103 "Sales Order SubformExt" extends "Sales Order Subform"
{
    layout
    {
        addafter(Description)
        {
            field("Price for Cust.Group Exist"; Rec."Price for Cust.Group Exist")
            {
                ApplicationArea = all;
            }
        }
    }
}
