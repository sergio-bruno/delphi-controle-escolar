unit U_TbNivelEscolar;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, ExtCtrls, Buttons, DB, DBCtrls, Mask, ToolWin, ComCtrls,
     DBTables;
     
type
  TFrm_TbNivelEscolar = class(TForm)
    Pnl_CentroCusto: TPanel;
    Lbl_Descricao: TLabel;
    Btn_Gravar: TButton;
    Btn_Excluir: TButton;
    Btn_Sair: TButton;
    Lbl_Titulo: TLabel;
    Edt_nivedesc: TEdit;
    Btn_cancela: TButton;
    Btn_Pesquisa: TButton;
    Tlb_Navegador: TToolBar;
    SPB_help: TSpeedButton;
    Grb_CentroCusto: TGroupBox;
    Label1: TLabel;
    Edt_nivecodg: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Btn_GravarClick(Sender: TObject);
    procedure Btn_ExcluirClick(Sender: TObject);
    procedure Btn_SairClick(Sender: TObject);
    procedure Atribuiregistro;
    procedure limpavariavel(WCodigo: string);
    procedure Btn_cancelaClick(Sender: TObject);
    procedure Btn_PesquisaClick(Sender: TObject);
    function  TestaCampoVazio: Boolean;
    procedure GravaRegistro;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure VerAlteracoes(Sender: TObject);
    procedure SPB_helpClick(Sender: TObject);
    procedure Edt_nivecodgExit(Sender: TObject);
  end;

var Frm_TbNivelEscolar: TFrm_TbNivelEscolar;
    wAlterouReg : boolean;

implementation

uses U_Modulo, U_Funcoes, U_Principal, U_PesqIncremento;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TFrm_TbNivelEscolar.FormKeyPress(Sender: TObject; var Key: Char);
//------------------------------------------------------------------------------
begin
     if (key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end
     else if key = #27 then close;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbNivelEscolar.FormShow(Sender: TObject);
//------------------------------------------------------------------------------
begin
     LimpaVariavel('');
     Edt_nivecodg.setfocus;
end;

procedure TFrm_TbNivelEscolar.Edt_nivecodgExit(Sender: TObject);
begin
     if Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes,
     'Select * from tb_nivelescolar','where nivecodg=:wnivecodg',
     [Edt_nivecodg.Text]) then Atribuiregistro
     else Limpavariavel(Edt_nivecodg.Text);
end;

//------------------------------------------------------------------------------
procedure TFrm_TbNivelEscolar.Btn_GravarClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if TestaCampoVazio then
     begin
          If (aFuncoes.MessageDlgDef('Confirma gravação do nível escolar ?',
          mtConfirmation,[mbCancel, mbYes], mryes, 0) = mrYes) then
          begin
               try
                  If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                     Frm_Modulo.IBT_Transaction.StartTransaction;
                  GravaRegistro;
                  Frm_Modulo.IBT_Transaction.CommitRetaining;
               except
                  Frm_Modulo.IBT_Transaction.rollback;
               end;
               wAlterouReg:=false;
               Edt_nivecodg.SetFocus;
          end;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbNivelEscolar.GravaRegistro;
