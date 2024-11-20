namespace TSTAllPermission;

permissionset 50101 TSTAllPermission
{
    Assignable = true;
    Permissions = tabledata "TST Bank Security" = RIMD,
        table "TST Bank Security" = X,
        page "TST Bank_Security" = X,
        tabledata "TST Setup" = RIMD,
        table "TST Setup" = X,
        codeunit "TST Sec_Mgt" = X,
        codeunit "TST Subscribe_Post" = X,
        page "TST Sheet_Security" = X;
}