unit U_FiltData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, rxToolEdit;

type
  TFrm_FiltData = class(TForm)
    Grb_Cliente: TGroupBox;
    Lbl_DataInicial: TLabel;
    Lbl_DataFinal: TLabel;
    Btb_Ok: TBitBtn;
    Btb_Cancelar: TBitBtn;
    Dte_DataInicial: TDateEdit;
    Dte_DataFinal: TDateEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DataExit(Sender: TObject);
    procedure Btb_CancelarClick(Sender: TObject);
    function  MostraForm: word;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  public
    wRetorno: array[0..1] of string;
  end;

var Frm_FiltData: TFrm_FiltData;
    wSairClick     : boolean; { variavel para saber se o botao sair foi clicado }

const wMensData1 = 'A data inicial tem que ser menor ou igual a data final !';
      wMensData2 = 'A data final tem que ser maior ou igual a data inicial !';

implementation

uses U_Funcoes, U_Principal;

{$R *.DFM}

//---------------------------------------------------------------------
function TFrm_FiltData.MostraForm: word;
//---------------------------------------------------------------------
begin Result := ShowModal;
end;

//---------------------------------------------------------------------
procedure TFrm_FiltData.FormKeyPress(Sender: TObject; var Key: Char);
//---------------------------------------------------------------------
begin
     if (key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end
     else if (Key = #27) then Close;
end;

//---------------------------------------------------------------------
procedure TFrm_FiltData.FormShow(Sender: TObject);
//---------------------------------------------------------------------
begin
     Frm_FiltData.caption  := Frm_Principal.wNomeEmpresa;
     wSairClick           := false;
     Dte_DataInicial.Text := '';
     Dte_DataFinal.Text   := '';
     Dte_DataInicial.SetFocus;
end;

//-----------------------------------------------------------------------
procedure TFrm_FiltData.DataExit(Sender: TObject);
//-----------------------------------------------------------------------
begin
     if not aFuncoes.VerificaDatas(Dte_DataInicial.Text, Dte_DataFinal.Text, (Sender as TMaskEdit).Tag, wMensData1, wMensData2) then
          (Sender as TMaskEdit).SetFocus
     else if (Sender as TMaskEdit).Tag = 1 then Dte_DataFinal.Text := Dte_DataInicial.Text;
end;

//-----------------------------------------------------------------------
procedure TFrm_FiltData.Btb_CancelarClick(Sender: TObject);
//-----------------------------------------------------------------------
begin
     wSairClick := true;
end;

//-----------------------------------------------------------------------
procedure TFrm_FiltData.FormCloseQuery(Sender: TObject;var CanClose: Boolean);
//-----------------------------------------------------------------------
var wCodIni, wCodFim, wDatIni, wDatFim : string;
begin
     if not wSairClick then
     begin
          CanClose := false;
          wDatIni  := Trim(Dte_DataInicial.Text);
          wDatFim  := Trim(Dte_DataFinal.Text);
          if (wDatIni = '/  /') and (wDatFim <> '/  /') then
          begin
               MessageDlg('A data inicial precisa ser informada.', mtInformation,[mbOk], 0);
               Dte_DataInicial.SetFocus;
          end
          else if (wDatIni <> '/  /') and (wDatFim = '/  /') then
          begin
               MessageDlg('A data final precisa ser informada.', mtInformation,[mbOk], 0);
               Dte_DataFinal.SetFocus;
          end
          else if (wDatIni = '/  /') and (wDatFim = '/  /') then
          begin
               MessageDlg('A data inicial e final precisam ser informadas.', mtInformation,[mbOk], 0);
               Dte_DataInicial.SetFocus;
          end
          else
          begin
               wRetorno[0] := Dte_DataInicial.Text;
               wRetorno[1] := Dte_DataFinal.Text;
               CanClose    := true;
          end;
     end
     else CanClose := true;
end;

end.
