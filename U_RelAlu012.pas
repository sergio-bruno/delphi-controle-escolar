unit U_RelAlu012;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TQrp_RelAlu012 = class(TQuickRep)
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
    qrl_bimestre: TQRLabel;
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
    QRShape71: TQRShape;
    QRSysData1: TQRSysData;
    QRDBText5: TQRDBText;
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
    QRLabel11: TQRLabel;
    QRShape10: TQRShape;
    qrl_c01: TQRLabel;
    QRShape16: TQRShape;
    qrl_c02: TQRLabel;
    QRShape22: TQRShape;
    qrl_c03: TQRLabel;
    QRShape34: TQRShape;
    qrl_c04: TQRLabel;
    QRShape37: TQRShape;
    qrl_c06: TQRLabel;
    QRShape40: TQRShape;
    QRShape52: TQRShape;
    qrl_c05: TQRLabel;
    qrl_c07: TQRLabel;
    QRShape55: TQRShape;
    qrl_c08: TQRLabel;
    QRShape61: TQRShape;
    qrl_011: TQRLabel;
    qrl_012: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    qrl_013: TQRLabel;
    qrl_014: TQRLabel;
    qrl_024: TQRLabel;
    qrl_023: TQRLabel;
    qrl_021: TQRLabel;
    qrl_031: TQRLabel;
    qrl_032: TQRLabel;
    qrl_033: TQRLabel;
    qrl_034: TQRLabel;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape67: TQRShape;
    qrl_041: TQRLabel;
    qrl_042: TQRLabel;
    qrl_043: TQRLabel;
    qrl_044: TQRLabel;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape72: TQRShape;
    qrl_051: TQRLabel;
    qrl_052: TQRLabel;
    qrl_053: TQRLabel;
    qrl_054: TQRLabel;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape76: TQRShape;
    QRShape78: TQRShape;
    qrl_061: TQRLabel;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    qrl_062: TQRLabel;
    qrl_063: TQRLabel;
    QRShape84: TQRShape;
    qrl_064: TQRLabel;
    QRShape85: TQRShape;
    qrl_074: TQRLabel;
    QRShape86: TQRShape;
    qrl_073: TQRLabel;
    qrl_072: TQRLabel;
    QRShape88: TQRShape;
    qrl_071: TQRLabel;
    QRShape89: TQRShape;
    qrl_081: TQRLabel;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    qrl_082: TQRLabel;
    qrl_083: TQRLabel;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    qrl_084: TQRLabel;
    QRShape95: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    qrl_022: TQRLabel;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRLabel67: TQRLabel;
    QRShape107: TQRShape;
    QRShape108: TQRShape;
    QRShape109: TQRShape;
    qrl_161: TQRLabel;
    qrl_162: TQRLabel;
    qrl_163: TQRLabel;
    qrl_164: TQRLabel;
    qrl_154: TQRLabel;
    qrl_153: TQRLabel;
    qrl_152: TQRLabel;
    qrl_151: TQRLabel;
    qrl_141: TQRLabel;
    qrl_142: TQRLabel;
    qrl_143: TQRLabel;
    qrl_144: TQRLabel;
    qrl_134: TQRLabel;
    qrl_133: TQRLabel;
    qrl_132: TQRLabel;
    qrl_131: TQRLabel;
    qrl_121: TQRLabel;
    qrl_122: TQRLabel;
    qrl_123: TQRLabel;
    qrl_124: TQRLabel;
    qrl_114: TQRLabel;
    qrl_113: TQRLabel;
    qrl_112: TQRLabel;
    qrl_111: TQRLabel;
    qrl_101: TQRLabel;
    qrl_102: TQRLabel;
    qrl_103: TQRLabel;
    qrl_104: TQRLabel;
    qrl_094: TQRLabel;
    qrl_093: TQRLabel;
    qrl_092: TQRLabel;
    qrl_091: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRShape58: TQRShape;
    QRShape60: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape75: TQRShape;
    QRShape77: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape87: TQRShape;
    QRShape94: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    QRShape112: TQRShape;
    QRShape113: TQRShape;
    QRShape114: TQRShape;
    QRShape115: TQRShape;
    QRShape116: TQRShape;
    QRShape117: TQRShape;
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
    QRShape129: TQRShape;
    QRShape130: TQRShape;
    QRShape131: TQRShape;
    QRShape132: TQRShape;
    QRShape133: TQRShape;
    QRLabel94: TQRLabel;
    qrl_c09: TQRLabel;
    QRShape134: TQRShape;
    qrl_c10: TQRLabel;
    QRShape135: TQRShape;
    qrl_c11: TQRLabel;
    QRShape136: TQRShape;
    QRShape137: TQRShape;
    qrl_c12: TQRLabel;
    qrl_c13: TQRLabel;
    QRShape138: TQRShape;
    QRShape139: TQRShape;
    qrl_c14: TQRLabel;
    QRShape140: TQRShape;
    qrl_c15: TQRLabel;
    QRShape141: TQRShape;
    qrl_c16: TQRLabel;
    QRLabel103: TQRLabel;
    QRShape142: TQRShape;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRShape143: TQRShape;
    qrl_c17: TQRLabel;
    QRShape144: TQRShape;
    QRShape145: TQRShape;
    QRShape146: TQRShape;
    qrl_c18: TQRLabel;
    qrl_c19: TQRLabel;
    qrl_c20: TQRLabel;
    QRShape147: TQRShape;
    QRShape148: TQRShape;
    QRShape149: TQRShape;
    QRShape150: TQRShape;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRShape151: TQRShape;
    qrl_171: TQRLabel;
    QRShape152: TQRShape;
    qrl_172: TQRLabel;
    qrl_173: TQRLabel;
    qrl_174: TQRLabel;
    QRShape153: TQRShape;
    QRShape154: TQRShape;
    qrl_181: TQRLabel;
    qrl_182: TQRLabel;
    qrl_183: TQRLabel;
    qrl_184: TQRLabel;
    qrl_191: TQRLabel;
    qrl_192: TQRLabel;
    qrl_193: TQRLabel;
    qrl_194: TQRLabel;
    qrl_201: TQRLabel;
    qrl_202: TQRLabel;
    qrl_203: TQRLabel;
    qrl_204: TQRLabel;
    QRShape155: TQRShape;
    QRShape156: TQRShape;
    QRShape157: TQRShape;
    QRShape158: TQRShape;
    QRShape159: TQRShape;
    QRShape160: TQRShape;
    QRShape161: TQRShape;
    QRShape162: TQRShape;
    QRLabel131: TQRLabel;
    QRShape163: TQRShape;
    qrl_c21: TQRLabel;
    QRShape164: TQRShape;
    qrl_211: TQRLabel;
    qrl_212: TQRLabel;
    QRShape165: TQRShape;
    QRShape166: TQRShape;
    qrl_213: TQRLabel;
    qrl_214: TQRLabel;
    QRShape167: TQRShape;
    QRShape168: TQRShape;
    qrl_224: TQRLabel;
    qrl_223: TQRLabel;
    QRShape169: TQRShape;
    QRShape170: TQRShape;
    qrl_222: TQRLabel;
    qrl_221: TQRLabel;
    QRShape171: TQRShape;
    qrl_231: TQRLabel;
    QRShape172: TQRShape;
    QRShape173: TQRShape;
    qrl_232: TQRLabel;
    qrl_233: TQRLabel;
    QRShape174: TQRShape;
    QRShape175: TQRShape;
    qrl_234: TQRLabel;
    QRShape176: TQRShape;
    QRShape177: TQRShape;
    QRShape178: TQRShape;
    QRShape179: TQRShape;
    QRShape180: TQRShape;
    QRShape181: TQRShape;
    qrl_c23: TQRLabel;
    QRShape182: TQRShape;
    qrl_c22: TQRLabel;
    QRLabel152: TQRLabel;
    QRLabel153: TQRLabel;
    QRLabel154: TQRLabel;
    QRLabel155: TQRLabel;
    QRLabel145: TQRLabel;
    QRLabel146: TQRLabel;
    QRLabel147: TQRLabel;
    QRShape183: TQRShape;
    QRShape184: TQRShape;
    QRLabel148: TQRLabel;
    QRShape185: TQRShape;
    QRLabel149: TQRLabel;
    QRLabel156: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText6: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender:TCustomQuickRep;var PrintReport:
              Boolean);
    procedure PreencheLabel;
    public    wOrdemBimestre : integer;
  end;

