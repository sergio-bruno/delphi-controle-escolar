unit U_RelAlu005;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TQrp_RelAlu005 = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    Qrl_NomeEscola: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    Qrl_nomerel: TQRLabel;
    qrd_2: TQRDBText;
    qrd_7: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    qrd_3: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    qrd_4: TQRDBText;
    qrd_1: TQRDBText;
    qrd_5: TQRDBText;
    qrd_6: TQRDBText;
    QRBand3: TQRBand;
    QRLabel10: TQRLabel;
    qrl_total: TQRLabel;
    qrs_1: TQRShape;
    ChildBand1: TQRChildBand;
    QRLabel14: TQRLabel;
    qrl_subtotal: TQRLabel;
    Pfb_RodaPe: TQRBand;
    Qrl_RodaPe: TQRLabel;
    Qsh_RodaPe: TQRShape;
    procedure QuickRepBeforePrint(Sender:TCustomQuickRep;var PrintReport:
              Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Pfb_RodaPeBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  end;

var Qrp_RelAlu005: TQrp_RelAlu005;
    wgrupo : string;
    wTotal, wSubTotal : real;

implementation

uses u_modulo;

{$R *.DFM}

procedure TQrp_RelAlu005.QuickRepBeforePrint(Sender: TCustomQuickRep; var
          PrintReport: Boolean);
begin
     wgrupo    := '[{[]]]#@!';
     wTotal    := 0;
     wSubTotal := 0;
     Qrl_RodaPe.Caption := 'Continua';
end;

procedure TQrp_RelAlu005.QRBand2BeforePrint(Sender: TQRCustomBand;
          var PrintBand: Boolean);
begin
     wTotal    := wTotal + Frm_Modulo.IBQ_Mensalidade.fieldbyname(
                  'mensvlpg').asfloat;
     wSubTotal := wSubTotal + Frm_Modulo.IBQ_Mensalidade.fieldbyname(
                  'mensvlpg').asfloat;

     if wgrupo <> Frm_Modulo.IBQ_Mensalidade.fieldbyname(
     'mensalun').asstring then
     begin
          wgrupo            := Frm_Modulo.IBQ_Mensalidade.fieldbyname(
                               'mensalun').asstring;
          qrs_1.enabled  := true;
          qrd_1.Enabled  := true;
          qrd_2.Enabled  := true;
          qrd_1.top      := 02;
          qrd_2.top      := 02;
          qrd_3.top      := 02;
          qrd_4.top      := 02;
          qrd_5.top      := 02;
          qrd_6.top      := 02;
          qrd_7.top      := 02;
          qrband2.Height := 18;
     end
     else
     begin
          qrs_1.enabled  := false;
          qrd_1.Enabled  := false;
          qrd_2.Enabled  := false;
          qrd_1.top      := 00;
          qrd_2.top      := 00;
          qrd_3.top      := 00;
          qrd_4.top      := 00;
          qrd_5.top      := 00;
          qrd_6.top      := 00;
          qrd_7.top      := 00;
          qrband2.Height := 16;
     end
end;

procedure TQrp_RelAlu005.QRBand3BeforePrint(Sender: TQRCustomBand;var PrintBand:
          Boolean);
begin
     qrl_total.caption := formatfloat(',0.00',wtotal);
end;

procedure TQrp_RelAlu005.ChildBand1BeforePrint(Sender: TQRCustomBand; var
          PrintBand: Boolean);
begin
     with Frm_Modulo.IBQ_Mensalidade do
     begin
          Next;
          if (wgrupo <> fieldbyname('mensalun').AsString) or (eof) then
          begin
               Qrl_SubTotal.caption := FormatFloat(',0.00',wSubTotal);
               wSubTotal            := 0;
               PrintBand            := true;
          end
          else PrintBand            := false;
          if not Eof then prior;
     end;
end;

procedure TQrp_RelAlu005.Pfb_RodaPeBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     if Frm_Modulo.IBQ_Mensalidade.Eof then
        Qrl_RodaPe.Caption := 'Fim de Relatório';
end;

end.
