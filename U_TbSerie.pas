unit U_TbSerie;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, ExtCtrls, Buttons, DB, DBCtrls, Mask, ToolWin, ComCtrls,
     DBTables, Grids, DBGrids;
     
type
  TFrm_TbSerie = class(TForm)
    Pnl_CentroCusto: TPanel;
    Lbl_Descricao: TLabel;
    Edt_seridesc: TEdit;
    Grb_CentroCusto: TGroupBox;
    Label1: TLabel;
    Edt_sericodg: TEdit;
    Label9: TLabel;
    Edt_seriturn: TEdit;
    Spb_LocalizaTurno: TSpeedButton;
    Pnl_descricaoturno: TPanel;
    Label2: TLabel;
    Edt_serinive: TEdit;
    Spb_LocalizaNivel: TSpeedButton;
    Pnl_descricaonivel: TPanel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Edt_dissdisc: TEdit;
    Spb_LocalizaDisciplina: TSpeedButton;
    Pnl_DescricaoDisciplina: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel4: TPanel;
    SPB_help: TSpeedButton;
    Edt_dissagen: TEdit;
    Spb_LocalizaFuncionario: TSpeedButton;
    Pnl_NomeFuncionario: TPanel;
    Label3: TLabel;
    Btn_Gravar: TButton;
    Btn_Pesquisa: TButton;
    Btn_Excluir: TButton;
    Btn_cancela: TButton;
    Btn_Sair: TButton;
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
    procedure Edt_sericodgExit(Sender: TObject);
    procedure Edt_seriturnExit(Sender: TObject);
    procedure Spb_LocalizaTurnoClick(Sender: TObject);
    procedure LocalizaTurno(WPPrimLetra: string);
    procedure Edt_seriniveExit(Sender: TObject);
    procedure Spb_LocalizaNivelClick(Sender: TObject);
    procedure LocalizaNivel(WPPrimLetra: string);
    Procedure limpavariavelDisciplina(WCodigo, WDescricao, WPCodAgen, WPNome: string);
    Procedure FiltraDisciplina(WCodigo: string);
    procedure Edt_dissdiscExit(Sender: TObject);
    procedure Spb_LocalizaDisciplinaClick(Sender: TObject);
    procedure LocalizaDisciplina(WPPrimLetra: string);
    procedure Button1Click(Sender: TObject);
    procedure GravaRegistroDisciplina;
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edt_dissagenExit(Sender: TObject);
    procedure Spb_LocalizaFuncionarioClick(Sender: TObject);
    procedure LocalizaFuncionario(WPPrimLetra: string);
  end;

var Frm_TbSerie: TFrm_TbSerie;
    wAlterouReg : boolean;

implementation

uses U_Modulo, U_Funcoes, U_Principal, U_PesqIncremento;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TFrm_TbSerie.FormKeyPress(Sender: TObject; var Key: Char);
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
procedure TFrm_TbSerie.FormShow(Sender: TObject);
//------------------------------------------------------------------------------
begin
     LimpaVariavel('');
     Edt_sericodg.setfocus;
end;

procedure TFrm_TbSerie.Edt_sericodgExit(Sender: TObject);
begin
     if Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes,
     'Select * from TB_SERIE','where sericodg=:wsericodg',
     [Edt_sericodg.Text]) then Atribuiregistro
     else Limpavariavel(Edt_sericodg.Text);
end;

