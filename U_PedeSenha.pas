unit U_PedeSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, Db, ExtCtrls;

type
  TFrm_PedeSenha = class(TForm)
    Grb_Cliente: TGroupBox;
    Lbl_Login: TLabel;
    Lbl_Senha: TLabel;
    Mke_Login: TMaskEdit;
    Mke_Senha: TMaskEdit;
    Btb_Ok: TBitBtn;
    Btb_Cancelar: TBitBtn;
    Img_Login: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Btb_CancelarClick(Sender: TObject);
    function  MostraForm: word;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Mke_LoginExit(Sender: TObject);
    procedure Mke_SenhaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    public    wAcessoTemporario: boolean;
  end;

var Frm_PedeSenha: TFrm_PedeSenha;
    wSairClick   : boolean; // variavel para saber se o botao sair foi clicado

implementation

uses U_Funcoes, U_Modulo, U_Principal;

{$R *.DFM}

//------------------------------------------------------------------------------
function TFrm_PedeSenha.MostraForm: word;
//------------------------------------------------------------------------------
begin Result := ShowModal;
end;

//------------------------------------------------------------------------------
procedure TFrm_PedeSenha.FormKeyPress(Sender: TObject; var Key: Char);
//------------------------------------------------------------------------------
begin
     if (key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end
     else if (Key = #27) then Close;
end;

//------------------------------------------------------------------------------
procedure TFrm_PedeSenha.FormShow(Sender: TObject);
//------------------------------------------------------------------------------
begin
     Frm_PedeSenha.Caption  := Frm_Principal.wNomeEmpresa;
     wSairClick     := false;
     wAcessoTemporario   := false;
     Mke_Login.Text := '';
     Mke_Senha.Text := '';
     Mke_Login.SetFocus;
end;

//------------------------------------------------------------------------------
procedure TFrm_PedeSenha.Btb_CancelarClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     wSairClick := true;
end;

//------------------------------------------------------------------------------
procedure TFrm_PedeSenha.FormCloseQuery(Sender: TObject;var CanClose: Boolean);
//------------------------------------------------------------------------------
var wLogin, wSenha : string;
begin
     if not wSairClick then
     begin
          CanClose := false;
          wLogin := Trim(Mke_Login.Text);
          wSenha := Trim(Mke_Senha.Text);
          if (wLogin = '') then
          begin
               MessageDlg('É necessário informar o login do usuário.',
               mtInformation,[mbOk], 0);
               Mke_Login.SetFocus;
          end
          else if wSenha = '' then
          begin
               MessageDlg('É necesário informar a senha.', mtInformation,[mbOk],
               0);
               Mke_Senha.SetFocus;
          end
          else CanClose    := true;
     end
     else CanClose := true;
end;

//------------------------------------------------------------------------------
procedure TFrm_PedeSenha.Mke_LoginExit(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if Trim(Mke_Login.Text) <> '' then
        if not afuncoes.LocalizaIndice(frm_modulo.IBQ_funcoes,
        'select * from tb_usuario','where usualogi=:wusualogi',[Mke_Login.Text])
        then
        begin
             MessageDlg('Login Recusado, Usuário Desconhecido...',
             mtInformation,[mbOk], 0);
             Mke_Login.setfocus;
        end;
end;

//------------------------------------------------------------------------------
procedure TFrm_PedeSenha.Mke_SenhaExit(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if (Trim(Mke_Login.Text) <> '') and (Trim(Mke_Senha.Text) <> '') then
     begin
          if afuncoes.LocalizaIndice(frm_modulo.IBQ_funcoes,
          'select * from tb_usuario','where usualogi=:wusualogi',[
          Mke_Login.Text]) then
          begin
               if frm_modulo.IBQ_funcoes.FieldByName('usuasenh').asstring <>
               Mke_Senha.Text then
               begin
                    MessageDlg('Login Recusado, Senha inválida...',
                    mtInformation,[mbOk], 0);
                    Mke_Senha.setfocus;
               end
               else
               case frm_modulo.IBQ_funcoes.FieldByName('usuaactt').asinteger of
                    0: wAcessoTemporario := true;
                    1: wAcessoTemporario := false;
               end;
          end;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_PedeSenha.FormClose(Sender: TObject; var Action: TCloseAction);
//------------------------------------------------------------------------------
begin
     frm_modulo.IBQ_funcoes.close;
end;

end.
