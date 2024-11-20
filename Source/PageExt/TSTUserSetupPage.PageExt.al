pageextension 50102 "TST UserSetup_Page" extends "User Setup"
{
    layout
    {
        addafter("Time Sheet Admin.")
        {
            field("TST Can_AuthorizedPayment"; Rec."TST Can_AuthorizedPayment")
            {
                Caption = 'Can Authorized payment';
                ApplicationArea = Basic, Suite;
            }
        }
    }

}