//------------------------------------------------------------------------------
procedure TFrm_TbSerie.Btn_GravarClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if TestaCampoVazio then
     begin
          If (aFuncoes.MessageDlgDef('Confirma gravação da série ?',
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
               Edt_sericodg.SetFocus;
          end;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbSerie.GravaRegistro;
//------------------------------------------------------------------------------
var wacessohistorico : string;
begin
     with Frm_Modulo.IBQ_funcoes do
     begin
          if not Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes,
          'Select * from TB_SERIE','where sericodg=:wsericodg',
          [Edt_sericodg.Text]) then
          begin
               //wacessohistorico := '0025';
               close;
               Sql.clear;
               Sql.add('insert into TB_SERIE (sericodg,seridesc,seriturn,serinive)');
               Sql.add('values (:wsericodg,:wseridesc,:wseriturn,:wserinive)');
          end
          else
          begin
               //wacessohistorico := '0026';
               close;
               Sql.clear;
               Sql.add('update TB_SERIE set seridesc=:wseridesc,seriturn=:wseriturn,serinive=:wserinive');
               Sql.add('where sericodg=:wsericodg');
          end;
          parambyname('wsericodg').AsString := Edt_sericodg.text;
          parambyname('wseridesc').AsString := Edt_seridesc.Text;
          parambyname('wseriturn').AsString := Edt_seriturn.Text;
          parambyname('wserinive').AsString := Edt_serinive.Text;
          prepare;
          execsql;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbSerie.Btn_ExcluirClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if Trim(Edt_sericodg.text) = '' then
     begin
          aFuncoes.MessageDlgDef('É necessário selecionar uma série...',
          mtInformation,[mbOk], mrok, 0);
          Edt_sericodg.setfocus;
     end
     else if not Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes,
     'Select * from TB_SERIE','where sericodg=:wsericodg',
     [Edt_sericodg.Text]) then
          aFuncoes.MessageDlgDef(
          'Esta série não está registrada você pode cancelá-la...',
          mtInformation,[mbOk], mrok, 0)
     else If aFuncoes.MessageDlgDef('Confirma a exclusão desta série ?',
     mtConfirmation, [mbCancel, mbYes], mrCancel, 0) = mrYes then
     begin
          try
             If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                Frm_Modulo.IBT_Transaction.StartTransaction;
             afuncoes.STOperaRegistrosIB(
             'delete from TB_DISCIPLINASERIE where dissseri=:ws',
             [Edt_sericodg.Text]);
             afuncoes.STOperaRegistrosIB(
             'delete from TB_SERIE where sericodg=:wchave',
             [Edt_sericodg.Text]);
             Frm_Modulo.IBT_Transaction.CommitRetaining;
             Limpavariavel('');
             Edt_sericodg.SetFocus;
          except
             Frm_Modulo.IBT_Transaction.rollback;
          end;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbSerie.Btn_cancelaClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     Limpavariavel('');
     Edt_sericodg.setfocus;
end;

//------------------------------------------------------------------------------
Procedure TFrm_TbSerie.limpavariavel(WCodigo: string);
//------------------------------------------------------------------------------
begin
     Edt_sericodg.text := WCodigo;
     Edt_seridesc.Text := '';
     Edt_seriturn.Text := '';
     Pnl_descricaoturno.caption := '';
     Edt_serinive.Text := '';
     Pnl_descricaonivel.caption := '';
     limpavariavelDisciplina('','','','');
     FiltraDisciplina('');
     if WCodigo = '' then wAlterouReg:=false else wAlterouReg:=true;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbSerie.Btn_PesquisaClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if (Frm_PesqIncremento.AbrePesquisa(
     'select sericodg,seridesc from TB_SERIE where ',
     ['Código','Série'],'oa',[0],['sericodg','seridesc'],1,
     ['S','S'],'') = mrOk) and (Afuncoes.Localizaindice(
     Frm_Modulo.IBQ_funcoes,'Select * from TB_SERIE',
     'where sericodg=:wsericodg',[Frm_PesqIncremento.Retorno])) then
     begin
          Atribuiregistro;
          Edt_sericodg.Setfocus;
     end;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

//------------------------------------------------------------------------------
Procedure TFrm_TbSerie.Atribuiregistro;
//------------------------------------------------------------------------------
begin
     With Frm_Modulo.IBQ_funcoes do
     Begin
          Edt_sericodg.Text          := Fieldbyname('sericodg').AsString;
          Edt_seridesc.Text          := Fieldbyname('seridesc').AsString;
          Edt_seriturn.Text          := Fieldbyname('seriturn').AsString;
          Pnl_descricaoturno.caption := afuncoes.RetornaDescricao('select * from tb_turno',
                                        'where turncodg=:wt',Edt_seriturn.Text,
                                        'turndesc');
          Edt_serinive.Text          := Fieldbyname('serinive').AsString;
          Pnl_descricaonivel.caption := afuncoes.RetornaDescricao('select * from tb_nivelescolar',
                                        'where nivecodg=:wn',Edt_serinive.Text,
                                        'nivedesc');
          limpavariavelDisciplina('','','','');
          FiltraDisciplina(Edt_sericodg.Text);
     end;
     wAlterouReg:=false;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbSerie.Btn_SairClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     Close;