var Qrp_RelAlu012: TQrp_RelAlu012;
    wGrupo : string;
    wReferencia : integer;

implementation

uses u_modulo, U_Principal, u_funcoes;

{$R *.DFM}

procedure TQrp_RelAlu012.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     // NOTAS DE CONCEITO
     qrl_011.caption := '';
     qrl_012.caption := '';
     qrl_013.caption := '';
     qrl_014.caption := '';

     qrl_021.caption := '';
     qrl_022.caption := '';
     qrl_023.caption := '';
     qrl_024.caption := '';

     qrl_031.caption := '';
     qrl_032.caption := '';
     qrl_033.caption := '';
     qrl_034.caption := '';

     qrl_041.caption := '';
     qrl_042.caption := '';
     qrl_043.caption := '';
     qrl_044.caption := '';

     qrl_051.caption := '';
     qrl_052.caption := '';
     qrl_053.caption := '';
     qrl_054.caption := '';

     qrl_061.caption := '';
     qrl_062.caption := '';
     qrl_063.caption := '';
     qrl_064.caption := '';

     qrl_071.caption := '';
     qrl_072.caption := '';
     qrl_073.caption := '';
     qrl_074.caption := '';

     qrl_081.caption := '';
     qrl_082.caption := '';
     qrl_083.caption := '';
     qrl_084.caption := '';

     qrl_091.caption := '';
     qrl_092.caption := '';
     qrl_093.caption := '';
     qrl_094.caption := '';

     qrl_101.caption := '';
     qrl_102.caption := '';
     qrl_103.caption := '';
     qrl_104.caption := '';

     qrl_111.caption := '';
     qrl_112.caption := '';
     qrl_113.caption := '';
     qrl_114.caption := '';

     qrl_121.caption := '';
     qrl_122.caption := '';
     qrl_123.caption := '';
     qrl_124.caption := '';

     qrl_131.caption := '';
     qrl_132.caption := '';
     qrl_133.caption := '';
     qrl_134.caption := '';

     qrl_141.caption := '';
     qrl_142.caption := '';
     qrl_143.caption := '';
     qrl_144.caption := '';

     qrl_151.caption := '';
     qrl_152.caption := '';
     qrl_153.caption := '';
     qrl_154.caption := '';

     qrl_161.caption := '';
     qrl_162.caption := '';
     qrl_163.caption := '';
     qrl_164.caption := '';

     qrl_171.caption := '';
     qrl_172.caption := '';
     qrl_173.caption := '';
     qrl_174.caption := '';

     qrl_181.caption := '';
     qrl_182.caption := '';
     qrl_183.caption := '';
     qrl_184.caption := '';

     qrl_191.caption := '';
     qrl_192.caption := '';
     qrl_193.caption := '';
     qrl_194.caption := '';

     qrl_201.caption := '';
     qrl_202.caption := '';
     qrl_203.caption := '';
     qrl_204.caption := '';

     qrl_211.caption := '';
     qrl_212.caption := '';
     qrl_213.caption := '';
     qrl_214.caption := '';

     qrl_221.caption := '';
     qrl_222.caption := '';
     qrl_223.caption := '';
     qrl_224.caption := '';

     qrl_231.caption := '';
     qrl_232.caption := '';
     qrl_233.caption := '';
     qrl_234.caption := '';

     with Frm_Modulo.IBQ_funcoes2 do
     begin
          Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes2,
          'SELECT * FROM TB_MATRTABCONCEITO',
          'WHERE MATR_ANO=:W1 AND MATRSERI=:W2 AND MATRALUN=:W3',
          [Frm_Modulo.IBQ_funcoes.fieldbyname('matr_ano').asstring,
           Frm_Modulo.IBQ_funcoes.fieldbyname('matrseri').asstring,
           Frm_Modulo.IBQ_funcoes.fieldbyname('matralun').asstring]);
          first;
          while not eof do
          begin
              if Frm_Principal.wPREENCHE_REL_BOLETIM then
              begin
               if fieldbyname('matrconc').asstring = '01' then
               begin
                    qrl_011.caption := fieldbyname('matr1bnt').asstring;
                    qrl_012.caption := fieldbyname('matr2bnt').asstring;
                    qrl_013.caption := fieldbyname('matr3bnt').asstring;
                    qrl_014.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '02' then
               begin
                    qrl_021.caption := fieldbyname('matr1bnt').asstring;
                    qrl_022.caption := fieldbyname('matr2bnt').asstring;
                    qrl_023.caption := fieldbyname('matr3bnt').asstring;
                    qrl_024.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '03' then
               begin
                    qrl_031.caption := fieldbyname('matr1bnt').asstring;
                    qrl_032.caption := fieldbyname('matr2bnt').asstring;
                    qrl_033.caption := fieldbyname('matr3bnt').asstring;
                    qrl_034.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '04' then
               begin
                    qrl_041.caption := fieldbyname('matr1bnt').asstring;
                    qrl_042.caption := fieldbyname('matr2bnt').asstring;
                    qrl_043.caption := fieldbyname('matr3bnt').asstring;
                    qrl_044.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '05' then
               begin
                    qrl_051.caption := fieldbyname('matr1bnt').asstring;
                    qrl_052.caption := fieldbyname('matr2bnt').asstring;
                    qrl_053.caption := fieldbyname('matr3bnt').asstring;
                    qrl_054.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '06' then
               begin
                    qrl_061.caption := fieldbyname('matr1bnt').asstring;
                    qrl_062.caption := fieldbyname('matr2bnt').asstring;
                    qrl_063.caption := fieldbyname('matr3bnt').asstring;
                    qrl_064.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '07' then
               begin
                    qrl_071.caption := fieldbyname('matr1bnt').asstring;
                    qrl_072.caption := fieldbyname('matr2bnt').asstring;
                    qrl_073.caption := fieldbyname('matr3bnt').asstring;
                    qrl_074.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '08' then
               begin
                    qrl_081.caption := fieldbyname('matr1bnt').asstring;
                    qrl_082.caption := fieldbyname('matr2bnt').asstring;
                    qrl_083.caption := fieldbyname('matr3bnt').asstring;
                    qrl_084.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '09' then
               begin
                    qrl_091.caption := fieldbyname('matr1bnt').asstring;
                    qrl_092.caption := fieldbyname('matr2bnt').asstring;
                    qrl_093.caption := fieldbyname('matr3bnt').asstring;
                    qrl_094.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '10' then
               begin
                    qrl_101.caption := fieldbyname('matr1bnt').asstring;
                    qrl_102.caption := fieldbyname('matr2bnt').asstring;
                    qrl_103.caption := fieldbyname('matr3bnt').asstring;
                    qrl_104.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '11' then
               begin
                    qrl_111.caption := fieldbyname('matr1bnt').asstring;
                    qrl_112.caption := fieldbyname('matr2bnt').asstring;
                    qrl_113.caption := fieldbyname('matr3bnt').asstring;
                    qrl_114.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '12' then
               begin
                    qrl_121.caption := fieldbyname('matr1bnt').asstring;
                    qrl_122.caption := fieldbyname('matr2bnt').asstring;
                    qrl_123.caption := fieldbyname('matr3bnt').asstring;
                    qrl_124.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '03' then
               begin
                    qrl_131.caption := fieldbyname('matr1bnt').asstring;
                    qrl_132.caption := fieldbyname('matr2bnt').asstring;
                    qrl_133.caption := fieldbyname('matr3bnt').asstring;
                    qrl_134.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '04' then
               begin
                    qrl_141.caption := fieldbyname('matr1bnt').asstring;
                    qrl_142.caption := fieldbyname('matr2bnt').asstring;
                    qrl_143.caption := fieldbyname('matr3bnt').asstring;
                    qrl_144.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '15' then
               begin
                    qrl_151.caption := fieldbyname('matr1bnt').asstring;
                    qrl_152.caption := fieldbyname('matr2bnt').asstring;
                    qrl_153.caption := fieldbyname('matr3bnt').asstring;
                    qrl_154.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '16' then
               begin
                    qrl_161.caption := fieldbyname('matr1bnt').asstring;
                    qrl_162.caption := fieldbyname('matr2bnt').asstring;
                    qrl_163.caption := fieldbyname('matr3bnt').asstring;
                    qrl_164.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '17' then
               begin
                    qrl_171.caption := fieldbyname('matr1bnt').asstring;
                    qrl_172.caption := fieldbyname('matr2bnt').asstring;
                    qrl_173.caption := fieldbyname('matr3bnt').asstring;
                    qrl_174.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '18' then
               begin
                    qrl_181.caption := fieldbyname('matr1bnt').asstring;
                    qrl_182.caption := fieldbyname('matr2bnt').asstring;
                    qrl_183.caption := fieldbyname('matr3bnt').asstring;
                    qrl_184.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '19' then
               begin
                    qrl_191.caption := fieldbyname('matr1bnt').asstring;
                    qrl_192.caption := fieldbyname('matr2bnt').asstring;
                    qrl_193.caption := fieldbyname('matr3bnt').asstring;
                    qrl_194.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '20' then
               begin
                    qrl_201.caption := fieldbyname('matr1bnt').asstring;
                    qrl_202.caption := fieldbyname('matr2bnt').asstring;
                    qrl_203.caption := fieldbyname('matr3bnt').asstring;
                    qrl_204.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '21' then
               begin
                    qrl_211.caption := fieldbyname('matr1bnt').asstring;
                    qrl_212.caption := fieldbyname('matr2bnt').asstring;
                    qrl_213.caption := fieldbyname('matr3bnt').asstring;
                    qrl_214.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '22' then
               begin
                    qrl_221.caption := fieldbyname('matr1bnt').asstring;
                    qrl_222.caption := fieldbyname('matr2bnt').asstring;
                    qrl_223.caption := fieldbyname('matr3bnt').asstring;
                    qrl_224.caption := fieldbyname('matr4bnt').asstring;
               end
               else if fieldbyname('matrconc').asstring = '23' then
               begin
                    qrl_231.caption := fieldbyname('matr1bnt').asstring;
                    qrl_232.caption := fieldbyname('matr2bnt').asstring;
                    qrl_233.caption := fieldbyname('matr3bnt').asstring;
                    qrl_234.caption := fieldbyname('matr4bnt').asstring;
               end;
              end;
              next;
          end;
     end;

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

    wReferencia := 1;
    if Frm_Principal.wPREENCHE_REL_BOLETIM then PreencheLabel;

    wGrupo  := Frm_Modulo.IBQ_funcoes.fieldbyname('alunnome').asstring;

    if not Frm_Modulo.IBQ_funcoes.eof then Frm_Modulo.IBQ_funcoes.next;
    while not (Frm_Modulo.IBQ_funcoes.eof) and (wGrupo =
    Frm_Modulo.IBQ_funcoes.fieldbyname('alunnome').asstring) do
    begin
         wReferencia := wReferencia + 1;
         if Frm_Principal.wPREENCHE_REL_BOLETIM then PreencheLabel;
         Frm_Modulo.IBQ_funcoes.next;
    end;
    if not Frm_Modulo.IBQ_funcoes.eof then Frm_Modulo.IBQ_funcoes.prior;
