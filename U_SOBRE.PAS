unit U_Sobre;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, RXCtrls, jpeg;

type
  TFrm_Sobre = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    Lbl_Licensa: TLabel;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  end;

var
  Frm_Sobre: TFrm_Sobre;

implementation

uses U_Principal;

{$R *.DFM}

procedure TFrm_Sobre.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key = #27) then Close;
end;

procedure TFrm_Sobre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = 112 then WinHelp(TFrm_Sobre.Create(Self).Handle,
     'Ajuda.Hlp',HELP_CONTEXT,20);
end;

procedure TFrm_Sobre.FormShow(Sender: TObject);
begin
     label1.caption := 'Software Acadêmico ['+Frm_Principal.wversao+
                       '] - Copyright (c) 2004';
end;

end.