end;

//------------------------------------------------------------------------------
function TFrm_TbSerie.TestaCampoVazio: Boolean;
//------------------------------------------------------------------------------
begin
     Result:=False;
     if not aFuncoes.TestaCampoVazio(Edt_sericodg.text,'o código da série') then
          Edt_sericodg.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_seridesc.text,
     'a descrição da série') then
          Edt_seridesc.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_seriturn.text,
     'o turno') then
          Edt_seriturn.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_serinive.text,
     'o nível escolar') then
          Edt_serinive.SetFocus
     else Result:=True;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbSerie.VerAlteracoes(Sender: TObject);
//------------------------------------------------------------------------------
begin wAlterouReg:=true;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbSerie.FormCloseQuery(Sender:TObject;var CanClose: Boolean);
//------------------------------------------------------------------------------
begin
     if wAlterouReg then
     begin
          If aFuncoes.MessageDlgDef(
          'O registro corrente da série foi alterado, se você sair as '+
          #13+'alterações não serão salvas. Deseja sair ?', mtConfirmation,
             [mbNo, mbYes], mrNo, 0) = mrNo then
             canclose:=false;
     end;
     if canclose then
     begin
          Frm_Modulo.IBQ_funcoes.close;
          Frm_PesqIncremento.Qry_Pesquisa.close;
          Frm_Modulo.IBQ_DisciplinaSerie.close;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbSerie.SPB_helpClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     //WinHelp(Frm_CentroCusto.Handle,'Ajuda.Hlp',HELP_CONTEXT,10);
end;

procedure TFrm_TbSerie.Edt_seriturnExit(Sender: TObject);
begin
     if (Trim(Edt_seriturn.text) <> '') then
     begin
          if not (Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
          'Select * from tb_turno','where turncodg=:wcodg',[Edt_seriturn.Text]))
          then
          begin
               aFuncoes.MessageDlgDef('Código do turno informado inválido...',
               mtInformation,[mbok],mrok,0);
               Edt_seriturn.setfocus;
          end
          else Pnl_descricaoturno.caption := Frm_Modulo.IBQ_Funcoes.fieldbyname(
                                             'turndesc').AsString;
     end
     else Pnl_descricaoturno.caption := '';
end;

procedure TFrm_TbSerie.Spb_LocalizaTurnoClick(Sender: TObject);
begin
     LocalizaTurno('');
end;

