page 50102 "TST Setup_Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "TST Setup";
    Caption = 'Setup Page';

    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'General';
                field("Active Bank Security"; Rec."Active Bank Security")
                {
                    Caption = 'Bank account security';
                }
                field("Active Sheet Security"; Rec."Active Sheet Security")
                {
                    Caption = 'Payment security';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            // action(ActionName)
            // {

            //     trigger OnAction()
            //     begin

            //     end;
            // }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}