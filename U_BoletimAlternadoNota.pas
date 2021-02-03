unit U_BoletimAlternadoNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, FnpNumericEdit, Grids, DBGrids, DB,
  DBTables, IBCustomDataSet, IBQuery;

type
  TFrm_BoletimAlternadoNota = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel3: TPanel;
    Label2: TLabel;
    Edt_Ano: TEdit;
    Label3: TLabel;
    Edt_serie: TEdit;
    Spb_LocalizaSerie: TSpeedButton;
    Label5: TLabel;
    edt_aluno: TEdit;
    Spb_localizaaluno: TSpeedButton;
    pnl_nomealuno: TPanel;
    DBGrid1: TDBGrid;
    Button3: TButton;
    IBQ_NotaAlternada: TIBQuery;
    Dts_MensAlternada: TDataSource;
    IBQ_NotaAlternadaNOTAALUN: TIBStringField;
    IBQ_NotaAlternadaNOTASERI: TIBStringField;
    IBQ_NotaAlternadaALUNNOME: TIBStringField;
    IBQ_NotaAlternadaSERIDESC: TIBStringField;
    IBQ_NotaAlternadaNOTA_ANO: TIBStringField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Edt_AnoKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_AnoExit(Sender: TObject);
    procedure Edt_serieExit(Sender: TObject);
    procedure Spb_LocalizaSerieClick(Sender: TObject);
    procedure LocalizaSerie(WPPrimLetra: string);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure Spb_localizaalunoClick(Sender: TObject);
    procedure LocalizaAluno(WPPrimLetra: string);
    procedure edt_alunoExit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AbreTabela;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    function  TestaCampoVazio: Boolean;
    procedure Button1Click(Sender: TObject);
  end;

var Frm_BoletimAlternadoNota: TFrm_BoletimAlternadoNota;
    wSairClick     : boolean; { variavel para saber se o botao sair foi clicado }

implementation

uses u_Funcoes, U_Modulo, U_PesqIncremento, U_Principal;

{$R *.dfm}

procedure TFrm_BoletimAlternadoNota.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end
     else if key = #27 then close;
end;

procedure TFrm_BoletimAlternadoNota.FormShow(Sender: TObject);
begin
     AbreTabela;
     if not (IBQ_NotaAlternada.isempty) and (aFuncoes.MessageDlgDef(
     'Deseja apagar os alunos registrados anteriormente ?',mtConfirmation,
     [mbyes,mbno],mryes,0)= mryes) then
     try
        If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
           Frm_Modulo.IBT_Transaction.StartTransaction;
        aFuncoes.STOperaRegistrosIB('DELETE FROM tb_NotaAlternada',[0]);
        aFuncoes.STOperaRegistrosIB('UPDATE TB_MATRICULA SET MATRPRIN=:W1',['']);
        Frm_Modulo.IBT_Transaction.CommitRetaining;
     except
        Frm_Modulo.IBT_Transaction.rollback;
        aFuncoes.MessageDlgDef('Não foi possível excluir os boletins anteriores !'
        ,mtWarning, [mbok],mrok, 0);
     end;
     AbreTabela;

     wSairClick            := false;
     Edt_ano.text          := '';
     edt_serie.text        := '';
     Edt_aluno.text        := '';
     Pnl_nomealuno.caption := '';
     Edt_ano.setfocus;
end;