//------------------------------------------------------------------------------
procedure TFrm_TbSerie.LocalizaTurno(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_seriturn.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select * from tb_turno where ',
     ['Código','Turno'],'oo',[0],['turncodg','turndesc'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_seriturn.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_TbSerie.Edt_seriniveExit(Sender: TObject);
begin
     if (Trim(Edt_serinive.text) <> '') then
     begin
          if not (Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
          'Select * from tb_nivelescolar','where nivecodg=:wcodg',[Edt_serinive.Text]))
          then
          begin
               aFuncoes.MessageDlgDef('Código do nível escolar informado inválido...',
               mtInformation,[mbok],mrok,0);
               Edt_serinive.setfocus;
          end
          else Pnl_descricaonivel.caption := Frm_Modulo.IBQ_Funcoes.fieldbyname(
                                             'nivedesc').AsString;
     end
     else Pnl_descricaonivel.caption := '';
end;

procedure TFrm_TbSerie.Spb_LocalizaNivelClick(Sender: TObject);
begin
     LocalizaNivel('');
end;

//------------------------------------------------------------------------------
procedure TFrm_TbSerie.LocalizaNivel(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_serinive.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select * from tb_nivelescolar where ',
     ['Código','Nível Escolar'],'oo',[0],['nivecodg','nivedesc'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_serinive.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

//------------------------------------------------------------------------------
// DISCIPLINAS
//------------------------------------------------------------------------------
Procedure TFrm_TbSerie.limpavariavelDisciplina(WCodigo, WDescricao, WPCodAgen,
          WPNome: string);
//------------------------------------------------------------------------------
begin
     Edt_dissdisc.text               := WCodigo;
     Pnl_descricaodisciplina.caption := WDescricao;
     Edt_dissagen.text               := WPCodAgen;
     Pnl_nomefuncionario.caption     := WPNome;
end;

//------------------------------------------------------------------------------
Procedure TFrm_TbSerie.FiltraDisciplina(WCodigo: string);
//------------------------------------------------------------------------------
begin
     with Frm_Modulo.IBQ_DisciplinaSerie do
     begin
          close;
          params[0].Value := WCodigo;
          if not prepared then prepare;
          open;
     end;
end;

procedure TFrm_TbSerie.Edt_dissdiscExit(Sender: TObject);
begin
     if (Trim(Edt_dissdisc.text) <> '') then
     begin
          if not (Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
          'Select * from tb_disciplina','where disccodg=:wcodg',[
          Edt_dissdisc.text])) then
          begin
               aFuncoes.MessageDlgDef('Código da disciplina informado inválido...',
               mtInformation,[mbok],mrok,0);
               Edt_dissdisc.setfocus;
          end
          else Pnl_descricaodisciplina.caption := Frm_Modulo.IBQ_Funcoes.fieldbyname(
                                                  'discdesc').AsString;
     end
     else Pnl_descricaodisciplina.caption := '';
end;

procedure TFrm_TbSerie.Spb_LocalizaDisciplinaClick(Sender: TObject);
begin
     LocalizaDisciplina('');
end;

//------------------------------------------------------------------------------
procedure TFrm_TbSerie.LocalizaDisciplina(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_dissdisc.setfocus;
     if (Frm_PesqIncremento.AbrePesquisa('select disccodg,discdesc from TB_DISCIPLINA where ',
     ['Código','Disciplina'],'oa',[0],['disccodg','discdesc'],1,
     ['S','S'],'') = mrOk) then
          Edt_dissdisc.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_TbSerie.Button1Click(Sender: TObject);
begin
     if not aFuncoes.TestaCampoVazio(Edt_sericodg.text,'o código da série') then
          Edt_sericodg.SetFocus
     else if not Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes,
     'Select * from TB_SERIE','where sericodg=:wsericodg',
     [Edt_sericodg.Text]) then
     begin
          aFuncoes.MessageDlgDef('Esta série não está cadastrada é necessário registrá-la...',
          mtInformation,[mbok],mrok,0);
          Btn_gravar.setfocus;
     end
     else if not aFuncoes.TestaCampoVazio(Edt_dissdisc.text,'o código da disciplina') then
          Edt_dissdisc.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_dissagen.text,'o código do professor') then
          Edt_dissagen.SetFocus
     else if (aFuncoes.MessageDlgDef('Confirma gravação da disciplina ?',
     mtConfirmation,[mbCancel, mbYes], mryes, 0) = mrYes) then
     begin
          try
             If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                Frm_Modulo.IBT_Transaction.StartTransaction;
             GravaRegistroDisciplina;
             Frm_Modulo.IBT_Transaction.CommitRetaining;
             limpavariavelDisciplina('','','','');
             FiltraDisciplina(Edt_sericodg.Text);
          except
             Frm_Modulo.IBT_Transaction.rollback;
             aFuncoes.MessageDlgDef('Não foi possível registar estas alterações !',
             mtWarning, [mbok],mrok, 0);
          end;
          wAlterouReg:=false;
          Edt_dissdisc.SetFocus;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbSerie.GravaRegistroDisciplina;
//------------------------------------------------------------------------------
var wacessohistorico : string;
begin
     with Frm_Modulo.IBQ_funcoes do
     begin
          if not Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes,
          'Select * from TB_DISCIPLINASERIE','where dissseri=:ws and dissdisc=:wd',
          [Edt_sericodg.text,Edt_dissdisc.Text]) then
          begin
               //wacessohistorico := '0025';
               close;
               Sql.clear;
               Sql.add('insert into TB_DISCIPLINASERIE (dissseri,dissdisc,dissagen)');
               Sql.add('values (:wdissseri,:wdissdisc,:wdissagen)');
          end
          else
          begin
               //wacessohistorico := '0025';
               close;
               Sql.clear;
               Sql.add('update TB_DISCIPLINASERIE SET dissagen=:wdissagen');
               Sql.add('where dissseri=:wdissseri and dissdisc=:wdissdisc');
          end;
          parambyname('wdissseri').AsString := Edt_sericodg.text;
          parambyname('wdissdisc').AsString := Edt_dissdisc.Text;
          parambyname('wdissagen').AsString := Edt_dissagen.Text;
          prepare;
          execsql;
     end;
