unit U_PedeSenhaFuncUsua;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, Db, ExtCtrls;

type
  TFrm_PedeSenhaFuncUsua = class(TForm)
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
    public    wAcessoTemporario : boolean;
              wxprofessor : string;
  end;

var Frm_PedeSenhaFuncUsua: TFrm_PedeSenhaFuncUsua;
    wSairClick   : boolean; // variavel para saber se o botao sair foi clicado

implementation

uses U_Funcoes, U_Modulo, U_Principal;

{$R *.DFM}

//------------------------------------------------------------------------------
function TFrm_PedeSenhaFuncUsua.MostraForm: word;
//------------------------------------------------------------------------------
begin Result := ShowModal;
end;

//------------------------------------------------------------------------------
procedure TFrm_PedeSenhaFuncUsua.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TFrm_PedeSenhaFuncUsua.FormShow(Sender: TObject);
//------------------------------------------------------------------------------
begin
     Frm_PedeSenhaFuncUsua.Caption  := Frm_Principal.wNomeEmpresa;
     wSairClick                     := false;
     wAcessoTemporario              := false;
     Mke_Login.Text                 := '';
     Mke_Senha.Text                 := '';
     Mke_Login.SetFocus;
end;

//------------------------------------------------------------------------------
procedure TFrm_PedeSenhaFuncUsua.Btb_CancelarClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     wSairClick := true;
end;

//------------------------------------------------------------------------------
procedure TFrm_PedeSenhaFuncUsua.FormCloseQuery(Sender: TObject;var CanClose: Boolean);
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
procedure TFrm_PedeSenhaFuncUsua.Mke_LoginExit(Sender: TObject);
//------------------------------------------------------------------------------
var wAchouUsua, wAchouAgen : boolean;
begin
     if Trim(Mke_Login.Text) <> '' then
     begin
          wAchouUsua := false;
          wAchouAgen := false;
          // LOCALIZAR EM TB_USUARIO
          if afuncoes.LocalizaIndice(frm_modulo.IBQ_funcoes,
          'select * from tb_usuario','where usualogi=:wl',[Mke_Login.Text])
          then wAchouUsua := true;

          // TENTAR LOCALIZAR O PROFESSOR
          if not wAchouUsua then
          begin
             if afuncoes.LocalizaIndice(frm_modulo.IBQ_funcoes,
             'select * from tb_funcionario','where agencodg=:wc',[Mke_Login.Text])
             then wAchouAgen := true;
          end;

          if not (wAchouAgen) and not (wAchouUsua) then
          begin
               MessageDlg('Login Recusado, Usuário Desconhecido...',
               mtInformation,[mbOk], 0);
               Mke_Login.setfocus;
          end;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_PedeSenhaFuncUsua.Mke_SenhaExit(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if (Trim(Mke_Login.Text) <> '') and (Trim(Mke_Senha.Text) <> '') then
     begin
          // PARA TB_USUARIO
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
               exit;
          end;

          // PARA TB_FUNCIONARIO
          if afuncoes.LocalizaIndice(frm_modulo.IBQ_funcoes,
          'select * from tb_funcionario','where agencodg=:wc',[Mke_Login.Text])
          then
          begin
               if frm_modulo.IBQ_funcoes.FieldByName('agensenh').asstring <>
               Mke_Senha.Text then
               begin
                    MessageDlg('Login Recusado, Senha inválida...',
                    mtInformation,[mbOk], 0);
                    Mke_Senha.setfocus;
               end
               else if wxprofessor = Mke_Login.Text then wAcessoTemporario := true;
          end;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_PedeSenhaFuncUsua.FormClose(Sender: TObject; var Action: TCloseAction);
//------------------------------------------------------------------------------
begin
     frm_modulo.IBQ_funcoes.close;
end;

end.