//------------------------------------------------------------------------------
var wacessohistorico : string;
begin
     with Frm_Modulo.IBQ_funcoes do
     begin
          if not Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes,
          'Select * from tb_nivelescolar','where nivecodg=:wnivecodg',
          [Edt_nivecodg.Text]) then
          begin
               //wacessohistorico := '0025';
               close;
               Sql.clear;
               Sql.add('insert into tb_nivelescolar (nivecodg,nivedesc)');
               Sql.add('values (:wnivecodg,:wnivedesc)');
          end
          else
          begin
               //wacessohistorico := '0026';
               close;
               Sql.clear;
               Sql.add('update tb_nivelescolar set nivedesc=:wnivedesc');
               Sql.add('where nivecodg=:wnivecodg');
          end;
          parambyname('wnivecodg').AsString := Edt_nivecodg.text;
          parambyname('wnivedesc').AsString := Edt_nivedesc.Text;
          prepare;
          execsql;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbNivelEscolar.Btn_ExcluirClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if Trim(Edt_nivecodg.text) = '' then
     begin
          aFuncoes.MessageDlgDef('É necessário selecionar um nível escolar...',
          mtInformation,[mbOk], mrok, 0);
          Edt_nivecodg.setfocus;
     end
     else if not Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes,
     'Select * from tb_nivelescolar','where nivecodg=:wnivecodg',
     [Edt_nivecodg.Text]) then
          aFuncoes.MessageDlgDef(
          'Este nível escolar não está registrado você pode cancelá-lo...',
          mtInformation,[mbOk], mrok, 0)
     else If aFuncoes.MessageDlgDef('Confirma a exclusão deste nível escolar ?',
     mtConfirmation, [mbCancel, mbYes], mrCancel, 0) = mrYes then
     begin
          try
             If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                Frm_Modulo.IBT_Transaction.StartTransaction;
             afuncoes.STOperaRegistrosIB(
             'delete from tb_nivelescolar where nivecodg=:wchave',
             [Edt_nivecodg.Text]);
             Frm_Modulo.IBT_Transaction.CommitRetaining;
             Limpavariavel('');
             Edt_nivecodg.SetFocus;
          except
             Frm_Modulo.IBT_Transaction.rollback;
          end;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbNivelEscolar.Btn_cancelaClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     Limpavariavel('');
     Edt_nivecodg.setfocus;
end;

//------------------------------------------------------------------------------
Procedure TFrm_TbNivelEscolar.limpavariavel(WCodigo: string);
//------------------------------------------------------------------------------
begin
     Edt_nivecodg.text:=WCodigo;
     Edt_nivedesc.Text  :='';
     if WCodigo = '' then wAlterouReg:=false else wAlterouReg:=true;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbNivelEscolar.Btn_PesquisaClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if (Frm_PesqIncremento.AbrePesquisa(
     'select nivecodg,nivedesc from tb_nivelescolar where ',
     ['Código','Nível Escolar'],'oo',[0],['nivecodg','nivedesc'],1,
     ['S','S'],'') = mrOk) and (Afuncoes.Localizaindice(
     Frm_Modulo.IBQ_funcoes,'Select * from tb_nivelescolar',
     'where nivecodg=:wnivecodg',[Frm_PesqIncremento.Retorno])) then
     begin
          Atribuiregistro;
          Edt_nivecodg.Setfocus;
     end;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

//------------------------------------------------------------------------------
Procedure TFrm_TbNivelEscolar.Atribuiregistro;
//------------------------------------------------------------------------------
begin
    With Frm_Modulo.IBQ_funcoes do
    Begin
       Edt_nivecodg.Text := Fieldbyname('nivecodg').AsString;
       Edt_nivedesc.Text := Fieldbyname('nivedesc').AsString;
    end;
    wAlterouReg:=false;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbNivelEscolar.Btn_SairClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     Close;
end;

//------------------------------------------------------------------------------
function TFrm_TbNivelEscolar.TestaCampoVazio: Boolean;
//------------------------------------------------------------------------------
begin
     Result:=False;
     if not aFuncoes.TestaCampoVazio(Edt_nivecodg.text,'o código do nível escolar') then
          Edt_nivecodg.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_nivedesc.text,
     'a descrição do nível escolar') then
          Edt_nivedesc.SetFocus
     else Result:=True;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbNivelEscolar.VerAlteracoes(Sender: TObject);
//------------------------------------------------------------------------------
begin wAlterouReg:=true;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbNivelEscolar.FormCloseQuery(Sender:TObject;var CanClose: Boolean);
//------------------------------------------------------------------------------
begin
     if wAlterouReg then
     begin
          If aFuncoes.MessageDlgDef(
          'O registro corrente do nível escolar foi alterado, se você sair as '+
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
procedure TFrm_TbNivelEscolar.SPB_helpClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     //WinHelp(Frm_CentroCusto.Handle,'Ajuda.Hlp',HELP_CONTEXT,10);
end;

end.
