unit U_Login;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, jpeg, ExtCtrls,db, Mask, Menus, Buttons;

type
  TFrm_Login = class(TForm)
    EdNome: TEdit;
    EdSenha: TEdit;
    Btn_OK: TButton;
    Btn_Cancelar: TButton;
    Pnl_Mensagem: TPanel;
    Grb_1: TGroupBox;
    Lbl_nome: TLabel;
    Lbl_senha: TLabel;
    Grb_2: TGroupBox;
    Mke_DataSys: TMaskEdit;
    Img_Login: TImage;
    procedure Btn_CancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Btn_OKClick(Sender: TObject);
    procedure Mke_DataSysExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  end;

var
  Frm_Login: TFrm_Login;

implementation

uses U_Principal, U_modulo, U_Funcoes;

var contador:integer;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TFrm_Login.Btn_CancelarClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     Frm_Principal.close;
end;

//------------------------------------------------------------------------------
procedure TFrm_Login.FormShow(Sender: TObject);
//------------------------------------------------------------------------------
begin
     edNome.setfocus;
     Mke_DataSys.Text:=DateToStr(now);
end;

//------------------------------------------------------------------------------
procedure TFrm_Login.Btn_OKClick(Sender: TObject);
//------------------------------------------------------------------------------
var ValorSenha: string;
begin
  if not aFuncoes.ValidaData(Mke_DataSys.Text) then
     Mke_DataSys.Setfocus;
  aFuncoes.SystemDateTime(StrToDate(Mke_DataSys.Text),time);
  if not afuncoes.LocalizaIndice(frm_modulo.IBQ_funcoes,
  'select * from tb_usuario','where usualogi=:wusualogi',[ednome.text]) then
  begin
    Pnl_Mensagem.Caption:='Login Recusado, Usuário Desconhecido...';
    inc(Contador);
    if contador=4 then
      Frm_Principal.close;
    ednome.setfocus;
    Exit;
  end;
  ValorSenha:=frm_modulo.IBQ_funcoes.fieldbyname('usuasenh').asString;
  if valorsenha <> EdSenha.Text then
  begin
    Pnl_Mensagem.Caption:='Login Recusado, Senha Inválida...';
    inc(Contador);
    if Contador=4 then
      Frm_Principal.close;
    edsenha.setfocus;
    Exit;
  end;

  Frm_Principal.enabled := true;
  Frm_Principal.Stb_Principal.Panels[2].Text := 'USUÁRIO: '+EdNome.Text;
  Frm_Principal.wLogin := EdNome.Text;
  Frm_login.release;
end;

//------------------------------------------------------------------------------
procedure TFrm_Login.Mke_DataSysExit(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if not aFuncoes.ValidaData(Mke_DataSys.Text) then
        Mke_DataSys.Setfocus;
end;

//------------------------------------------------------------------------------
procedure TFrm_Login.FormKeyPress(Sender: TObject; var Key: Char);
//------------------------------------------------------------------------------
begin
     if (key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end;
end;

end.
