unit U_Usuario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DB, DBCtrls, Mask, ToolWin, ComCtrls, DBTables,
  Grids, DBGrids;

type
  TFrm_Usuario = class(TForm)
    Pnl_Fundo: TPanel;
    Grb_Usuario: TGroupBox;
    Lbl_Nome: TLabel;
    Lbl_Senha: TLabel;
    Edt_UsuaLogi: TEdit;
    Lbl_Titulo: TLabel;
    Edt_UsuaReSenh: TEdit;
    Lbl_RedigeSenha: TLabel;
    Edt_usuaSenh: TEdit;
    Tlb_Navegador: TToolBar;
    Btn_Pesquisa: TButton;
    Btn_Gravar: TButton;
    Btn_Excluir: TButton;
    Btn_Cancela: TButton;
    Btn_Sair: TButton;
    Chb_usuaactt: TCheckBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Edt_UsuaLogiExit(Sender: TObject);
    procedure Atribuiregistro;
    procedure limpavariavel(WPusuario: string);
    procedure Edt_UsuaReSenhExit(Sender: TObject);
    procedure Btn_PesquisaClick(Sender: TObject);
    function  TestaCampoVazio: Boolean;
    procedure GravaRegistro;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure VerAlteracoesUsuario(Sender: TObject);
    function  Testasenha: boolean;
    procedure Edt_usuaSenhExit(Sender: TObject);
    procedure Btn_SairClick(Sender: TObject);
    procedure Btn_GravarClick(Sender: TObject);
    procedure Btn_ExcluirClick(Sender: TObject);
    procedure Btn_CancelaClick(Sender: TObject);
  end;

var   Frm_Usuario : TFrm_Usuario;
      wAlterouReg : boolean;

implementation

uses U_Modulo, U_Funcoes, U_PesqIncremento, U_Principal;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TFrm_Usuario.FormKeyPress(Sender: TObject; var Key: Char);
//------------------------------------------------------------------------------
begin
     if (key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end
     else if Key = #27 then close;
end;

//------------------------------------------------------------------------------
procedure TFrm_Usuario.FormShow(Sender: TObject);
//------------------------------------------------------------------------------
begin
     LimpaVariavel('');
     wAlterouReg := false;
     Edt_usualogi.setfocus;
end;

//------------------------------------------------------------------------------
procedure TFrm_Usuario.Edt_usualogiExit(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
     'Select * from tb_usuario','where usualogi=:wusualogi',
     [Edt_usualogi.Text]) then Atribuiregistro
     else Limpavariavel(Edt_usualogi.Text);
end;

//------------------------------------------------------------------------------
procedure TFrm_Usuario.Btn_GravarClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if TestaCampoVazio then
     begin
          If (aFuncoes.MessageDlgDef('Confirma gravação do Usuário ?',
          mtConfirmation, [mbCancel, mbYes],mryes, 0) = mrYes) then
          begin
               try
                  If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                     Frm_Modulo.IBT_Transaction.StartTransaction;
                  GravaRegistro;
                  frm_modulo.IBT_Transaction.CommitRetaining;
               except
                  frm_modulo.IBT_Transaction.rollback;
                  aFuncoes.MessageDlgDef('Não foi possível registar estas alterações !',
                  mtWarning, [mbok],mrok, 0);
               end;
               wAlterouReg:=false;
               Edt_usualogi.SetFocus;
          end;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_Usuario.GravaRegistro;
//------------------------------------------------------------------------------
begin
     with frm_modulo.IBQ_funcoes do
     begin
          close;
          Sql.Clear;
          Sql.Add('Select * from tb_usuario');
          Sql.Add('Where usualogi=:wusuario');
          parambyname('wusuario').AsString:=Edt_usualogi.text;
          prepare;
          open;
          if eof then
          begin
               close;
               Sql.clear;
               Sql.add('insert into tb_usuario (usualogi,usuasenh,usuaactt)');
               Sql.add('values (:wusualogi,:wusuasenh,:wusuaactt)');
          end
          else
          begin
               close;
               Sql.clear;
               Sql.add('update tb_usuario set usuasenh=:wusuasenh,');
               Sql.add('usuaactt=:wusuaactt');
               Sql.add('where usualogi=:wusualogi');
          end;
          parambyname('wusualogi').asstring   := Edt_usualogi.text;
          parambyname('wusuasenh').asstring   := Edt_UsuaSenh.text;
          if chb_usuaactt.Checked then
               parambyname('wusuaactt').asinteger := 0
          else parambyname('wusuaactt').asinteger := 1;
          prepare;
          execsql;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_Usuario.Btn_ExcluirClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if not Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
     'Select * from tb_usuario','where usualogi=:wusualogi',
     [Edt_usualogi.Text]) then
          aFuncoes.MessageDlgDef(
          'Este usuário não está registrado você pode cancelá-lo...',
          mtInformation,[mbOk], mrok, 0)
  else
  begin
     If aFuncoes.MessageDlgDef('Confirma a exclusão do Usuário ?',
     mtConfirmation,[mbCancel, mbYes], mrcancel,0) = mrYes then
     begin
          with frm_modulo.IBQ_funcoes do
          begin
               try
                  If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                     Frm_Modulo.IBT_Transaction.StartTransaction;
                  // DELETAR O USUÁRIO
                  aFuncoes.STOperaRegistrosIB(
                  'delete from tb_usuario where usualogi=:wusu',
                  [Edt_usualogi.text]);
                  frm_modulo.IBT_Transaction.CommitRetaining;
                  Limpavariavel('');
                  Edt_usualogi.SetFocus;
               except
                  frm_modulo.IBT_Transaction.rollback;
                  aFuncoes.MessageDlgDef('Não foi possível registar estas alterações !',
                  mtWarning, [mbok],mrok, 0);
               end;
          end;
     end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrm_Usuario.Btn_cancelaClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     Limpavariavel('');
     Edt_usualogi.setfocus;
