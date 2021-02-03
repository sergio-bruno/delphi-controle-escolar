unit U_AlunosPorSerie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  Grids, DBGrids;

type
  TFrm_AlunosPorSerie = class(TForm)
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
    IBQ_AlunoPorSerieMATRALUN: TIBStringField;
    IBQ_AlunoPorSerieALUNNOME: TIBStringField;
    DBGrid1: TDBGrid;
    Button1: TButton;
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
    public wTipoMatricula : string;
  end;

var
  Frm_AlunosPorSerie: TFrm_AlunosPorSerie;

implementation

uses u_funcoes, u_modulo, U_PesqIncremento;

{$R *.dfm}

procedure TFrm_AlunosPorSerie.Edt_AnoExit(Sender: TObject);
begin
     if not aFuncoes.ValidaAno(Edt_Ano.Text) THEN
        Edt_Ano.SETFOCUS;
end;

procedure TFrm_AlunosPorSerie.Edt_AnoKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not (Key in ['0'..'9',#3, #8, #22, #24]) then Key := #0;
end;

procedure TFrm_AlunosPorSerie.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end
     else if key = #27 then close;
end;

procedure TFrm_AlunosPorSerie.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     IBQ_AlunoPorSerie.close;
end;

procedure TFrm_AlunosPorSerie.Button1Click(Sender: TObject);
var wwhere : boolean;
begin
     with IBQ_AlunoPorSerie do
     begin
          wwhere := FALSE;
          close;
          sql.Clear;
          if wTipoMatricula = 'N' then
               sql.Add('SELECT DISTINCT MATRALUN,ALUNNOME FROM TB_MATRICULA')
          else sql.Add('SELECT DISTINCT MATRALUN,ALUNNOME FROM TB_MATRCONCEITO');
          sql.Add('LEFT OUTER JOIN TB_ALUNO ON MATRALUN=ALUNMATR');
          if (trim(edt_ano.Text) <> '') then
          begin
               wwhere := true;
               sql.Add('WHERE MATR_ANO='''+edt_ano.text+'''');
          end;
          if (trim(edt_serie.Text) <> '') then
          begin
               if wwhere then
                    sql.Add('AND MATRSERI='''+edt_serie.text+'''')
               else sql.Add('WHERE MATRSERI='''+edt_serie.text+'''');
          end;
          if not prepared then prepare;
          open;
     end;
end;

procedure TFrm_AlunosPorSerie.Btn_SairClick(Sender: TObject);
begin
     close;
end;

procedure TFrm_AlunosPorSerie.Edt_serieExit(Sender: TObject);
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

procedure TFrm_AlunosPorSerie.Spb_LocalizaSerieClick(Sender: TObject);
begin
     LocalizaSerie('');
end;

//------------------------------------------------------------------------------
procedure TFrm_AlunosPorSerie.LocalizaSerie(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_serie.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select sericodg,seridesc from tb_serie where ',
     ['Código','Série'],'oa',[0],['sericodg','seridesc'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_serie.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_AlunosPorSerie.FormShow(Sender: TObject);
begin
     edt_ano.text := '';
     edt_serie.text := '';
     Pnl_descricaoserie.caption := '';
     edt_ano.setfocus;
end;

end.
