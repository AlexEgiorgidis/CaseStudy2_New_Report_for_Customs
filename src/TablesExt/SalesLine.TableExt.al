namespace CaseStudy_NewReportforCustoms.CaseStudy_NewReportforCustoms;

using Microsoft.Sales.Document;

tableextension 90101 "Sales Line" extends "Sales Line"
{
    fields
    {
        field(90100; "Price for Cust.Group Exist"; Boolean)
        {
            Caption = 'Price for Cust.Group Exist';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
}
