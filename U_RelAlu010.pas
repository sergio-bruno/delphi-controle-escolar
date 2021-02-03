unit U_RelAlu010;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TQrp_RelAlu010 = class(TQuickRep)
    QRBand1: TQRBand;
    Qrl_NomeEscola: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel8: TQRLabel;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape72: TQRShape;
    QRShape75: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape63: TQRShape;
    QRLabel20: TQRLabel;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape79: TQRShape;
    QRLabel23: TQRLabel;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel27: TQRLabel;
    qrl_d01: TQRLabel;
    qrl_au01: TQRLabel;
    qrl_tb01: TQRLabel;
    qrl_pb01: TQRLabel;
    qrl_m01: TQRLabel;
    qrl_d02: TQRLabel;
    qrl_au02: TQRLabel;
    qrl_tb02: TQRLabel;
    qrl_pb02: TQRLabel;
    qrl_m02: TQRLabel;
    qrl_d03: TQRLabel;
    qrl_au03: TQRLabel;
    qrl_tb03: TQRLabel;
    qrl_pb03: TQRLabel;
    qrl_m03: TQRLabel;
    qrl_d04: TQRLabel;
    qrl_au04: TQRLabel;
    qrl_tb04: TQRLabel;
    qrl_pb04: TQRLabel;
    qrl_m04: TQRLabel;
    qrl_d05: TQRLabel;
    qrl_au05: TQRLabel;
    qrl_tb05: TQRLabel;
    qrl_pb05: TQRLabel;
    qrl_m05: TQRLabel;
    qrl_d06: TQRLabel;
    qrl_au06: TQRLabel;
    qrl_tb06: TQRLabel;
    qrl_pb06: TQRLabel;
    qrl_m06: TQRLabel;
    qrl_d07: TQRLabel;
    qrl_au07: TQRLabel;
    qrl_tb07: TQRLabel;
    qrl_pb07: TQRLabel;
    qrl_m07: TQRLabel;
    qrl_d08: TQRLabel;
    qrl_au08: TQRLabel;
    qrl_tb08: TQRLabel;
    qrl_pb08: TQRLabel;
    qrl_m08: TQRLabel;
    qrl_d09: TQRLabel;
    qrl_au09: TQRLabel;
    qrl_tb09: TQRLabel;
    qrl_pb09: TQRLabel;
    qrl_m09: TQRLabel;
    qrl_faltas0: TQRLabel;
    qrl_au11: TQRLabel;
    qrl_au12: TQRLabel;
    qrl_au13: TQRLabel;
    qrl_au14: TQRLabel;
    qrl_au15: TQRLabel;
    qrl_au16: TQRLabel;
    qrl_au17: TQRLabel;
    qrl_au18: TQRLabel;
    qrl_tb19: TQRLabel;
    qrl_tb18: TQRLabel;
    qrl_tb17: TQRLabel;
    qrl_tb16: TQRLabel;
    qrl_tb15: TQRLabel;
    qrl_tb14: TQRLabel;
    qrl_tb13: TQRLabel;
    qrl_tb12: TQRLabel;
    qrl_tb11: TQRLabel;
    qrl_pb11: TQRLabel;
    qrl_m11: TQRLabel;
    qrl_m12: TQRLabel;
    qrl_pb13: TQRLabel;
    qrl_pb12: TQRLabel;
    qrl_pb15: TQRLabel;
    qrl_pb16: TQRLabel;
    qrl_pb17: TQRLabel;
    qrl_pb19: TQRLabel;
    qrl_m13: TQRLabel;
    qrl_m14: TQRLabel;
    qrl_m15: TQRLabel;
    qrl_m16: TQRLabel;
    qrl_m17: TQRLabel;
    qrl_m18: TQRLabel;
    qrl_faltas1: TQRLabel;
    qrl_m19: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRShape64: TQRShape;
    QRShape67: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    qrl_au19: TQRLabel;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRLabel76: TQRLabel;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    qrl_pb14: TQRLabel;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    qrl_pb18: TQRLabel;
    QRShape107: TQRShape;
    QRShape108: TQRShape;
    QRShape118: TQRShape;
    QRShape119: TQRShape;
    QRShape120: TQRShape;
    QRShape121: TQRShape;
    QRShape122: TQRShape;
    QRShape123: TQRShape;
    QRShape124: TQRShape;
    QRShape125: TQRShape;
    QRShape126: TQRShape;
    QRShape127: TQRShape;
    QRShape128: TQRShape;
    qrl_au21: TQRLabel;
    qrl_au22: TQRLabel;
    qrl_au23: TQRLabel;
    qrl_au24: TQRLabel;
    qrl_au25: TQRLabel;
    qrl_au26: TQRLabel;
    qrl_au27: TQRLabel;
    qrl_au28: TQRLabel;
    qrl_tb29: TQRLabel;
    qrl_tb28: TQRLabel;
    qrl_tb27: TQRLabel;
    qrl_tb26: TQRLabel;
    qrl_tb25: TQRLabel;
    qrl_tb24: TQRLabel;
    qrl_tb23: TQRLabel;
    qrl_tb22: TQRLabel;
    qrl_tb21: TQRLabel;
    qrl_pb21: TQRLabel;
    qrl_m21: TQRLabel;
    qrl_m22: TQRLabel;
    qrl_pb23: TQRLabel;
    qrl_pb22: TQRLabel;
    qrl_pb25: TQRLabel;
    qrl_pb26: TQRLabel;
    qrl_pb27: TQRLabel;
    qrl_pb29: TQRLabel;
    qrl_m23: TQRLabel;
    qrl_m24: TQRLabel;
    qrl_m25: TQRLabel;
    qrl_m26: TQRLabel;
    qrl_m27: TQRLabel;
    qrl_m28: TQRLabel;
    qrl_faltas2: TQRLabel;
    qrl_m29: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel125: TQRLabel;
    QRShape129: TQRShape;
    QRShape130: TQRShape;
    QRShape131: TQRShape;
    QRShape132: TQRShape;
    QRShape133: TQRShape;
    QRShape134: TQRShape;
    QRShape135: TQRShape;
    QRShape136: TQRShape;
    QRShape137: TQRShape;
    qrl_au29: TQRLabel;
    QRShape138: TQRShape;
    QRShape139: TQRShape;
    QRShape140: TQRShape;
    QRShape141: TQRShape;
    QRShape142: TQRShape;
    QRShape143: TQRShape;
    QRShape144: TQRShape;
    QRShape145: TQRShape;
    QRShape146: TQRShape;
    QRShape147: TQRShape;
    QRLabel127: TQRLabel;
    QRShape148: TQRShape;
    QRShape149: TQRShape;
    QRShape150: TQRShape;
    QRShape151: TQRShape;
    QRShape152: TQRShape;
    qrl_pb24: TQRLabel;
    QRShape153: TQRShape;
    QRShape154: TQRShape;
    QRShape155: TQRShape;
    QRShape156: TQRShape;
    qrl_pb28: TQRLabel;
    QRShape158: TQRShape;
    QRShape159: TQRShape;
    QRShape169: TQRShape;
    QRShape170: TQRShape;
    QRShape171: TQRShape;
    QRShape172: TQRShape;
    QRShape173: TQRShape;
    QRShape174: TQRShape;
    QRShape175: TQRShape;
    QRShape176: TQRShape;
    QRShape177: TQRShape;
    QRShape178: TQRShape;
    QRShape179: TQRShape;
    qrl_au31: TQRLabel;
    qrl_au32: TQRLabel;
    qrl_au33: TQRLabel;
    qrl_au34: TQRLabel;
    qrl_au35: TQRLabel;
    qrl_au36: TQRLabel;
    qrl_au37: TQRLabel;
    qrl_au38: TQRLabel;
    qrl_tb39: TQRLabel;
    qrl_tb38: TQRLabel;
    qrl_tb37: TQRLabel;
    qrl_tb36: TQRLabel;
    qrl_tb35: TQRLabel;
    qrl_tb34: TQRLabel;
    qrl_tb33: TQRLabel;
    qrl_tb32: TQRLabel;
    qrl_tb31: TQRLabel;
    qrl_pb31: TQRLabel;
    qrl_m31: TQRLabel;
    qrl_m32: TQRLabel;
    qrl_pb33: TQRLabel;
    qrl_pb32: TQRLabel;
    qrl_pb35: TQRLabel;
    qrl_pb36: TQRLabel;
    qrl_pb37: TQRLabel;
    qrl_pb39: TQRLabel;
    qrl_m33: TQRLabel;
    qrl_m34: TQRLabel;
    qrl_m35: TQRLabel;
    qrl_m36: TQRLabel;
    qrl_m37: TQRLabel;
    qrl_m38: TQRLabel;
    qrl_faltas3: TQRLabel;
    qrl_m39: TQRLabel;
    QRLabel173: TQRLabel;
    QRLabel175: TQRLabel;
    QRLabel176: TQRLabel;
    QRShape180: TQRShape;
    QRShape181: TQRShape;
    QRShape182: TQRShape;
    QRShape183: TQRShape;
    QRShape184: TQRShape;
    QRShape185: TQRShape;
    QRShape186: TQRShape;
    QRShape187: TQRShape;
    QRShape188: TQRShape;
    qrl_au39: TQRLabel;
    QRShape189: TQRShape;
    QRShape190: TQRShape;
    QRShape191: TQRShape;
    QRShape192: TQRShape;
    QRShape193: TQRShape;
    QRShape194: TQRShape;
    QRShape195: TQRShape;
    QRShape196: TQRShape;
    QRShape197: TQRShape;
    QRShape198: TQRShape;
    QRLabel178: TQRLabel;
    QRShape199: TQRShape;
    QRShape200: TQRShape;
    QRShape201: TQRShape;
    QRShape202: TQRShape;
    QRShape203: TQRShape;
    qrl_pb34: TQRLabel;
    QRShape204: TQRShape;
    QRShape205: TQRShape;
    QRShape206: TQRShape;
    QRShape207: TQRShape;
    qrl_pb38: TQRLabel;
    QRShape209: TQRShape;
    QRShape210: TQRShape;
    QRShape220: TQRShape;
    QRShape221: TQRShape;
    QRShape222: TQRShape;
    QRShape223: TQRShape;
    QRShape224: TQRShape;
    QRShape225: TQRShape;
    QRShape226: TQRShape;
    QRShape227: TQRShape;
    QRShape228: TQRShape;
    QRShape229: TQRShape;
    QRShape230: TQRShape;
    QRShape231: TQRShape;
    QRShape232: TQRShape;
    QRShape233: TQRShape;
    QRLabel181: TQRLabel;
    QRLabel182: TQRLabel;
    QRLabel183: TQRLabel;
    QRLabel184: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape234: TQRShape;
    qrl_ma1: TQRLabel;
    QRShape235: TQRShape;
    qrl_ma2: TQRLabel;
    QRShape236: TQRShape;
    qrl_ma3: TQRLabel;
    QRShape237: TQRShape;
    qrl_ma4: TQRLabel;
    QRShape238: TQRShape;
    qrl_ma5: TQRLabel;
    QRShape239: TQRShape;
    qrl_ma6: TQRLabel;
    QRShape240: TQRShape;
    qrl_ma7: TQRLabel;
    QRShape241: TQRShape;
    qrl_ma8: TQRLabel;
    QRShape242: TQRShape;
    qrl_ma9: TQRLabel;
    QRShape243: TQRShape;
    QRShape245: TQRShape;
    QRLabel39: TQRLabel;
    qrl_rf1: TQRLabel;
    QRShape246: TQRShape;
    qrl_rf2: TQRLabel;
    QRShape247: TQRShape;
    qrl_rf3: TQRLabel;
    QRShape248: TQRShape;
    qrl_rf4: TQRLabel;
    QRShape249: TQRShape;
    qrl_rf5: TQRLabel;
    QRShape250: TQRShape;
    qrl_rf6: TQRLabel;
    QRShape251: TQRShape;
    qrl_rf7: TQRLabel;
    QRShape252: TQRShape;
    QRShape253: TQRShape;
    qrl_rf8: TQRLabel;
    qrl_rf9: TQRLabel;
    QRShape255: TQRShape;
    QRL_D10: TQRLabel;
    QRShape1: TQRShape;
    qrl_au010: TQRLabel;
    QRShape10: TQRShape;
    qrl_tb010: TQRLabel;
    QRShape16: TQRShape;
    QRShape22: TQRShape;
    qrl_pb010: TQRLabel;
    qrl_m010: TQRLabel;
    QRShape34: TQRShape;
    QRShape37: TQRShape;
    qrl_au110: TQRLabel;
    qrl_tb110: TQRLabel;
    QRShape40: TQRShape;
    qrl_pb110: TQRLabel;
    QRShape52: TQRShape;
    QRShape55: TQRShape;
    qrl_m110: TQRLabel;
    qrl_au210: TQRLabel;
    QRShape58: TQRShape;
    QRShape62: TQRShape;
    qrl_tb210: TQRLabel;
    qrl_pb210: TQRLabel;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    qrl_m210: TQRLabel;
    qrl_au310: TQRLabel;
    QRShape76: TQRShape;
    QRShape106: TQRShape;
    qrl_tb310: TQRLabel;
    qrl_pb310: TQRLabel;
    QRShape109: TQRShape;
    QRShape110: TQRShape;
    qrl_m310: TQRLabel;
    qrl_ma10: TQRLabel;
    QRShape111: TQRShape;
    qrl_rf10: TQRLabel;
    QRShape112: TQRShape;
    qrl_d11: TQRLabel;
    QRShape113: TQRShape;
    qrl_au011: TQRLabel;
    QRShape114: TQRShape;
    qrl_tb011: TQRLabel;
    QRShape115: TQRShape;
    QRShape116: TQRShape;
    qrl_pb011: TQRLabel;
    qrl_m011: TQRLabel;
    QRShape117: TQRShape;
    QRShape157: TQRShape;
    qrl_au111: TQRLabel;
    qrl_tb111: TQRLabel;
    QRShape160: TQRShape;
    qrl_pb111: TQRLabel;
    QRShape161: TQRShape;
    QRShape162: TQRShape;
    qrl_m111: TQRLabel;
    qrl_au211: TQRLabel;
    QRShape163: TQRShape;
    QRShape164: TQRShape;
    qrl_tb211: TQRLabel;
    qrl_pb211: TQRLabel;
    QRShape165: TQRShape;
    QRShape166: TQRShape;
    qrl_m211: TQRLabel;
    qrl_au311: TQRLabel;
    QRShape167: TQRShape;
    QRShape168: TQRShape;
    qrl_tb311: TQRLabel;
    qrl_pb311: TQRLabel;
    QRShape208: TQRShape;
    QRShape211: TQRShape;
    qrl_m311: TQRLabel;
    qrl_ma11: TQRLabel;
    QRShape212: TQRShape;
    qrl_rf11: TQRLabel;
    QRShape213: TQRShape;
    QRShape214: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender:TCustomQuickRep;var PrintReport:
              Boolean);
    procedure PreencheLabel;
  end;

