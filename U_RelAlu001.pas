unit U_RelAlu001;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TQrp_RelAlu001 = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    Qrl_NomeEscola: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel35: TQRLabel;
    QRShape1: TQRShape;
    QRLabel36: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRShape2: TQRShape;
    QRLabel37: TQRLabel;
    QRDBText18: TQRDBText;
    QRShape3: TQRShape;
    QRLabel38: TQRLabel;
    QRDBText19: TQRDBText;
    QRShape4: TQRShape;
    QRLabel39: TQRLabel;
    QRDBText20: TQRDBText;
    QRShape5: TQRShape;
    QRLabel40: TQRLabel;
    QRDBText21: TQRDBText;
    QRShape6: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRShape7: TQRShape;
    QRDBText22: TQRDBText;
    QRLabel43: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel44: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel47: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRLabel49: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel56: TQRLabel;
    QRDBText36: TQRDBText;
    QRImage1: TQRImage;
    QRShape8: TQRShape;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Qrp_RelAlu001: TQrp_RelAlu001;

implementation

uses u_modulo, U_Principal;

{$R *.DFM}

procedure TQrp_RelAlu001.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
     //qrimage1.Picture.BitMap := frm_principal.wLogoPasso;
end;

end.
