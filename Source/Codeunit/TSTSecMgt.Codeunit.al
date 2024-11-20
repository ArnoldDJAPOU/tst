/// <summary>
/// Codeunit TST Sec Mgt (ID 50100)
/// </summary>
codeunit 50100 "TST Sec_Mgt"
{
    // trigger OnRun()
    // begin

    // end;

    procedure CheckOnBeforePost(GenJournalLine: Record "Gen. Journal Line")
    var
        BankAccount: Record "Bank Account";
    begin
        if (GenJournalLine."Account Type" = GenJournalLine."Account Type"::"Bank Account") then
            if (BankAccount.Get(GenJournalLine."Account No.")) then
                CheckUserBankAccount(BankAccount."No.");

        if (GenJournalLine."Bal. Account Type" = GenJournalLine."Bal. Account Type"::"Bank Account") then
            if (BankAccount.Get(GenJournalLine."Bal. Account No.")) then
                CheckUserBankAccount(BankAccount."No.");

        if (GenJournalLine."Journal Batch Name" <> '') then
            CheckUserSheet(GenJournalLine."Journal Template Name", GenJournalLine."Journal Batch Name");

    end;

    procedure CheckPaymentAuthorizationOnPostingJrnlLine(var GenJrnlLine: Record "Gen. Journal Line")
    var
        GenJrnlTempl: Record "Gen. Journal Template";
    begin
        Setup.Get();
        if (Setup."Active Sheet Security") then
            if (GenJrnlTempl.Get(GenJrnlLine."Journal Template Name")) then
                if (GenJrnlTempl.Type = GenJrnlTempl.Type::Payments) then
                    if (not GenJrnlLine."TST Authorized_payment") then
                        Error(ErrPaymentAutorizationLbl, GenJrnlLine."Line No.");
    end;

    procedure CheckUserBankAccount(BankAccountNo: Code[20])
    var
        BankSec: Record "TST Bank Security";
        ErrMsgLbl: Label 'You are not authorized to use this bank account : %1', Comment = '%1=bank';
    begin
        Setup.Get();
        if (not Setup."Active Bank Security") then
            exit;
        // Error(ErrActiveLbl);

        BankSec.Reset();
        BankSec.SetRange("User ID", UserId);
        BankSec.SetRange(Access, BankSec.Access::"Bank account");
        BankSec.SetRange("Reference Code", BankAccountNo);
        if (BankSec.IsEmpty()) then
            Error(ErrMsgLbl, BankAccountNo);
    end;

    procedure CheckUserSheet(GenJrnltemp: Code[20]; SheetName: Code[20])
    Var
        SheetSec: Record "TST Bank Security";
        ErrMsgLbl: Label 'You are not authorized to use this sheet : %1 - %2', Comment = '%1=sheet, %2=SheetName';
    begin
        Setup.Get();
        if (not Setup."Active Sheet Security") then
            exit;
        // Error(ErrSheetActLbl);

        SheetSec.Reset();
        SheetSec.SetRange("User ID", UserId);
        SheetSec.SetRange(Access, SheetSec.Access::Journal);
        SheetSec.SetRange("Reference Code", GenJrnltemp);
        SheetSec.SetRange("Sheet Name", SheetName);
        if (SheetSec.IsEmpty()) then
            Error(ErrMsgLbl, GenJrnltemp, SheetName);
    end;

    var
        Setup: Record "TST Setup";
        // ErrActiveLbl: Label 'You must activate bank account security';
        // ErrSheetActLbl: Label 'You must activate sheet security';
        ErrPaymentAutorizationLbl: Label 'Line %1 has not been authorized for posting', Comment = '%1=LineNo';
}