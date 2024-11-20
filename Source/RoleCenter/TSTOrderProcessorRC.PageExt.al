pageextension 50100 "TST Order Processor_RC" extends "Order Processor Role Center"
{
    layout
    {
        // Add changes to page layout here

    }

    actions
    {
        addafter("Posted Documents")
        {
            group(TST_Mod)
            {
                Caption = 'MOD';
                Image = Administration;
                action("TST Setup")
                {
                    Caption = 'Setup';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "TST Setup_Page";
                }
                separator("TST Sep")
                {
                    Caption = '**************';
                }

                action("TST BankAccount_User")
                {
                    Caption = 'Bank account user';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "TST Bank_Security";
                }
                action("TST Sheet_User")
                {
                    Caption = 'Sheet user';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "TST Sheet_Security";
                }

            }
        }

    }

}