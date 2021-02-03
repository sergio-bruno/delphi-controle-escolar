unit U_SelecionaAlunoMatricula;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, ComCtrls;

type
  TFrm_SelecionaAlunoMatricula = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Spb_LocalizaSerie: TSpeedButton;
    Button1: TButton;
    Edt_Ano: TEdit;
    Edt_serie: TEdit;
    Pnl_descricaoserie: TPanel;
    Rdg_Ordem: TRadioGroup;
    Panel3: TPanel;
    Button2: TButton;
    Prb_matricula: TProgressBar;
    Label3: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Rdg_OrdemClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edt_AnoKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Edt_AnoExit(Sender: TObject);
    procedure Edt_serieExit(Sender: TObject);
    procedure Spb_LocalizaSerieClick(Sender: TObject);
    procedure LocalizaSerie(WPPrimLetra: string);
    Procedure FiltraDisciplina(WCodigo: string);
  end;

var Frm_SelecionaAlunoMatricula: TFrm_SelecionaAlunoMatricula;

implementation

uses u_modulo, U_Funcoes, U_PesqIncremento, U_Principal;

{$R *.dfm}

procedure TFrm_SelecionaAlunoMatricula.FormKeyPress(Sender: TObject; var Key:
          Char);
begin
     If (Key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end;
     // PARA PODER CANCELAR A SELECAO NO DBGRID
     //else if key = #27 then close;
end;

procedure TFrm_SelecionaAlunoMatricula.FormShow(Sender: TObject);
begin
     Prb_matricula.position := 0;
     Edt_ano.Text := '';
     Edt_serie.Text := '';
     Pnl_descricaoserie.caption := '';
     Edt_ano.setfocus;
     Rdg_Ordem.ItemIndex := 1;
     afuncoes.AbreQuery(Frm_Modulo.IBQ_Aluno,'SELECT * FROM TB_ALUNO WHERE ALUNINAT='''+'N'' ORDER BY ALUNNOME');
end;

procedure TFrm_SelecionaAlunoMatricula.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Frm_Modulo.IBQ_Aluno.close;
     Frm_Modulo.IBQ_DisciplinaSerie.close;

     // ATUALIZAR A LISTA DE MATRICULA
     Frm_Modulo.IBQ_Matricula.close;
     Frm_Modulo.IBQ_Matricula.open;
end;

procedure TFrm_SelecionaAlunoMatricula.Rdg_OrdemClick(Sender: TObject);
begin
     case Rdg_Ordem.ItemIndex of
          0: afuncoes.AbreQuery(Frm_Modulo.IBQ_Aluno,'SELECT * FROM TB_ALUNO WHERE ALUNINAT='''+'N'' ORDER BY ALUNMATR');
          1: afuncoes.AbreQuery(Frm_Modulo.IBQ_Aluno,'SELECT * FROM TB_ALUNO WHERE ALUNINAT='''+'N'' ORDER BY ALUNNOME');
     end;
end;

procedure TFrm_SelecionaAlunoMatricula.Button1Click(Sender: TObject);
var i, j: Integer;
    wzmes, wvenc : string;
begin
     if not aFuncoes.TestaCampoVazio(Edt_ano.text,'o ano de matrícula') then
          Edt_ano.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_serie.text,'a série') then
          Edt_serie.SetFocus
     else if DBGrid1.SelectedRows.Count <= 0 then
          aFuncoes.MessageDlgDef('Nenhum aluno foi selecionado, é necessário selecioná-los, mantenha a tecla '
          +#13+'SHIFT pressionada e click com o mouse sobre o aluno desejado.',
          mtInformation,[mbok],mrok,0)
     else if (aFuncoes.MessageDlgDef('Confirma a matrícula dos alunos selecionados ?',
     mtConfirmation,[mbCancel, mbYes], mryes, 0) = mrYes) then
     begin
          // FILTRAR AS CADEIRAS DA SERIE
          FiltraDisciplina(Edt_serie.text);
          if Frm_Modulo.IBQ_DisciplinaSerie.IsEmpty then
          begin
               aFuncoes.MessageDlgDef('Nenhum disciplina está relacionada a esta série...'
               +#13+'a matrícula será cancelada, verifique.',mtInformation,[mbok],
               mrok,0);
               exit;
          end;

          for i:=0 to DBGrid1.SelectedRows.Count-1 do
          begin
               DBGrid1.DataSource.DataSet.GotoBookmark(pointer(DBGrid1.SelectedRows.Items[i]));

               // VERIFICAR SE ESTE ALUNO JA FOI ATRICULADO ESTE ANO
               if afuncoes.DecideMatriculaDuplicada(Edt_ano.text,Edt_serie.Text,
               DBGrid1.DataSource.DataSet.Fields[0].AsString,
               DBGrid1.DataSource.DataSet.Fields[1].AsString,
               Pnl_descricaoserie.caption) then
               begin
               // CADASTRANDO A TABELA DE MATRICULA COM AS DISCIPLINAS
               Frm_Modulo.IBQ_DisciplinaSerie.first;
               while not Frm_Modulo.IBQ_DisciplinaSerie.eof do
               begin
                    if not Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes,
                    'Select * from TB_MATRICULA',
                    'where matr_ano=:wa and matrseri=:ws and matralun=:wd and matrdisc=:wc',
                    [Edt_ano.text,Edt_serie.Text,DBGrid1.DataSource.DataSet.Fields[0].AsString,
                    Frm_Modulo.IBQ_DisciplinaSerie.fieldbyname('dissdisc').asstring]) then
                    try
                       If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                          Frm_Modulo.IBT_Transaction.StartTransaction;
                       with Frm_Modulo.IBQ_funcoes do
                       begin
                         close;
                         Sql.clear;
                         Sql.add('INSERT INTO TB_MATRICULA (MATR_ANO,MATRSERI,');
                         Sql.add('MATRALUN,MATRDISC,MATRAGEN)');
                         Sql.add('VALUES (:WMATR_ANO,:WMATRSERI,:WMATRALUN,');
                         Sql.add(':WMATRDISC,:WMATRAGEN)');
                         parambyname('WMATR_ANO').asstring := edt_ano.text;
                         parambyname('WMATRSERI').asstring := edt_serie.text;
                         parambyname('WMATRALUN').asstring := DBGrid1.DataSource.DataSet.Fields[0].AsString;
                         parambyname('WMATRDISC').asstring := Frm_Modulo.IBQ_DisciplinaSerie.fieldbyname('dissdisc').asstring;
                         parambyname('WMATRAGEN').asstring := Frm_Modulo.IBQ_DisciplinaSerie.fieldbyname('dissagen').asstring;
                         if not prepared then prepare;
                         execsql;
                       end;
                       Frm_Modulo.IBT_Transaction.CommitRetaining;
                    except
                       Frm_Modulo.IBT_Transaction.rollback;
                       aFuncoes.MessageDlgDef('Não foi possível registar o aluno:'
                       +#13+DBGrid1.DataSource.DataSet.Fields[0].AsString+' - '
                       +DBGrid1.DataSource.DataSet.Fields[1].AsString,
                       mtWarning, [mbok],mrok, 0);
                    end;
                    Frm_Modulo.IBQ_DisciplinaSerie.next;
               end;

               // CADASTRANDO A TABELA DE MENSALIDADE
               for j:=1 to 12 do
               begin
                    wzmes := formatfloat('00',j);
                    wvenc := afuncoes.RetornaMesmoMesAno(wzmes,edt_ano.text);
                    if not Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes,
                    'Select * from TB_MENSALIDADE',
                    'where mens_ano=:wa and mens_mes=:wm and mensalun=:wd',
                    [Edt_ano.text,wzmes,DBGrid1.DataSource.DataSet.Fields[
                    0].AsString]) then
                    try
                       If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                          Frm_Modulo.IBT_Transaction.StartTransaction;
                       with Frm_Modulo.IBQ_funcoes do
                       begin
                         close;
                         Sql.clear;
                         Sql.add('INSERT INTO TB_MENSALIDADE (MENS_ANO,MENS_MES,');
                         Sql.add('MENSALUN,MENSDTVC)');
                         Sql.add('VALUES (:WMENS_ANO,:WMENS_MES,:WMENSALUN,:WMENSDTVC)');
                         parambyname('WMENS_ANO').asstring   := edt_ano.text;
                         parambyname('WMENS_MES').asstring   := wzmes;
                         parambyname('WMENSALUN').asstring   := DBGrid1.DataSource.DataSet.Fields[0].AsString;
                         parambyname('WMENSDTVC').asdatetime := aFuncoes.ResultaDataGravar(
                                                                wvenc);
                         if not prepared then prepare;
                         execsql;
                       end;
                       Frm_Modulo.IBT_Transaction.CommitRetaining;
                    except
                       Frm_Modulo.IBT_Transaction.rollback;
                       aFuncoes.MessageDlgDef('Não foi possível registar a mensalidade do aluno:'
                       +#13+DBGrid1.DataSource.DataSet.Fields[0].AsString+' - '
                       +DBGrid1.DataSource.DataSet.Fields[1].AsString,
                       mtWarning, [mbok],mrok, 0);
                    end;
               end;
               end;

               try
                  Prb_matricula.position := round(( i * 100 ) /
                                            DBGrid1.SelectedRows.Count);
               except
               end;
          end;
          Prb_matricula.position := 100;
          aFuncoes.MessageDlgDef('Matrícula realizada com êxito...',
          mtInformation, [mbok],mrok, 0);
          Prb_matricula.position := 0;
     end;
