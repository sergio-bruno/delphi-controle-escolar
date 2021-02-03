unit U_RelAlu009;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TQrp_RelAlu009 = class(TQuickRep)
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
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape72: TQRShape;
    QRShape75: TQRShape;
    QRShape77: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
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
    qrl_faltas: TQRLabel;
    QRShape1: TQRShape;
    QRShape10: TQRShape;
    QRL_d10: TQRLabel;
    QRShape16: TQRShape;
    qrl_au10: TQRLabel;
    qrl_tb10: TQRLabel;
    QRShape22: TQRShape;
    QRShape34: TQRShape;
    qrl_pb10: TQRLabel;
    qrl_m10: TQRLabel;
    QRShape37: TQRShape;
    QRShape40: TQRShape;
    qrl_d11: TQRLabel;
    QRShape52: TQRShape;
    qrl_au11: TQRLabel;
    qrl_tb11: TQRLabel;
    QRShape55: TQRShape;
    QRShape58: TQRShape;
    qrl_pb11: TQRLabel;
    qrl_m11: TQRLabel;
    QRShape62: TQRShape;
    QRShape86: TQRShape;
    QRShape70: TQRShape;
    QRShape63: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender:TCustomQuickRep;var PrintReport:
              Boolean);
    procedure PreencheLabel;
    public    wOrdemBimestre : integer;
  end;

var Qrp_RelAlu009: TQrp_RelAlu009;
    wGrupo : string;
    wReferencia, wFaltas : integer;

implementation

uses u_modulo, U_Principal;

{$R *.DFM}

procedure TQrp_RelAlu009.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
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
    qrl_au10.caption := '';
    qrl_tb10.caption := '';
    qrl_pb10.caption := '';
    qrl_m10.caption := '';

    qrl_d11.caption := '';
    qrl_au11.caption := '';
    qrl_tb11.caption := '';
    qrl_pb11.caption := '';
    qrl_m11.caption := '';

    {
    qrl_d12.caption := '';
    qrl_au12.caption := '';
    qrl_tb12.caption := '';
    qrl_pb12.caption := '';
    qrl_m12.caption := '';

    qrl_d13.caption := '';
    qrl_au13.caption := '';
    qrl_tb13.caption := '';
    qrl_pb13.caption := '';
    qrl_m13.caption := '';
    }


    // REMOVER PARA FUNDAMENTAL AQUI
    if Frm_Modulo.IBQ_Boletim.fieldbyname('matrseri').asstring > '009' then
       PRINTBAND := FALSE;




         wReferencia := 1;
         if Frm_Principal.wPREENCHE_REL_BOLETIM then PreencheLabel;

         wGrupo  := Frm_Modulo.IBQ_Boletim.fieldbyname('alunnome').asstring;
         wFaltas := Frm_Modulo.IBQ_Boletim.fieldbyname('matr'+inttostr(
                    wOrdemBimestre)+'bft').asinteger;

         if not Frm_Modulo.IBQ_Boletim.eof then Frm_Modulo.IBQ_Boletim.next;
         while not (Frm_Modulo.IBQ_Boletim.eof) and (wGrupo =
         Frm_Modulo.IBQ_Boletim.fieldbyname('alunnome').asstring) do
         begin
              wFaltas := wFaltas + Frm_Modulo.IBQ_Boletim.fieldbyname('matr'+
                         inttostr(wOrdemBimestre)+'bft').asinteger;
              wReferencia := wReferencia + 1;
              if Frm_Principal.wPREENCHE_REL_BOLETIM then PreencheLabel;
              Frm_Modulo.IBQ_Boletim.next;
         end;
         if not Frm_Modulo.IBQ_Boletim.eof then Frm_Modulo.IBQ_Boletim.prior;
         qrl_faltas.caption := inttostr(wFaltas);
end;