var Qrp_RelAlu010: TQrp_RelAlu010;
    wGrupo : string;
    wReferencia, wFaltas0, wFaltas1,wFaltas2,wFaltas3 : integer;

implementation

uses u_modulo, U_Principal, u_funcoes;

{$R *.DFM}

procedure TQrp_RelAlu010.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    // 1o BIMESTRE
    qrl_d01.caption := '';
    qrl_au01.caption := '';
    qrl_tb01.caption := '';
    qrl_pb01.caption := '';
    qrl_m01.caption := '';
    qrl_d02.caption := '';
    qrl_au02.caption := '';
    qrl_tb02.caption := '';
    qrl_pb02.caption := '';
    qrl_m02.caption := '';
    qrl_d03.caption := '';
    qrl_au03.caption := '';
    qrl_tb03.caption := '';
    qrl_pb03.caption := '';
    qrl_m03.caption := '';
    qrl_d04.caption := '';
    qrl_au04.caption := '';
    qrl_tb04.caption := '';
    qrl_pb04.caption := '';
    qrl_m04.caption := '';
    qrl_d05.caption := '';
    qrl_au05.caption := '';
    qrl_tb05.caption := '';
    qrl_pb05.caption := '';
    qrl_m05.caption := '';
    qrl_d06.caption := '';
    qrl_au06.caption := '';
    qrl_tb06.caption := '';
    qrl_pb06.caption := '';
    qrl_m06.caption := '';
    qrl_d07.caption := '';
    qrl_au07.caption := '';
    qrl_tb07.caption := '';
    qrl_pb07.caption := '';
    qrl_m07.caption := '';
    qrl_d08.caption := '';
    qrl_au08.caption := '';
    qrl_tb08.caption := '';
    qrl_pb08.caption := '';
    qrl_m08.caption := '';
    qrl_d09.caption := '';
    qrl_au09.caption := '';
    qrl_tb09.caption := '';
    qrl_pb09.caption := '';
    qrl_m09.caption := '';

    qrl_d10.caption := '';
    qrl_au010.caption := '';
    qrl_tb010.caption := '';
    qrl_pb010.caption := '';
    qrl_m010.caption := '';

      qrl_d11.caption := '';
    qrl_au011.caption := '';
    qrl_tb011.caption := '';
    qrl_pb011.caption := '';
     qrl_m011.caption := '';


    // 2o BIMESTRE
    qrl_au11.caption := '';
    qrl_tb11.caption := '';
    qrl_pb11.caption := '';
    qrl_m11.caption := '';
    qrl_au12.caption := '';
    qrl_tb12.caption := '';
    qrl_pb12.caption := '';
    qrl_m12.caption := '';
    qrl_au13.caption := '';
    qrl_tb13.caption := '';
    qrl_pb13.caption := '';
    qrl_m13.caption := '';
    qrl_au14.caption := '';
    qrl_tb14.caption := '';
    qrl_pb14.caption := '';
    qrl_m14.caption := '';
    qrl_au15.caption := '';
    qrl_tb15.caption := '';
    qrl_pb15.caption := '';
    qrl_m15.caption := '';
    qrl_au16.caption := '';
    qrl_tb16.caption := '';
    qrl_pb16.caption := '';
    qrl_m16.caption := '';
    qrl_au17.caption := '';
    qrl_tb17.caption := '';
    qrl_pb17.caption := '';
    qrl_m17.caption := '';
    qrl_au18.caption := '';
    qrl_tb18.caption := '';
    qrl_pb18.caption := '';
    qrl_m18.caption := '';
    qrl_au19.caption := '';
    qrl_tb19.caption := '';
    qrl_pb19.caption := '';
    qrl_m19.caption := '';


    qrl_au110.caption := '';
    qrl_tb110.caption := '';
    qrl_pb110.caption := '';
     qrl_m110.caption := '';
    qrl_au111.caption := '';
    qrl_tb111.caption := '';
    qrl_pb111.caption := '';
     qrl_m111.caption := '';



    // 3o BIMESTRE
    qrl_au21.caption := '';
    qrl_tb21.caption := '';
    qrl_pb21.caption := '';
    qrl_m21.caption := '';
    qrl_au22.caption := '';
    qrl_tb22.caption := '';
    qrl_pb22.caption := '';
    qrl_m22.caption := '';
    qrl_au23.caption := '';
    qrl_tb23.caption := '';
    qrl_pb23.caption := '';
    qrl_m23.caption := '';
    qrl_au24.caption := '';
    qrl_tb24.caption := '';
    qrl_pb24.caption := '';
    qrl_m24.caption := '';
    qrl_au25.caption := '';
    qrl_tb25.caption := '';
    qrl_pb25.caption := '';
    qrl_m25.caption := '';
    qrl_au26.caption := '';
    qrl_tb26.caption := '';
    qrl_pb26.caption := '';
    qrl_m26.caption := '';
    qrl_au27.caption := '';
    qrl_tb27.caption := '';
    qrl_pb27.caption := '';
    qrl_m27.caption := '';
    qrl_au28.caption := '';
    qrl_tb28.caption := '';
    qrl_pb28.caption := '';
    qrl_m28.caption := '';
    qrl_au29.caption := '';
    qrl_tb29.caption := '';
    qrl_pb29.caption := '';
    qrl_m29.caption := '';
    qrl_au210.caption := '';
    qrl_tb210.caption := '';
    qrl_pb210.caption := '';
     qrl_m210.caption := '';
    qrl_au211.caption := '';
    qrl_tb211.caption := '';
    qrl_pb211.caption := '';
     qrl_m211.caption := '';



    // 4o BIMESTRE
    qrl_au31.caption := '';
    qrl_tb31.caption := '';
    qrl_pb31.caption := '';
    qrl_m31.caption := '';
    qrl_au32.caption := '';
    qrl_tb32.caption := '';
    qrl_pb32.caption := '';
    qrl_m32.caption := '';
    qrl_au33.caption := '';
    qrl_tb33.caption := '';
    qrl_pb33.caption := '';
    qrl_m33.caption := '';
    qrl_au34.caption := '';
    qrl_tb34.caption := '';
    qrl_pb34.caption := '';
    qrl_m34.caption := '';
    qrl_au35.caption := '';
    qrl_tb35.caption := '';
    qrl_pb35.caption := '';
    qrl_m35.caption := '';
    qrl_au36.caption := '';
    qrl_tb36.caption := '';
    qrl_pb36.caption := '';
    qrl_m36.caption := '';
    qrl_au37.caption := '';
    qrl_tb37.caption := '';
    qrl_pb37.caption := '';
    qrl_m37.caption := '';
    qrl_au38.caption := '';
    qrl_tb38.caption := '';
    qrl_pb38.caption := '';
    qrl_m38.caption := '';
    qrl_au39.caption := '';
    qrl_tb39.caption := '';
    qrl_pb39.caption := '';
    qrl_m39.caption := '';

    qrl_au310.caption := '';
    qrl_tb310.caption := '';
    qrl_pb310.caption := '';
     qrl_m310.caption := '';
    qrl_au311.caption := '';
    qrl_tb311.caption := '';
    qrl_pb311.caption := '';
     qrl_m311.caption := '';

    // MEDIA FINAL
    qrl_ma1.caption := '';
    qrl_ma2.caption := '';
    qrl_ma3.caption := '';
    qrl_ma4.caption := '';
    qrl_ma5.caption := '';
    qrl_ma6.caption := '';
    qrl_ma7.caption := '';
    qrl_ma8.caption := '';
    qrl_ma9.caption := '';

    qrl_ma10.caption := '';
    qrl_ma11.caption := '';

    // RESULTADO
    qrl_rf1.caption := '';
    qrl_rf2.caption := '';
    qrl_rf3.caption := '';
    qrl_rf4.caption := '';
    qrl_rf5.caption := '';
    qrl_rf6.caption := '';
    qrl_rf7.caption := '';
    qrl_rf8.caption := '';
    qrl_rf9.caption := '';
    qrl_rf10.caption := '';
    qrl_rf11.caption := '';


    // REMOVER PARA FUNDAMENTAL AQUI
    if Frm_Modulo.IBQ_Boletim.fieldbyname('matrseri').asstring > '009' then
       PRINTBAND := FALSE;



         wReferencia := 1;
         if Frm_Principal.wPREENCHE_REL_BOLETIM then PreencheLabel;

         wGrupo  := Frm_Modulo.IBQ_Boletim.fieldbyname('alunnome').asstring;
         wFaltas0 := Frm_Modulo.IBQ_Boletim.fieldbyname('matr1bft').asinteger;
         wFaltas1 := Frm_Modulo.IBQ_Boletim.fieldbyname('matr2bft').asinteger;
         wFaltas2 := Frm_Modulo.IBQ_Boletim.fieldbyname('matr3bft').asinteger;
         wFaltas3 := Frm_Modulo.IBQ_Boletim.fieldbyname('matr4bft').asinteger;

         if not Frm_Modulo.IBQ_Boletim.eof then Frm_Modulo.IBQ_Boletim.next;
         while not (Frm_Modulo.IBQ_Boletim.eof) and (wGrupo =
         Frm_Modulo.IBQ_Boletim.fieldbyname('alunnome').asstring) do
         begin
              wFaltas0 := wFaltas0 + Frm_Modulo.IBQ_Boletim.fieldbyname('matr1bft').asinteger;
              wFaltas1 := wFaltas1 + Frm_Modulo.IBQ_Boletim.fieldbyname('matr2bft').asinteger;
              wFaltas2 := wFaltas2 + Frm_Modulo.IBQ_Boletim.fieldbyname('matr3bft').asinteger;
              wFaltas3 := wFaltas3 + Frm_Modulo.IBQ_Boletim.fieldbyname('matr4bft').asinteger;
              wReferencia := wReferencia + 1;
              if Frm_Principal.wPREENCHE_REL_BOLETIM then PreencheLabel;
              Frm_Modulo.IBQ_Boletim.next;
         end;
         if not Frm_Modulo.IBQ_Boletim.eof then Frm_Modulo.IBQ_Boletim.prior;
         qrl_faltas0.caption := inttostr(wFaltas0);
         qrl_faltas1.caption := inttostr(wFaltas1);
         qrl_faltas2.caption := inttostr(wFaltas2);
         qrl_faltas3.caption := inttostr(wFaltas3);
