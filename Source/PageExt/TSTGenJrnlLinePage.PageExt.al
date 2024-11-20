pageextension 50101 "TST GenJrnlLine_Page" extends "Payment Journal"
{
    layout
    {
        addafter("Payment Method Code")
        {
            field("TST Authorized_payment"; Rec."TST Authorized_payment")
            {
                Caption = 'Authorized payment';
                ApplicationArea = Suite;

                trigger OnValidate()
                begin
                    UserSetup.Get(UserId);
                    if (not UserSetup."TST Can_AuthorizedPayment") then
                        Error(MsgLbl);

                    if (Rec."TST Authorized_payment") then
                        Rec.TestField("External Document No.");
                end;
            }
        }
    }
    var
        UserSetup: Record "User Setup";
        MsgLbl: Label 'You are not authorized to modify this field.';
}