end;

procedure TFrm_TbSerie.Button2Click(Sender: TObject);
begin
     if not aFuncoes.TestaCampoVazio(Edt_sericodg.text,'o código da série') then
          Edt_sericodg.SetFocus
     else If aFuncoes.MessageDlgDef('Confirma a exclusão desta disciplina ?',
     mtConfirmation, [mbCancel, mbYes], mrCancel, 0) = mrYes then
     try
        If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
           Frm_Modulo.IBT_Transaction.StartTransaction;
        afuncoes.STOperaRegistrosIB(
        'delete from TB_DISCIPLINASERIE where dissseri=:ws and dissdisc=:wd',
        [Edt_sericodg.Text,Edt_dissdisc.text]);
        Frm_Modulo.IBT_Transaction.CommitRetaining;
        limpavariavelDisciplina('','','','');
        FiltraDisciplina(Edt_sericodg.Text);
        Edt_dissdisc.SetFocus;
     except
        Frm_Modulo.IBT_Transaction.rollback;
        aFuncoes.MessageDlgDef('Não foi possível registar estas alterações !',
        mtWarning, [mbok],mrok, 0);
     end;
end;

procedure TFrm_TbSerie.DBGrid1DblClick(Sender: TObject);
begin
     if not Frm_Modulo.IBQ_DisciplinaSerie.isempty then
        limpavariavelDisciplina(Frm_Modulo.IBQ_DisciplinaSerie.fieldbyname(
        'dissdisc').asstring,Frm_Modulo.IBQ_DisciplinaSerie.fieldbyname(
        'discdesc').asstring,Frm_Modulo.IBQ_DisciplinaSerie.fieldbyname(
        'dissagen').asstring,Frm_Modulo.IBQ_DisciplinaSerie.fieldbyname(
        'agennome').asstring);
end;

procedure TFrm_TbSerie.Edt_dissagenExit(Sender: TObject);
begin
     if (Trim(Edt_dissagen.text) <> '') then
     begin
          if not (Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
          'Select * from tb_funcionario','where agencodg=:wcodg',[
          Edt_dissagen.text])) then
          begin
               aFuncoes.MessageDlgDef('Código do professor informado inválido...',
               mtInformation,[mbok],mrok,0);
               Edt_dissagen.setfocus;
          end
          else Pnl_NomeFuncionario.caption := Frm_Modulo.IBQ_Funcoes.fieldbyname(
                                              'agennome').AsString;
     end
     else Pnl_NomeFuncionario.caption := '';
end;

procedure TFrm_TbSerie.Spb_LocalizaFuncionarioClick(Sender: TObject);
begin
     LocalizaFuncionario('');
end;

//------------------------------------------------------------------------------
procedure TFrm_TbSerie.LocalizaFuncionario(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_dissagen.setfocus;
     if (Frm_PesqIncremento.AbrePesquisa('select agencodg,agennome from TB_FUNCIONARIO where ',
     ['Código','Professor'],'oo',[0],['agencodg','agennome'],1,
     ['S','S'],'') = mrOk) then
          Edt_dissagen.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

end.
