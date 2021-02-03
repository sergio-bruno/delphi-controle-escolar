unit U_RelAlu004;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TQrp_RelAlu004 = class(TQuickRep)
    QRBand1: TQRBand;
    Qrl_NomeEscola: TQRLabel;
    qrl_1: TQRLabel;
    qrl_2: TQRLabel;
    qrl_3: TQRLabel;
    qrl_4: TQRLabel;
    qrl_5: TQRLabel;
    qrl_6: TQRLabel;
    qrl_7: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrs_1: TQRShape;
    qrl_8: TQRLabel;
    qrl_08: TQRLabel;
    qrl_9: TQRLabel;
    qrl_11: TQRLabel;
    qrl_10: TQRLabel;
    qrl_20: TQRLabel;
    qrl_21: TQRLabel;
    qrl_31: TQRLabel;
    qrl_30: TQRLabel;
    qrl_40: TQRLabel;
    qrl_41: TQRLabel;
    qrl_51: TQRLabel;
    qrl_50: TQRLabel;
    qrl_60: TQRLabel;
    qrl_61: TQRLabel;
    qrl_71: TQRLabel;
    qrl_70: TQRLabel;
    qrl_80: TQRLabel;
    qrl_81: TQRLabel;
    qrl_13: TQRLabel;
    qrl_12: TQRLabel;
    qrl_14: TQRLabel;
    qrs_2: TQRShape;
    QRShape2: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    qrl_ordem: TQRLabel;
    QRImage1: TQRImage;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport:
              Boolean);
  end;

var  Qrp_RelAlu004 : TQrp_RelAlu004;
     wxOrd         : integer;

implementation

uses u_modulo, U_Principal;

{$R *.DFM}

procedure TQrp_RelAlu004.QRBand1BeforePrint(Sender: TQRCustomBand;var PrintBand:
          Boolean);
begin
     if pagenumber <= 1 then
     begin
          qrband1.Height := 221;
          qrl_nomeescola.Enabled := true;
          qrl_1.Enabled := true;
          qrl_2.Enabled := true;
          qrl_3.Enabled := true;
          qrl_4.Enabled := true;
          qrl_5.Enabled := true;
          qrl_6.Enabled := true;
          qrl_7.Enabled := true;
          qrs_1.Top  := 182;
          qrl_8.Top  := 185;
          qrl_08.Top := 202;
          qrl_9.Top  := 194;
          qrl_10.Top  := 185;
          qrl_11.Top  := 202;
          qrl_20.Top  := 185;
          qrl_21.Top  := 202;
          qrl_30.Top  := 185;
          qrl_31.Top  := 202;
          qrl_40.Top  := 185;
          qrl_41.Top  := 202;
          qrl_50.Top  := 185;
          qrl_51.Top  := 202;
          qrl_60.Top  := 185;
          qrl_61.Top  := 202;
          qrl_70.Top  := 185;
          qrl_71.Top  := 202;
          qrl_80.Top  := 185;
          qrl_81.Top  := 202;
          qrl_12.Top  := 185;
          qrl_13.Top  := 202;
          qrl_14.Top  := 194;
          qrs_2.Top   := 217;
     end
     else
     begin
          qrband1.Height := 39;
          qrl_nomeescola.Enabled := false;
          qrl_1.Enabled := false;
          qrl_2.Enabled := false;
          qrl_3.Enabled := false;
          qrl_4.Enabled := false;
          qrl_5.Enabled := false;
          qrl_6.Enabled := false;
          qrl_7.Enabled := false;
          qrs_1.Top  := 0;
          qrl_8.Top  := 3;
          qrl_08.Top := 20;
          qrl_9.Top  := 12;
          qrl_10.Top  := 3;
          qrl_11.Top  := 20;
          qrl_20.Top  := 3;
          qrl_21.Top  := 20;
          qrl_30.Top  := 3;
          qrl_31.Top  := 20;
          qrl_40.Top  := 3;
          qrl_41.Top  := 20;
          qrl_50.Top  := 3;
          qrl_51.Top  := 20;
          qrl_60.Top  := 3;
          qrl_61.Top  := 20;
          qrl_70.Top  := 3;
          qrl_71.Top  := 20;
          qrl_80.Top  := 3;
          qrl_81.Top  := 20;
          qrl_12.Top  := 3;
          qrl_13.Top  := 20;
          qrl_14.Top  := 3;
          qrs_2.Top   := 35;
     end
end;

procedure TQrp_RelAlu004.QRBand2BeforePrint(Sender: TQRCustomBand;
          var PrintBand: Boolean);
begin
     wxOrd := wxOrd + 1;
     qrl_ordem.caption := inttostr(wxOrd);
end;

procedure TQrp_RelAlu004.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
     //qrimage1.Picture.BitMap := frm_principal.wLogoPasso;
     wxOrd := 0;
end;

end.
