unit U_MensalidadePorSerie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  Grids, DBGrids;

type
  TFrm_MensalidadePorSerie = class(TForm)
    Panel1: TPanel;
    SPB_help: TSpeedButton;
    Pnl_Calendario: TPanel;
    Btn_Sair: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Edt_Ano: TEdit;
    Label2: TLabel;
    Edt_serie: TEdit;
    Spb_LocalizaSerie: TSpeedButton;
    Pnl_descricaoserie: TPanel;
    IBQ_AlunoPorSerie: TIBQuery;
    Dts_AlunoPorSerie: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    IBQ_AlunoPorSerieTIPO: TIBStringField;
    IBQ_AlunoPorSerieMENSALUN: TIBStringField;
    IBQ_AlunoPorSerieALUNNOME: TIBStringField;
    IBQ_AlunoPorSerieMENSPAGO: TIBStringField;
    Label3: TLabel;
    Edt_mes: TEdit;
    Rdg_situacao: TRadioGroup;
    procedure Edt_AnoExit(Sender: TObject);
    procedure Edt_AnoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Btn_SairClick(Sender: TObject);
    procedure Edt_serieExit(Sender: TObject);
    procedure Spb_LocalizaSerieClick(Sender: TObject);
    procedure LocalizaSerie(WPPrimLetra: string);
    procedure FormShow(Sender: TObject);
    procedure Edt_mesExit(Sender: TObject);
    procedure IBQ_AlunoPorSerieTIPOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure IBQ_AlunoPorSerieMENSPAGOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  end;

var Frm_MensalidadePorSerie: TFrm_MensalidadePorSerie;

implementation

uses u_funcoes, u_modulo, U_PesqIncremento;

{$R *.dfm}

procedure TFrm_MensalidadePorSerie.Edt_AnoExit(Sender: TObject);
begin
     if not aFuncoes.ValidaAno(Edt_Ano.Text) THEN
        Edt_Ano.SETFOCUS;
end;

procedure TFrm_MensalidadePorSerie.Edt_AnoKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not (Key in ['0'..'9',#3, #8, #22, #24]) then Key := #0;
end;

procedure TFrm_MensalidadePorSerie.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end
     else if key = #27 then close;
end;

procedure TFrm_MensalidadePorSerie.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     IBQ_AlunoPorSerie.close;
end;

procedure TFrm_MensalidadePorSerie.Button1Click(Sender: TObject);
begin
     with IBQ_AlunoPorSerie do
     begin
          close;
          sql.Clear;
          sql.Add('SELECT DISTINCT '''+'N'' AS TIPO,M.MENSALUN,A.ALUNNOME,M.MENSPAGO');
          sql.Add('FROM TB_MENSALIDADE M, TB_MATRICULA T, TB_ALUNO A');
          sql.Add('WHERE M.MENS_ANO=T.MATR_ANO AND M.MENSALUN=T.MATRALUN');
          sql.Add('AND M.MENSALUN=A.ALUNMATR');
          sql.Add('AND (A.ALUNINAT ='''+'N'' OR (A.ALUNINAT = '''+'S'' AND A.ALUNDTIN + 35 > M.MENSDTVC))');
          if (trim(edt_ano.Text) <> '') then
               sql.Add('AND MENS_ANO='''+edt_ano.text+'''');
          if (trim(edt_serie.Text) <> '') then
               sql.Add('AND MATRSERI='''+edt_serie.text+'''');
          if (trim(edt_mes.Text) <> '') then
               sql.Add('AND MENS_MES='''+edt_mes.text+'''');
          case rdg_situacao.itemindex of
               0: sql.Add('AND MENSPAGO='''+'S''');
               1: sql.Add('AND MENSPAGO='''+'N''');
          end;
          sql.Add('UNION');
          sql.Add('SELECT DISTINCT '''+'C'' AS TIPO,M.MENSALUN,A.ALUNNOME,M.MENSPAGO');
          sql.Add('FROM TB_MENSALIDADE M, TB_MATRCONCEITO T, TB_ALUNO A');
          sql.Add('WHERE M.MENS_ANO=T.MATR_ANO AND M.MENSALUN=T.MATRALUN');
          sql.Add('AND M.MENSALUN=A.ALUNMATR');
          sql.Add('AND (A.ALUNINAT ='''+'N''  OR (A.ALUNINAT = '''+'S'' AND A.ALUNDTIN + 35 > M.MENSDTVC))');
          if (trim(edt_ano.Text) <> '') then
               sql.Add('AND MENS_ANO='''+edt_ano.text+'''');
          if (trim(edt_serie.Text) <> '') then
               sql.Add('AND MATRSERI='''+edt_serie.text+'''');
          if (trim(edt_mes.Text) <> '') then
               sql.Add('AND MENS_MES='''+edt_mes.text+'''');
          case rdg_situacao.itemindex of
               0: sql.Add('AND MENSPAGO='''+'S''');
               1: sql.Add('AND MENSPAGO='''+'N''');
          end;
          if not prepared then prepare;
          open;
     end;
end;

procedure TFrm_MensalidadePorSerie.Btn_SairClick(Sender: TObject);
begin
     close;
end;

procedure TFrm_MensalidadePorSerie.Edt_serieExit(Sender: TObject);
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

procedure TFrm_MensalidadePorSerie.Spb_LocalizaSerieClick(Sender: TObject);
begin
     LocalizaSerie('');
end;

//------------------------------------------------------------------------------
procedure TFrm_MensalidadePorSerie.LocalizaSerie(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_serie.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select sericodg,seridesc from tb_serie where ',
     ['Código','Série'],'oa',[0],['sericodg','seridesc'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_serie.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_MensalidadePorSerie.FormShow(Sender: TObject);
begin
     edt_ano.text := '';
     edt_serie.text := '';
     Edt_mes.Text   := '';
     Pnl_descricaoserie.caption := '';
     rdg_situacao.itemindex := 1;
     Edt_mes.setfocus;
end;

procedure TFrm_MensalidadePorSerie.Edt_mesExit(Sender: TObject);
begin
     if not aFuncoes.ValidaMes(Edt_mes.Text) THEN Edt_mes.SETFOCUS;
end;

procedure TFrm_MensalidadePorSerie.IBQ_AlunoPorSerieTIPOGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
     if DisplayText then
     begin
        if Sender.asstring = 'C' then
             Text := 'CONCEITO'
        else if Sender.asstring = 'N' then
             Text := 'NOTA'
        else Text := Sender.asstring;
     end;
end;

procedure TFrm_MensalidadePorSerie.IBQ_AlunoPorSerieMENSPAGOGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
     if DisplayText then
     begin
        if Sender.asstring = 'S' then
             Text := 'SIM'
        else if Sender.asstring = 'N' then
             Text := 'NÃO'
        else Text := Sender.asstring;
     end;
end;

end.
