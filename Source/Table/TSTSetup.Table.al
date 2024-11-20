table 50101 "TST Setup"
{
    DataClassification = CustomerContent;
    Caption = 'Setup';

    fields
    {
        field(1; "Pk"; Code[10])
        {
            Caption = 'Pk';
        }
        field(2; "Active Bank Security"; Boolean)
        {
            Caption = 'Bank account security';
        }
        field(3; "Active Sheet Security"; Boolean)
        {
            Caption = 'Sheet security';
        }
    }

    keys
    {
        key(PK; "Pk")
        {
            Clustered = true;
        }
    }


    // var
    //     ReadData: Boolean;

    // procedure GetData()
    // begin
    //     if ReadData then
    //         exit;
    //     Get();
    //     ReadData := true;
    // end;

}