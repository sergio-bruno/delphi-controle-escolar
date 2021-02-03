unit U_SelecionaBoletim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrm_SelecionaBoletim = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Rdg_Bimestre: TRadioGroup;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  end;

var
  Frm_SelecionaBoletim: TFrm_SelecionaBoletim;

implementation
                                   
{$R *.dfm}

procedure TFrm_SelecionaBoletim.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end
     else if key = #27 then close;
end;

procedure TFrm_SelecionaBoletim.FormShow(Sender: TObject);
begin
     Rdg_Bimestre.ItemIndex := 0;
end;

end.
