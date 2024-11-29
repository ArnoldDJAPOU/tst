table 50102 "TSTRequisition"
{
    Caption = 'Requisition';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Enum "TST Requisition Type")
        {
            Caption = 'Document Type';
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(3; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(5; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(6; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(7; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(8; "External Doc No"; Code[30])
        {
            Caption = 'External Doc. Number';
        }
        field(9; "Reason for rejection"; Text[100])
        {
            Caption = 'Reason for rejection';
        }
        field(10; "Purchase Type"; Option)
        {
            Caption = 'Purchase Type';
            OptionMembers = Item,Service,Intellectual;
            OptionCaption = 'Material/Item,Service,Intellectual service';
        }
        field(11; "Item Type"; Option)
        {
            Caption = 'Item Type';
            OptionMembers = FA,Item,NonItem,Others;
            OptionCaption = 'Fixed Asset,Item,Non Item,Others';
        }
        field(12; "Processing Status"; Option)
        {
            Caption = 'Processing Status';
            OptionMembers = " ","Partially processed","Totally processed";
            OptionCaption = ' ,Partially processed,Totally processed';
            Editable = false;
        }
        field(13; "Status"; Enum TSTPurchReqStatus)
        {
            Caption = 'Status';
            Editable = false;
        }
        field(14; "PR Type"; Enum TSTPurchReqType)
        {
            Caption = 'Purchase Requisition Type';
        }
        field(15; "PO Type"; Enum TSTPurchOrderType)
        {
            Caption = 'Purchase Order Type';
        }
        field(16; "Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(17; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(18; "User ID"; Code[50])
        {
            Caption = 'Requestor';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
        }
        field(19; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false));
        }
        field(20; "Delivery Status"; Enum TSTPRDeliveryStatus)
        {
            Caption = 'Delivery Status';
            Editable = false;
        }
        field(21; "Amount (LCY)"; Decimal)
        {
            Caption = 'Amount (LCY)';
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Editable = false;
            // FieldClass = FlowField;
        }
        field(22; "Amount Including VAT"; Decimal)
        {
            Caption = 'Amount Including VAT';
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Editable = false;
            // FieldClass = FlowField;
        }
        field(23; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
        }
        field(24; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
        }
        field(25; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.")
        {
            Clustered = true;
        }
    }


    var
    // myInt: Integer;


}