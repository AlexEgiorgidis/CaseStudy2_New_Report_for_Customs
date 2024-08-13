namespace CaseStudy.CaseStudy;

using Microsoft.Sales.History;
using AlexEgiorgidis.CustomerName.SampleCore;

pageextension 90102 "Posted Sales Invoice" extends "Posted Sales Invoice"
{
    actions
    {
        addafter(Print)
        {
            action(PrintForCustoms)
            {
                ApplicationArea = all;
                Caption = '&Print Customs';
                Ellipsis = true;
                Image = Print;
                trigger OnAction()
                begin
                    // SalesInvHeader := Rec;
                    // CurrPage.SetSelectionFilter(SalesInvHeader);
                    Report.run(Report::"CustomSales Invoice", true, false, Rec);
                end;
            }
        }
    }
}