end;

procedure TQrp_RelAlu012.PreencheLabel;
begin
    with Frm_Modulo.IBQ_funcoes do
    begin
         case wReferencia of
         1:
         begin
         qrl_d01.caption  := fieldbyname('discdesc').asstring;
         qrl_au01.caption := fieldbyname('matr1bct').asstring;
         qrl_tb01.caption := fieldbyname('matr2bct').asstring;
         qrl_pb01.caption := fieldbyname('matr3bct').asstring;
         qrl_m01.caption  := fieldbyname('matr4bct').asstring;

         end;
         2:
         begin
         qrl_d02.caption  := fieldbyname('discdesc').asstring;
         qrl_au02.caption := fieldbyname('matr1bct').asstring;
         qrl_tb02.caption := fieldbyname('matr2bct').asstring;
         qrl_pb02.caption := fieldbyname('matr3bct').asstring;
         qrl_m02.caption  := fieldbyname('matr4bct').asstring;
         end;
         3:
         begin
         qrl_d03.caption  := fieldbyname('discdesc').asstring;
         qrl_au03.caption := fieldbyname('matr1bct').asstring;
         qrl_tb03.caption := fieldbyname('matr2bct').asstring;
         qrl_pb03.caption := fieldbyname('matr3bct').asstring;
         qrl_m03.caption  := fieldbyname('matr4bct').asstring;
         end;
         4:
         begin
         qrl_d04.caption  := fieldbyname('discdesc').asstring;
         qrl_au04.caption := fieldbyname('matr1bct').asstring;
         qrl_tb04.caption := fieldbyname('matr2bct').asstring;
         qrl_pb04.caption := fieldbyname('matr3bct').asstring;
         qrl_m04.caption  := fieldbyname('matr4bct').asstring;
         end;
         5:
         begin
         qrl_d05.caption  := fieldbyname('discdesc').asstring;
         qrl_au05.caption := fieldbyname('matr1bct').asstring;
         qrl_tb05.caption := fieldbyname('matr2bct').asstring;
         qrl_pb05.caption := fieldbyname('matr3bct').asstring;
         qrl_m05.caption  := fieldbyname('matr4bct').asstring;
         end;
         6:
         begin
         qrl_d06.caption  := fieldbyname('discdesc').asstring;
         qrl_au06.caption := fieldbyname('matr1bct').asstring;
         qrl_tb06.caption := fieldbyname('matr2bct').asstring;
         qrl_pb06.caption := fieldbyname('matr3bct').asstring;
         qrl_m06.caption  := fieldbyname('matr4bct').asstring;
         end;
         7:
         begin
         qrl_d07.caption  := fieldbyname('discdesc').asstring;
         qrl_au07.caption := fieldbyname('matr1bct').asstring;
         qrl_tb07.caption := fieldbyname('matr2bct').asstring;
         qrl_pb07.caption := fieldbyname('matr3bct').asstring;
         qrl_m07.caption  := fieldbyname('matr4bct').asstring;
         end;
         8:
         begin
         qrl_d08.caption  := fieldbyname('discdesc').asstring;
         qrl_au08.caption := fieldbyname('matr1bct').asstring;
         qrl_tb08.caption := fieldbyname('matr2bct').asstring;
         qrl_pb08.caption := fieldbyname('matr3bct').asstring;
         qrl_m08.caption  := fieldbyname('matr4bct').asstring;
         end;
         end;
    end;
end;

procedure TQrp_RelAlu012.QuickRepBeforePrint(Sender: TCustomQuickRep; var
          PrintReport: Boolean);
begin
     wGrupo                  := 'kdsgdfdfdretsfdrerdwasw';
end;

end.