end;

procedure TQrp_RelAlu010.PreencheLabel;
var wNOTA_AU_1, wNOTA_AU_2, wNOTA_AU_3, wNOTA_AU_4,
    wNOTA_TB_1, wNOTA_TB_2, wNOTA_TB_3, wNOTA_TB_4,
    wNOTA_PB_1, wNOTA_PB_2, wNOTA_PB_3, wNOTA_PB_4,
    wNOTA_M_1 , wNOTA_M_2 , wNOTA_M_3 , wNOTA_M_4,
    wNOTA_MA  , wNOTA_RF : STRING;
begin
    with Frm_Modulo.IBQ_Boletim do
    begin
         wNOTA_AU_1 := '';
         wNOTA_AU_2 := '';
         wNOTA_AU_3 := '';
         wNOTA_AU_4 := '';

         wNOTA_TB_1 := '';
         wNOTA_TB_2 := '';
         wNOTA_TB_3 := '';
         wNOTA_TB_4 := '';

         wNOTA_PB_1 := '';
         wNOTA_PB_2 := '';
         wNOTA_PB_3 := '';
         wNOTA_PB_4 := '';

         wNOTA_M_1  := '';
         wNOTA_M_2  := '';
         wNOTA_M_3  := '';
         wNOTA_M_4  := '';

         wNOTA_MA   := '';
         wNOTA_RF   := '';

         IF fieldbyname('matr1bau').asfloat > 0 then
            wNOTA_AU_1 := formatfloat(',0.0',fieldbyname('matr1bau').asfloat);
         IF fieldbyname('matr2bau').asfloat > 0 then
            wNOTA_AU_2 := formatfloat(',0.0',fieldbyname('matr2bau').asfloat);
         IF fieldbyname('matr3bau').asfloat > 0 then
            wNOTA_AU_3 := formatfloat(',0.0',fieldbyname('matr3bau').asfloat);
         IF fieldbyname('matr4bau').asfloat > 0 then
            wNOTA_AU_4 := formatfloat(',0.0',fieldbyname('matr4bau').asfloat);

         if fieldbyname('matr1btb').asfloat > 0 then
            wNOTA_TB_1 := formatfloat(',0.0',fieldbyname('matr1btb').asfloat);
         if fieldbyname('matr2btb').asfloat > 0 then
            wNOTA_TB_2 := formatfloat(',0.0',fieldbyname('matr2btb').asfloat);
         if fieldbyname('matr3btb').asfloat > 0 then
            wNOTA_TB_3 := formatfloat(',0.0',fieldbyname('matr3btb').asfloat);
         if fieldbyname('matr4btb').asfloat > 0 then
            wNOTA_TB_4 := formatfloat(',0.0',fieldbyname('matr4btb').asfloat);

         if fieldbyname('matr1bpb').asfloat > 0 then
            wNOTA_PB_1 := formatfloat(',0.0',fieldbyname('matr1bpb').asfloat);
         if fieldbyname('matr2bpb').asfloat > 0 then
            wNOTA_PB_2 := formatfloat(',0.0',fieldbyname('matr2bpb').asfloat);
         if fieldbyname('matr3bpb').asfloat > 0 then
            wNOTA_PB_3 := formatfloat(',0.0',fieldbyname('matr3bpb').asfloat);
         if fieldbyname('matr4bpb').asfloat > 0 then
            wNOTA_PB_4 := formatfloat(',0.0',fieldbyname('matr4bpb').asfloat);

         if fieldbyname('matr1bmd').asfloat > 0 then
            wNOTA_M_1  := formatfloat(',0.0',fieldbyname('matr1bmd').asfloat);
         if fieldbyname('matr2bmd').asfloat > 0 then
            wNOTA_M_2  := formatfloat(',0.0',fieldbyname('matr2bmd').asfloat);
         if fieldbyname('matr3bmd').asfloat > 0 then
            wNOTA_M_3  := formatfloat(',0.0',fieldbyname('matr3bmd').asfloat);
         if fieldbyname('matr4bmd').asfloat > 0 then
            wNOTA_M_4  := formatfloat(',0.0',fieldbyname('matr4bmd').asfloat);


         if fieldbyname('matrmdan').asfloat > 0 then
         begin
              wNOTA_MA   := formatfloat(',0.0',fieldbyname('matrmdan').asfloat);
              wNOTA_RF   := afuncoes.ResultaDescricaoResultadoFinal(
                            fieldbyname('matrrsfn').asstring);
         end;

         case wReferencia of
         1:
         begin
         qrl_d01.caption  := fieldbyname('discdesc').asstring;
         qrl_au01.caption := wNOTA_AU_1;
         qrl_tb01.caption := wNOTA_TB_1;
         qrl_pb01.caption := wNOTA_PB_1;
         qrl_m01.caption  := wNOTA_M_1;

         qrl_au11.caption := wNOTA_AU_2;
         qrl_tb11.caption := wNOTA_TB_2;
         qrl_pb11.caption := wNOTA_PB_2;
         qrl_m11.caption  := wNOTA_M_2;

         qrl_au21.caption := wNOTA_AU_3;
         qrl_tb21.caption := wNOTA_TB_3;
         qrl_pb21.caption := wNOTA_PB_3;
         qrl_m21.caption  := wNOTA_M_3;

         qrl_au31.caption := wNOTA_AU_4;
         qrl_tb31.caption := wNOTA_TB_4;
         qrl_pb31.caption := wNOTA_PB_4;
         qrl_m31.caption  := wNOTA_M_4;

         qrl_ma1.caption  := wNOTA_MA;
         qrl_rf1.caption  := wNOTA_RF;
         end;
         2:
         begin
         qrl_d02.caption  := fieldbyname('discdesc').asstring;
         qrl_au02.caption := wNOTA_AU_1;
         qrl_tb02.caption := wNOTA_TB_1;
         qrl_pb02.caption := wNOTA_PB_1;
         qrl_m02.caption  := wNOTA_M_1;

         qrl_au12.caption := wNOTA_AU_2;
         qrl_tb12.caption := wNOTA_TB_2;
         qrl_pb12.caption := wNOTA_PB_2;
         qrl_m12.caption  := wNOTA_M_2;

         qrl_au22.caption := wNOTA_AU_3;
         qrl_tb22.caption := wNOTA_TB_3;
         qrl_pb22.caption := wNOTA_PB_3;
         qrl_m22.caption  := wNOTA_M_3;

         qrl_au32.caption := wNOTA_AU_4;
         qrl_tb32.caption := wNOTA_TB_4;
         qrl_pb32.caption := wNOTA_PB_4;
         qrl_m32.caption  := wNOTA_M_4;

         qrl_ma2.caption  := wNOTA_MA;
         qrl_rf2.caption  := wNOTA_RF;
         end;
         3:
         begin
         qrl_d03.caption  := fieldbyname('discdesc').asstring;
         qrl_au03.caption := wNOTA_AU_1;
         qrl_tb03.caption := wNOTA_TB_1;
         qrl_pb03.caption := wNOTA_PB_1;
         qrl_m03.caption  := wNOTA_M_1;

         qrl_au13.caption := wNOTA_AU_2;
         qrl_tb13.caption := wNOTA_TB_2;
         qrl_pb13.caption := wNOTA_PB_2;
         qrl_m13.caption  := wNOTA_M_2;

         qrl_au23.caption := wNOTA_AU_3;
         qrl_tb23.caption := wNOTA_TB_3;
         qrl_pb23.caption := wNOTA_PB_3;
         qrl_m23.caption  := wNOTA_M_3;

         qrl_au33.caption := wNOTA_AU_4;
         qrl_tb33.caption := wNOTA_TB_4;
         qrl_pb33.caption := wNOTA_PB_4;
         qrl_m33.caption  := wNOTA_M_4;

         qrl_ma3.caption  := wNOTA_MA;
         qrl_rf3.caption  := wNOTA_RF;

         end;
         4:
         begin
         qrl_d04.caption  := fieldbyname('discdesc').asstring;
         qrl_au04.caption := wNOTA_AU_1;
         qrl_tb04.caption := wNOTA_TB_1;
         qrl_pb04.caption := wNOTA_PB_1;
         qrl_m04.caption  := wNOTA_M_1;

         qrl_au14.caption := wNOTA_AU_2;
         qrl_tb14.caption := wNOTA_TB_2;
         qrl_pb14.caption := wNOTA_PB_2;
         qrl_m14.caption  := wNOTA_M_2;

         qrl_au24.caption := wNOTA_AU_3;
         qrl_tb24.caption := wNOTA_TB_3;
         qrl_pb24.caption := wNOTA_PB_3;
         qrl_m24.caption  := wNOTA_M_3;

         qrl_au34.caption := wNOTA_AU_4;
         qrl_tb34.caption := wNOTA_TB_4;
         qrl_pb34.caption := wNOTA_PB_4;
         qrl_m34.caption  := wNOTA_M_4;

         qrl_ma4.caption  := wNOTA_MA;
         qrl_rf4.caption  := wNOTA_RF;
                             
         end;
         5:
         begin
         qrl_d05.caption  := fieldbyname('discdesc').asstring;
         qrl_au05.caption := wNOTA_AU_1;
         qrl_tb05.caption := wNOTA_TB_1;
         qrl_pb05.caption := wNOTA_PB_1;
         qrl_m05.caption  := wNOTA_M_1;

         qrl_au15.caption := wNOTA_AU_2;
         qrl_tb15.caption := wNOTA_TB_2;
         qrl_pb15.caption := wNOTA_PB_2;
         qrl_m15.caption  := wNOTA_M_2;

         qrl_au25.caption := wNOTA_AU_3;
         qrl_tb25.caption := wNOTA_TB_3;
         qrl_pb25.caption := wNOTA_PB_3;
         qrl_m25.caption  := wNOTA_M_3;

         qrl_au35.caption := wNOTA_AU_4;
         qrl_tb35.caption := wNOTA_TB_4;
         qrl_pb35.caption := wNOTA_PB_4;
         qrl_m35.caption  := wNOTA_M_4;

         qrl_ma5.caption  := wNOTA_MA;
         qrl_rf5.caption  := wNOTA_RF;

         end;
         6:
         begin
         qrl_d06.caption  := fieldbyname('discdesc').asstring;
         qrl_au06.caption := wNOTA_AU_1;
         qrl_tb06.caption := wNOTA_TB_1;
         qrl_pb06.caption := wNOTA_PB_1;
         qrl_m06.caption  := wNOTA_M_1;

         qrl_au16.caption := wNOTA_AU_2;
         qrl_tb16.caption := wNOTA_TB_2;
         qrl_pb16.caption := wNOTA_PB_2;
         qrl_m16.caption  := wNOTA_M_2;

         qrl_au26.caption := wNOTA_AU_3;
         qrl_tb26.caption := wNOTA_TB_3;
         qrl_pb26.caption := wNOTA_PB_3;
         qrl_m26.caption  := wNOTA_M_3;

         qrl_au36.caption := wNOTA_AU_4;
         qrl_tb36.caption := wNOTA_TB_4;
         qrl_pb36.caption := wNOTA_PB_4;
         qrl_m36.caption  := wNOTA_M_4;

         qrl_ma6.caption  := wNOTA_MA;
         qrl_rf6.caption  := wNOTA_RF;
                             
         end;
         7:
         begin
         qrl_d07.caption  := fieldbyname('discdesc').asstring;
         qrl_au07.caption := wNOTA_AU_1;
         qrl_tb07.caption := wNOTA_TB_1;
         qrl_pb07.caption := wNOTA_PB_1;
         qrl_m07.caption  := wNOTA_M_1;

         qrl_au17.caption := wNOTA_AU_2;
         qrl_tb17.caption := wNOTA_TB_2;
         qrl_pb17.caption := wNOTA_PB_2;
         qrl_m17.caption  := wNOTA_M_2;

         qrl_au27.caption := wNOTA_AU_3;
         qrl_tb27.caption := wNOTA_TB_3;
         qrl_pb27.caption := wNOTA_PB_3;
         qrl_m27.caption  := wNOTA_M_3;

         qrl_au37.caption := wNOTA_AU_4;
         qrl_tb37.caption := wNOTA_TB_4;
         qrl_pb37.caption := wNOTA_PB_4;
         qrl_m37.caption  := wNOTA_M_4;

         qrl_ma7.caption  := wNOTA_MA;
         qrl_rf7.caption  := wNOTA_RF;
                             
         end;
         8:
         begin
         qrl_d08.caption  := fieldbyname('discdesc').asstring;
         qrl_au08.caption := wNOTA_AU_1;
         qrl_tb08.caption := wNOTA_TB_1;
         qrl_pb08.caption := wNOTA_PB_1;
         qrl_m08.caption  := wNOTA_M_1;

         qrl_au18.caption := wNOTA_AU_2;
         qrl_tb18.caption := wNOTA_TB_2;
         qrl_pb18.caption := wNOTA_PB_2;
         qrl_m18.caption  := wNOTA_M_2;

         qrl_au28.caption := wNOTA_AU_3;
         qrl_tb28.caption := wNOTA_TB_3;
         qrl_pb28.caption := wNOTA_PB_3;
         qrl_m28.caption  := wNOTA_M_3;

         qrl_au38.caption := wNOTA_AU_4;
         qrl_tb38.caption := wNOTA_TB_4;
         qrl_pb38.caption := wNOTA_PB_4;
         qrl_m38.caption  := wNOTA_M_4;

         qrl_ma8.caption  := wNOTA_MA;
         qrl_rf8.caption  := wNOTA_RF;
                             
         end;
         9:
         begin
         qrl_d09.caption  := fieldbyname('discdesc').asstring;
         qrl_au09.caption := wNOTA_AU_1;
         qrl_tb09.caption := wNOTA_TB_1;
         qrl_pb09.caption := wNOTA_PB_1;
         qrl_m09.caption  := wNOTA_M_1;

         qrl_au19.caption := wNOTA_AU_2;
         qrl_tb19.caption := wNOTA_TB_2;
         qrl_pb19.caption := wNOTA_PB_2;
         qrl_m19.caption  := wNOTA_M_2;

         qrl_au29.caption := wNOTA_AU_3;
         qrl_tb29.caption := wNOTA_TB_3;
         qrl_pb29.caption := wNOTA_PB_3;
         qrl_m29.caption  := wNOTA_M_3;

         qrl_au39.caption := wNOTA_AU_4;
         qrl_tb39.caption := wNOTA_TB_4;
         qrl_pb39.caption := wNOTA_PB_4;
         qrl_m39.caption  := wNOTA_M_4;

         qrl_ma9.caption  := wNOTA_MA;
         qrl_rf9.caption  := wNOTA_RF;
                             
         end;
         10:
         begin
          qrl_d10.caption  := fieldbyname('discdesc').asstring;
         qrl_au010.caption := wNOTA_AU_1;
         qrl_tb010.caption := wNOTA_TB_1;
         qrl_pb010.caption := wNOTA_PB_1;
          qrl_m010.caption  := wNOTA_M_1;

         qrl_au110.caption := wNOTA_AU_2;
         qrl_tb110.caption := wNOTA_TB_2;
         qrl_pb110.caption := wNOTA_PB_2;
          qrl_m110.caption  := wNOTA_M_2;

         qrl_au210.caption := wNOTA_AU_3;
         qrl_tb210.caption := wNOTA_TB_3;
         qrl_pb210.caption := wNOTA_PB_3;
          qrl_m210.caption  := wNOTA_M_3;

         qrl_au310.caption := wNOTA_AU_4;
         qrl_tb310.caption := wNOTA_TB_4;
         qrl_pb310.caption := wNOTA_PB_4;
          qrl_m310.caption  := wNOTA_M_4;

         qrl_ma10.caption  := wNOTA_MA;
         qrl_rf10.caption  := wNOTA_RF;
                             
         end;
         11:
         begin
          qrl_d11.caption  := fieldbyname('discdesc').asstring;
         qrl_au011.caption := wNOTA_AU_1;
         qrl_tb011.caption := wNOTA_TB_1;
         qrl_pb011.caption := wNOTA_PB_1;
          qrl_m011.caption  := wNOTA_M_1;

         qrl_au111.caption := wNOTA_AU_2;
         qrl_tb111.caption := wNOTA_TB_2;
         qrl_pb111.caption := wNOTA_PB_2;
          qrl_m111.caption  := wNOTA_M_2;

         qrl_au211.caption := wNOTA_AU_3;
         qrl_tb211.caption := wNOTA_TB_3;
         qrl_pb211.caption := wNOTA_PB_3;
          qrl_m211.caption  := wNOTA_M_3;

         qrl_au311.caption := wNOTA_AU_4;
         qrl_tb311.caption := wNOTA_TB_4;
         qrl_pb311.caption := wNOTA_PB_4;
          qrl_m311.caption  := wNOTA_M_4;

         qrl_ma11.caption  := wNOTA_MA;
         qrl_rf11.caption  := wNOTA_RF;

         end;
         end;
    end;
end;

procedure TQrp_RelAlu010.QuickRepBeforePrint(Sender: TCustomQuickRep; var
          PrintReport: Boolean);
begin
     wGrupo := 'kdsgdfdfdretsfdrerdwasw';
end;

end.



