/// <summary>
/// Page TST Bank_Security (ID 50100).
/// </summary>
page 50100 "TST Bank_Security"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "TST Bank Security";
    Caption = 'Bank account users';
    SourceTableView = where(Access = const("Bank account"));

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("User ID"; Rec."User ID")
                {
                    LookupPageId = "User Lookup";
                    Caption = 'User';
                    ToolTip = 'Specifies the value of the User field.', Comment = '%';
                }
                field("Bank Account"; Rec."Reference Code")
                {
                    Caption = 'Bank account';
                    ToolTip = 'Specifies the value of the Bank account field.', Comment = '%';
                }

            }
        }
    }
}