end;

//------------------------------------------------------------------------------
Procedure TFrm_SelecionaAlunoMatricula.FiltraDisciplina(WCodigo: string);
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

procedure TFrm_SelecionaAlunoMatricula.Edt_AnoKeyPress(Sender: TObject;
          var Key: Char);
begin
     if not (Key in ['0'..'9',#3, #8, #22, #24]) then Key := #0;
end;

procedure TFrm_SelecionaAlunoMatricula.Button2Click(Sender: TObject);
begin
     close;
end;

procedure TFrm_SelecionaAlunoMatricula.Edt_AnoExit(Sender: TObject);
begin
     if not aFuncoes.ValidaAno(Edt_Ano.Text) THEN
        Edt_Ano.SETFOCUS;
end;

procedure TFrm_SelecionaAlunoMatricula.Edt_serieExit(Sender: TObject);
begin
     if (Trim(Edt_serie.text) <> '') then
     begin
          if not (Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
          'Select * from tb_serie','where sericodg=:wcodg',[Edt_serie.Text]))
          then
          begin
               aFuncoes.MessageDlgDef('Código da série informado inválido...',
               mtInformation,[mbok],mrok,0);
               Edt_serie.setfocus;
          end
          else Pnl_descricaoserie.caption := Frm_Modulo.IBQ_Funcoes.fieldbyname(
                                             'seridesc').AsString;
     end
     else Pnl_descricaoserie.caption := '';
end;

procedure TFrm_SelecionaAlunoMatricula.Spb_LocalizaSerieClick(Sender: TObject);
begin
     LocalizaSerie('');
end;

//------------------------------------------------------------------------------
procedure TFrm_SelecionaAlunoMatricula.LocalizaSerie(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_serie.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select sericodg,seridesc from tb_serie where ',
     ['Código','Série'],'oa',[0],['sericodg','seridesc'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_serie.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

end.


