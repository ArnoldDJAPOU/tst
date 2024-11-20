/// <summary>
/// Table TST Bank Security (ID 50100).
/// </summary>
table 50100 "TST Bank Security"
{
    Caption = 'Bank Security';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "User ID"; Code[50])
        {
            Caption = 'User';
            TableRelation = User."User Name";
            DataClassification = EndUserIdentifiableInformation;
            ValidateTableRelation = false;
            NotBlank = true;

            trigger OnValidate()
            var
                UserMgt: Codeunit "User Selection";
            begin
                UserMgt.ValidateUserName("User ID");
            end;
        }
        field(2; "Reference Code"; Code[50])
        {
            Caption = 'Reference code';
            TableRelation = if (Access = const("Bank account")) "Bank Account"
            else
            if (Access = const(Journal)) "Gen. Journal Template";

        }
        field(3; Access; Enum "TST Access")
        {
            Caption = 'Access';
        }
        field(4; "Sheet Name"; Code[50])
        {
            Caption = 'Sheet name';
            TableRelation = if (Access = const(Journal)) "Gen. Journal Batch".Name where("Journal Template Name" = field("Reference Code"));
        }
    }

    keys
    {
        key(PK; "User ID", Access, "Reference Code", "Sheet Name")
        {
            Clustered = true;
        }
    }

}