procedure TFrm_BoletimAlternadoNota.Edt_AnoKeyPress(Sender: TObject; var Key: Char);
begin
     if not (Key in ['0'..'9',#3, #8, #22, #24]) then Key := #0;
end;

procedure TFrm_BoletimAlternadoNota.Edt_AnoExit(Sender: TObject);
begin
     if not aFuncoes.ValidaAno(Edt_Ano.Text) THEN
        Edt_Ano.SETFOCUS;
end;

procedure TFrm_BoletimAlternadoNota.Edt_serieExit(Sender: TObject);
begin
     if (Trim(Edt_serie.text) <> '') and not (Afuncoes.Localizaindice(
     Frm_Modulo.IBQ_Funcoes,'Select * from tb_serie','where sericodg=:wcodg',
     [Edt_serie.Text])) then
     begin
          aFuncoes.MessageDlgDef('Código da série informado inválido...',
          mtInformation,[mbok],mrok,0);
          Edt_serie.setfocus;
     end;
end;

procedure TFrm_BoletimAlternadoNota.Spb_LocalizaSerieClick(Sender: TObject);
begin
     LocalizaSerie('');
end;

//------------------------------------------------------------------------------
procedure TFrm_BoletimAlternadoNota.LocalizaSerie(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_serie.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select sericodg,seridesc from tb_serie where ',
     ['Código','Série'],'oa',[0],['sericodg','seridesc'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_serie.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_BoletimAlternadoNota.FormCloseQuery(Sender: TObject;var CanClose: Boolean);
begin
     canclose := true;
end;

procedure TFrm_BoletimAlternadoNota.Button2Click(Sender: TObject);
begin
     wSairClick := true;
end;

procedure TFrm_BoletimAlternadoNota.Spb_localizaalunoClick(Sender: TObject);
begin
     LocalizaAluno('');
end;

//------------------------------------------------------------------------------
procedure TFrm_BoletimAlternadoNota.LocalizaAluno(WPPrimLetra: string);
//------------------------------------------------------------------------------
var wselect : string;
begin
     Edt_aluno.Setfocus;
     if trim(edt_serie.text) = '' then
     begin
     if Frm_PesqIncremento.AbrePesquisa('select alunmatr,alunnome from tb_aluno where ',
     ['Código','Aluno'],'oo',[0],['alunmatr','alunnome'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_aluno.text := Frm_PesqIncremento.Retorno;
     end
     else
     begin
        wselect := 'SELECT DISTINCT MATRALUN,ALUNNOME FROM TB_MATRICULA, TB_ALUNO';
        if not Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
        wselect,'where MATRALUN=ALUNMATR AND MATRSERI=:W1',
        [edt_serie.Text]) then
           wselect := 'SELECT DISTINCT MATRALUN,ALUNNOME FROM TB_MATRCONCEITO, TB_ALUNO';
        if Frm_PesqIncremento.AbrePesquisa(wselect+
        ' WHERE MATRALUN=ALUNMATR AND MATRSERI='''+edt_serie.Text+''' AND ',
        ['Código','Aluno'],'oo',[0],['MATRALUN','ALUNNOME'],1,['S','S'],
        WPPrimLetra) = mrOk then
          Edt_aluno.text := Frm_PesqIncremento.Retorno;
     end;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_BoletimAlternadoNota.edt_alunoExit(Sender: TObject);
begin
     if (Trim(Edt_aluno.text) <> '') then
     begin
          if not (Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
          'Select * from tb_aluno','where alunmatr=:wcodg',[Edt_aluno.Text]))
          then
          begin
               aFuncoes.MessageDlgDef('Código do aluno informado inválido...',
               mtInformation,[mbok],mrok,0);
               Edt_aluno.setfocus;
          end
          else Pnl_nomealuno.caption := Frm_Modulo.IBQ_Funcoes.fieldbyname(
                                        'alunnome').AsString;
     end
     else Pnl_nomealuno.caption := '';
end;

procedure TFrm_BoletimAlternadoNota.Button3Click(Sender: TObject);
begin
     if (TestaCampoVazio) and (aFuncoes.MessageDlgDef(
     'Confirma a inclusão deste aluno no boletim ?',mtConfirmation,[mbyes,mbno],
     mryes,0)= mryes) then
     begin
          if not (Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
          'Select * from tb_notaalternada','where notaalun=:w1 and notaseri=:w2 and nota_ano=:w3'
          ,[Edt_aluno.Text,EDT_serie.text,edt_ano.text]))
          then
          try
             If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                Frm_Modulo.IBT_Transaction.StartTransaction;
             with Frm_Modulo.IBQ_funcoes do
             begin
                  close;
                  Sql.clear;
                  Sql.add('INSERT INTO tb_NotaAlternada (NOTAALUN,NOTASERI,NOTA_ANO)');
                  Sql.add('VALUES (:WNOTAALUN,:WNOTASERI,:WNOTA_ANO)');
                  parambyname('WNOTAALUN').asstring   := EDT_aluno.text;
                  parambyname('WNOTAseri').asstring   := EDT_serie.text;
                  parambyname('WNOTA_ANO').asstring   := EDT_ano.text;
                  if not prepared then prepare;
                  execsql;

                  close;
                  Sql.clear;
                  Sql.add('UPDATE TB_MATRICULA SET MATRPRIN=''*''');
                  Sql.add('WHERE MATR_ANO=:W1 AND MATRSERI=:W2 AND MATRALUN=:W3');
                  parambyname('W3').asstring := EDT_aluno.text;
                  parambyname('W2').asstring := EDT_serie.text;
                  parambyname('W1').asstring := EDT_ano.text;
                  if not prepared then prepare;
                  execsql;

             end;
             Frm_Modulo.IBT_Transaction.CommitRetaining;
          except
             Frm_Modulo.IBT_Transaction.rollback;
             aFuncoes.MessageDlgDef('Não foi possível registar a mensalidade do aluno !'
             ,mtWarning, [mbok],mrok, 0);
          end;
          AbreTabela;
     end;
end;

//------------------------------------------------------------------------------
function TFrm_BoletimAlternadoNota.TestaCampoVazio: Boolean;
//------------------------------------------------------------------------------
begin
     Result:=False;
     if not aFuncoes.TestaCampoVazio(Edt_ano.text,
     'o ano da mensalidade') then
          Edt_ano.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_serie.text,
     'a série do aluno') then
          Edt_serie.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_aluno.text,
     'a matrícula do aluno') then
          Edt_aluno.SetFocus
     else Result:=True;
end;

procedure TFrm_BoletimAlternadoNota.AbreTabela;
begin
     IBQ_NotaAlternada.close;
     IBQ_NotaAlternada.prepare;
     IBQ_NotaAlternada.open;
end;

procedure TFrm_BoletimAlternadoNota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     IBQ_NotaAlternada.close;
     Frm_Modulo.IBQ_Funcoes.close;
end;

procedure TFrm_BoletimAlternadoNota.DBGrid1KeyDown(Sender: TObject; var Key: Word;
          Shift: TShiftState);
var w1, w2, w3 : string;
begin
     with IBQ_NotaAlternada do
     begin
          if not isEmpty then
          case key of
               46: if (afuncoes.MessageDlgdef(
               'Confirma a exclusão deste aluno ?',
               mtConfirmation, [mbYes,mbNo],mryes, 0) = mryes) then
               begin
                    w1 := fieldbyname('notaalun').asstring;
                    w2 := fieldbyname('notaseri').asstring;
                    w3 := fieldbyname('nota_ano').asstring;

                    try
                    If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                       Frm_Modulo.IBT_Transaction.StartTransaction;
                    aFuncoes.STOperaRegistrosIB('DELETE FROM tb_NotaAlternada WHERE NOTAALUN=:W1 AND NOTASERI=:W2 AND NOTA_ANO=:W3',
                    [w1,w2,w3]);
                    aFuncoes.STOperaRegistrosIB('UPDATE TB_MATRICULA SET MATRPRIN='''' WHERE MATR_ANO=:W3 AND MATRSERI=:W2 AND MATRALUN=:W1',
                    [w1,w2,w3]);

                    Frm_Modulo.IBT_Transaction.CommitRetaining;
                    except
                    Frm_Modulo.IBT_Transaction.rollback;
                    aFuncoes.MessageDlgDef('Não foi possível excluir o boleto anterior !'
                    ,mtWarning, [mbok],mrok, 0);
                    end;
                    AbreTabela;
               end;
               32:
               begin
               end;
          end;
     end;
end;

procedure TFrm_BoletimAlternadoNota.Button1Click(Sender: TObject);
begin
     if IBQ_NotaAlternada.isEmpty then
        afuncoes.MessageDlgdef('Nenhum aluno a ser impresso...',
        mtInformation, [mbok],mrok, 0)
     else
     begin
          if afuncoes.MessageDlgdef(
          'Deseja imprimir os boletins com preenchimento ?',
          mtConfirmation, [mbYes,mbNo],mryes, 0) = mryes then
               Frm_Principal.Imp_BoletimNota(true,false,2)
          else Frm_Principal.Imp_BoletimNota(false,false,2);
     end;
end;

end.