procedure TQrp_RelAlu009.PreencheLabel;
var wNOTA_AU, wNOTA_TB, wNOTA_PB, wNOTA_M : STRING;
begin
    with Frm_Modulo.IBQ_Boletim do
    begin
         wNOTA_AU := '';
         wNOTA_TB := '';
         wNOTA_PB := '';
         wNOTA_M  := '';
         if fieldbyname('matr'+inttostr(wOrdemBimestre)+'bau').asfloat > 0 then
            wNOTA_AU := formatfloat(',0.0',fieldbyname('matr'+inttostr(
                        wOrdemBimestre)+'bau').asfloat);
         if fieldbyname('matr'+inttostr(wOrdemBimestre)+'btb').asfloat > 0 then
            wNOTA_TB := formatfloat(',0.0',fieldbyname('matr'+inttostr(
                        wOrdemBimestre)+'btb').asfloat);
         if fieldbyname('matr'+inttostr(wOrdemBimestre)+'bpb').asfloat > 0 then
            wNOTA_PB := formatfloat(',0.0',fieldbyname('matr'+inttostr(
                        wOrdemBimestre)+'bpb').asfloat);
         if fieldbyname('matr'+inttostr(wOrdemBimestre)+'bmd').asfloat > 0 then
            wNOTA_M  := formatfloat(',0.0',fieldbyname('matr'+inttostr(
                        wOrdemBimestre)+'bmd').asfloat);

         case wReferencia of
         1:
         begin
         qrl_d01.caption  := fieldbyname('discdesc').asstring;
         qrl_au01.caption := wNOTA_AU;
         qrl_tb01.caption := wNOTA_TB;
         qrl_pb01.caption := wNOTA_PB;
         qrl_m01.caption  := wNOTA_M;
         end;
         2:
         begin
         qrl_d02.caption  := fieldbyname('discdesc').asstring;
         qrl_au02.caption := wNOTA_AU;
         qrl_tb02.caption := wNOTA_TB;
         qrl_pb02.caption := wNOTA_PB;
         qrl_m02.caption  := wNOTA_M;
         end;
         3:
         begin
         qrl_d03.caption  := fieldbyname('discdesc').asstring;
         qrl_au03.caption := wNOTA_AU;
         qrl_tb03.caption := wNOTA_TB;
         qrl_pb03.caption := wNOTA_PB;
         qrl_m03.caption  := wNOTA_M;
         end;
         4:
         begin
         qrl_d04.caption  := fieldbyname('discdesc').asstring;
         qrl_au04.caption := wNOTA_AU;
         qrl_tb04.caption := wNOTA_TB;
         qrl_pb04.caption := wNOTA_PB;
         qrl_m04.caption  := wNOTA_M;
         end;
         5:
         begin
         qrl_d05.caption  := fieldbyname('discdesc').asstring;
         qrl_au05.caption := wNOTA_AU;
         qrl_tb05.caption := wNOTA_TB;
         qrl_pb05.caption := wNOTA_PB;
         qrl_m05.caption  := wNOTA_M;
         end;
         6:
         begin
         qrl_d06.caption  := fieldbyname('discdesc').asstring;
         qrl_au06.caption := wNOTA_AU;
         qrl_tb06.caption := wNOTA_TB;
         qrl_pb06.caption := wNOTA_PB;
         qrl_m06.caption  := wNOTA_M;
         end;
         7:
         begin
         qrl_d07.caption  := fieldbyname('discdesc').asstring;
         qrl_au07.caption := wNOTA_AU;
         qrl_tb07.caption := wNOTA_TB;
         qrl_pb07.caption := wNOTA_PB;
         qrl_m07.caption  := wNOTA_M;
         end;
         8:
         begin
         qrl_d08.caption  := fieldbyname('discdesc').asstring;
         qrl_au08.caption := wNOTA_AU;
         qrl_tb08.caption := wNOTA_TB;
         qrl_pb08.caption := wNOTA_PB;
         qrl_m08.caption  := wNOTA_M;
         end;
         9:
         begin
         qrl_d09.caption  := fieldbyname('discdesc').asstring;
         qrl_au09.caption := wNOTA_AU;
         qrl_tb09.caption := wNOTA_TB;
         qrl_pb09.caption := wNOTA_PB;
         qrl_m09.caption  := wNOTA_M;
         end;
         10:
         begin
         qrl_d10.caption  := fieldbyname('discdesc').asstring;
         qrl_au10.caption := wNOTA_AU;
         qrl_tb10.caption := wNOTA_TB;
         qrl_pb10.caption := wNOTA_PB;
         qrl_m10.caption  := wNOTA_M;
         end;
         11:
         begin
         qrl_d11.caption  := fieldbyname('discdesc').asstring;
         qrl_au11.caption := wNOTA_AU;
         qrl_tb11.caption := wNOTA_TB;
         qrl_pb11.caption := wNOTA_PB;
         qrl_m11.caption  := wNOTA_M;
         end;
         {
         12:
         begin
         qrl_d12.caption  := fieldbyname('discdesc').asstring;
         qrl_au12.caption := wNOTA_AU;
         qrl_tb12.caption := wNOTA_TB;
         qrl_pb12.caption := wNOTA_PB;
         qrl_m12.caption  := wNOTA_M;
         end;
         13:
         begin
         qrl_d13.caption  := fieldbyname('discdesc').asstring;
         qrl_au13.caption := wNOTA_AU;
         qrl_tb13.caption := wNOTA_TB;
         qrl_pb13.caption := wNOTA_PB;
         qrl_m13.caption  := wNOTA_M;
         end;
         }
         end;
    end;
end;

procedure TQrp_RelAlu009.QuickRepBeforePrint(Sender: TCustomQuickRep; var
          PrintReport: Boolean);
begin
     wGrupo                  := 'kdsgdfdfdretsfdrerdwasw';
end;

end.
