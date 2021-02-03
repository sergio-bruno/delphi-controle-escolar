unit U_RelAlu003;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TQrp_RelAlu003 = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    Qrl_NomeEscola: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    Qrl_nomerel: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
  private

  public

  end;

var
  Qrp_RelAlu003: TQrp_RelAlu003;

implementation

uses u_modulo;

{$R *.DFM}

end.
