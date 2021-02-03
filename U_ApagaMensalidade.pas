unit U_ApagaMensalidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFrm_ApagaMensalidade = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Spb_localizaaluno: TSpeedButton;
    Cmb_mes: TComboBox;
    Edt_Ano: TEdit;
    edt_aluno: TEdit;
    pnl_nomealuno: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure Edt_AnoExit(Sender: TObject);
    procedure Edt_AnoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_alunoExit(Sender: TObject);
    procedure Spb_localizaalunoClick(Sender: TObject);
    procedure LocalizaAluno(WPPrimLetra: string);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_ApagaMensalidade: TFrm_ApagaMensalidade;

implementation

uses U_Modulo, U_PesqIncremento, U_Funcoes;

{$R *.dfm}

procedure TFrm_ApagaMensalidade.Edt_AnoExit(Sender: TObject);
begin
     if not aFuncoes.ValidaAno(Edt_Ano.Text) THEN
        Edt_Ano.SETFOCUS;

end;

procedure TFrm_ApagaMensalidade.Edt_AnoKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not (Key in ['0'..'9',#3, #8, #22, #24]) then Key := #0;
end;

procedure TFrm_ApagaMensalidade.edt_alunoExit(Sender: TObject);
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

procedure TFrm_ApagaMensalidade.Spb_localizaalunoClick(Sender: TObject);
begin
     LocalizaAluno('');
end;

//------------------------------------------------------------------------------
procedure TFrm_ApagaMensalidade.LocalizaAluno(WPPrimLetra: string);
//------------------------------------------------------------------------------
var wselect : string;
begin
     Edt_aluno.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select alunmatr,alunnome from tb_aluno where ',
     ['Código','Aluno'],'oo',[0],['alunmatr','alunnome'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_aluno.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_ApagaMensalidade.FormShow(Sender: TObject);
begin
     Cmb_mes.ItemIndex     := 0;
     Edt_ano.text          := '';
     Edt_aluno.text        := '';
     Pnl_nomealuno.caption := '';
     Cmb_mes.setfocus;

end;

end.
