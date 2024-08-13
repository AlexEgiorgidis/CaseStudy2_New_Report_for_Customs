namespace CaseStudy_NewReportforCustoms.CaseStudy_NewReportforCustoms;

using Microsoft.Inventory.Item;
using Microsoft.Sales.Document;
using Microsoft.Sales.Pricing;


codeunit 90100 "Item Subscribers"
{
    [EventSubscriber(ObjectType::Table, Database::Item, OnAfterValidateEvent, "Inventory Posting Group", false, false)]
    local procedure OnAfterValidateEventChecknetWeightAgainstInvpostingGroup(var Rec: Record Item)
    var
        InvPostGr: record "Inventory Posting Group";
    begin
        if Rec."Inventory Posting Group" = '' then
            exit;
        InvPostGr.Get(Rec."Inventory Posting Group");
        if InvPostGr."Print Out" then begin
            if Rec."Net Weight" = 0 then
                Message('Please make sure you assign a value for %1', Rec.FieldCaption("Net Weight"));
        end;
    end;


    [EventSubscriber(ObjectType::Page, Page::"Item Card", OnBeforeOnOpenPage, '', false, false)]
    local procedure mynameisAlex(var Item: Record Item)
    var
        InvPostGr: record "Inventory Posting Group";
    begin
        if Item."Inventory Posting Group" = '' then
            exit;
        InvPostGr.Get(Item."Inventory Posting Group");
        if InvPostGr."Print Out" then begin
            if Item."Net Weight" = 0 then
                Message('Please make sure you assign a value for %1 !!!!', Item.FieldCaption("Net Weight"));
        end;
    end;


    // [EventSubscriber(ObjectType::Page, Page::"Item Card", OnQueryClosePageEvent, '', false, false)]
    // local procedure MakeSureTheUserIsNotStupid(var Rec: Record Item; var AllowClose: Boolean)
    // var
    //     InvPostGr: record "Inventory Posting Group";
    // begin
    //     if Rec."Inventory Posting Group" = '' then
    //         exit;
    //     InvPostGr.Get(Rec."Inventory Posting Group");
    //     if InvPostGr."Print Out" then begin
    //         if Rec."Net Weight" = 0 then
    //             AllowClose := false;
    //     end;
    // end;




    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "No.", false, false)]
    local procedure OnAfterValidateEvetnCheckSalesPrice(var Rec: Record "Sales Line")
    var
        SalesPrice: record "Sales Price";
        Item: record Item;
    begin
        Rec."Price for Cust.Group Exist" := false;
        if Rec."Document Type" in [Rec."Document Type"::Order, Rec."Document Type"::Invoice] then begin
            if Rec.Type <> Rec.Type::Item then
                exit;
            if not Item.Get(Rec."No.") then
                exit;
            SalesPrice.Reset();
            SalesPrice.SetRange("Item No.", Item."No.");
            SalesPrice.SetFilter("Starting Date", '%1|<=%2', 0D, Today());
            SalesPrice.SetRange("Sales Type", SalesPrice."Sales Type"::"Customer Price Group");
            SalesPrice.SetRange("Sales Code", Rec."Customer Price Group");
            if SalesPrice.FindFirst() then begin
                Rec."Price for Cust.Group Exist" := true;
                // Rec.Modify(false);
            end;
        end;
    end;
}
