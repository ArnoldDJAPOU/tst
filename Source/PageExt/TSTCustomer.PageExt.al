pageextension 50100 TSTCustomer extends "Customer List"
{
    trigger OnOpenPage()
    begin
        Message('Hello welcome!');
    end;

}