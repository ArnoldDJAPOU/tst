tableextension 50101 "TST User_Setup" extends "User Setup"
{
    fields
    {
        field(50100; "TST Can_AuthorizedPayment"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Authorized payment';
        }
    }
}