end;

//------------------------------------------------------------------------------
Procedure Tfrm_usuario.limpavariavel(WPusuario: string);
//------------------------------------------------------------------------------
begin
     Edt_usualogi.text     := WPusuario;
     Edt_UsuaSenh.Text     := '';
     Edt_UsuaReSenh.Text   := '';
     Chb_usuaactt.Checked  := false;
     if WPusuario = '' then wAlterouReg:=false else wAlterouReg:=true;
end;

//------------------------------------------------------------------------------
procedure TFrm_Usuario.Edt_UsuaReSenhExit(Sender: TObject);
//------------------------------------------------------------------------------
begin
     Testasenha;
end;

//------------------------------------------------------------------------------
function TFrm_Usuario.Testasenha: boolean;
//------------------------------------------------------------------------------
begin
     IF Edt_UsuaSenh.Text <> Edt_UsuaReSenh.text then
     begin
          aFuncoes.MessageDlgDef('Senha não Confere !',mtInformation,[mboK],mrok
          ,0);
          Edt_UsuaSenh.text   := '';
          Edt_UsuaReSenh.text := '';
          Edt_UsuaSenh.setfocus;
          Result:=false;
     end
     else Result:=true;
end;

//------------------------------------------------------------------------------
procedure TFrm_Usuario.Btn_PesquisaClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if Frm_PesqIncremento.AbrePesquisa('select usualogi from tb_usuario where ',
     ['Login'],'o',[0],['usualogi'],0,['S'],'') = mrOk then
     begin
          Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
          'Select * from tb_usuario','where usualogi=:wusualogi',
          [Frm_PesqIncremento.Retorno]);
          Atribuiregistro;
          Edt_usualogi.Setfocus;
     end;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

//------------------------------------------------------------------------------
Procedure Tfrm_usuario.Atribuiregistro;
//------------------------------------------------------------------------------
begin
    With frm_modulo do
    Begin
         Edt_usualogi.text      := IBQ_Funcoes.Fieldbyname('usualogi').AsString;
         Edt_UsuaSenh.Text      := IBQ_Funcoes.Fieldbyname('usuasenh').AsString;
         Edt_UsuaReSenh.Text    := IBQ_Funcoes.Fieldbyname('usuasenh').AsString;
         case IBQ_Funcoes.Fieldbyname('usuaactt').asinteger of
              0: Chb_usuaactt.Checked := true;
              1: Chb_usuaactt.Checked := false;
         end;
    end;
    wAlterouReg:=false;
end;

//------------------------------------------------------------------------------
function TFrm_Usuario.TestaCampoVazio: Boolean;
//------------------------------------------------------------------------------
begin
     Result:=False;
     if not aFuncoes.TestaCampoVazio(Edt_usualogi.text,'o login do Usuário')
     then
          Edt_usualogi.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_UsuaSenh.text,
     'a senha do Usuário') then
          Edt_UsuaSenh.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_UsuaReSenh.text,
     'confirmação da senha do Usuário') then
          Edt_UsuaReSenh.SetFocus
     else Result:=True;
end;

//------------------------------------------------------------------------------
procedure TFrm_Usuario.VerAlteracoesUsuario(Sender: TObject);
//------------------------------------------------------------------------------
begin
     wAlterouReg := true;
end;

//------------------------------------------------------------------------------
procedure TFrm_Usuario.FormCloseQuery(Sender: TObject;var CanClose: Boolean);
//------------------------------------------------------------------------------
begin
     if wAlterouReg then
     begin
          If aFuncoes.MessageDlgDef(
          'O registro corrente do usuário foi alterado, se você sair as '+
          #13+'alterações não serão salvas. Deseja sair ?', mtConfirmation,
             [mbNo, mbYes], mrNo, 0) = mrNo then
             canclose:=false;
     end;
     if canclose then
     begin
          Frm_Modulo.IBQ_funcoes.close;
          Frm_PesqIncremento.Qry_Pesquisa.close;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_Usuario.Edt_usuaSenhExit(Sender: TObject);
//------------------------------------------------------------------------------
begin
     IF Edt_usuaresenh.text <> '' then Testasenha;
end;

//------------------------------------------------------------------------------
procedure TFrm_Usuario.Btn_SairClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     close;
end;

end.
