/// <summary>
/// Page TST Sheet_Security (ID 50101).
/// </summary>
page 50101 "TST Sheet_Security"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "TST Bank Security";
    Caption = 'Sheet users';
    SourceTableView = where(Access = const(Journal));

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
                field("Sheet Model"; Rec."Reference Code")
                {
                    Caption = 'Sheet model';
                    ToolTip = 'Specifies the value of the Bank account field.', Comment = '%';
                }
                field("Sheet Name"; Rec."Sheet Name")
                {
                    Caption = 'Sheet name';
                    ToolTip = 'Specifies the value of the Sheet name field.', Comment = '%';
                }

            }
        }
    }
}