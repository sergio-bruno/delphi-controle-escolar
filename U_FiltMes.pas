unit U_FiltMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrm_FiltMes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel3: TPanel;
    Cmb_mes: TComboBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  end;

var
  Frm_FiltMes: TFrm_FiltMes;

implementation

{$R *.dfm}

procedure TFrm_FiltMes.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end
     else if key = #27 then close;
end;

procedure TFrm_FiltMes.FormShow(Sender: TObject);
begin
     Cmb_mes.ItemIndex := 0;
end;

end.
