namespace CaseStudy_NewReportforCustoms.CaseStudy_NewReportforCustoms;

using Microsoft.Inventory.Item;


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
}
