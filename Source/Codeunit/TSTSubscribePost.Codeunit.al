codeunit 50101 "TST Subscribe_Post"
{

    // MAJ + Alt + E
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnPostBankAccOnBeforeInitBankAccLedgEntry', '', true, false)]
    local procedure "Gen. Jnl.-Post Line_OnPostBankAccOnBeforeInitBankAccLedgEntry"(var GenJournalLine: Record "Gen. Journal Line"; CurrencyFactor: Decimal; var NextEntryNo: Integer; var NextTransactionNo: Integer; var BankAccPostingGr: Record "Bank Account Posting Group")
    var
        SecMgt: Codeunit "TST Sec_Mgt";
    begin
        SecMgt.CheckOnBeforePost(GenJournalLine);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Check Line", 'OnBeforeRunCheck', '', true, false)]
    local procedure "Gen. Jnl.-Check Line_OnBeforeRunCheck"(var Sender: Codeunit "Gen. Jnl.-Check Line"; var GenJournalLine: Record "Gen. Journal Line")
    var
        SecMgt: Codeunit "TST Sec_Mgt";
    begin
        SecMgt.CheckPaymentAuthorizationOnPostingJrnlLine(GenJournalLine);
    end;

}