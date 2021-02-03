object Frm_GerenciaAlunoConceito: TFrm_GerenciaAlunoConceito
  Left = 29
  Top = 41
  BorderStyle = bsDialog
  Caption = 'Frm_GerenciaAlunoConceito'
  ClientHeight = 475
  ClientWidth = 755
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 755
    Height = 23
    Align = alTop
    Caption = 'Gerenciamento de Aluno - Por Conceito'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 0
    Top = 434
    Width = 755
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Btn_filtrar: TButton
      Left = 470
      Top = 10
      Width = 92
      Height = 25
      Caption = '&Filtrar'
      TabOrder = 2
      OnClick = Btn_filtrarClick
    end
    object Btn_editar: TButton
      Left = 562
      Top = 10
      Width = 92
      Height = 25
      Caption = '&Editar'
      TabOrder = 3
      OnClick = Btn_editarClick
    end
    object btn_sair: TButton
      Left = 654
      Top = 10
      Width = 92
      Height = 25
      Caption = 'Sai&r'
      TabOrder = 4
      OnClick = Button1Click
    end
    object btn_matricula: TButton
      Left = 378
      Top = 10
      Width = 92
      Height = 25
      Caption = 'Efetuar &Matr'#237'cula'
      TabOrder = 1
      OnClick = btn_matriculaClick
    end
    object Btn_AlunoSerie: TButton
      Left = 286
      Top = 10
      Width = 92
      Height = 25
      Caption = '&Alunos por S'#233'rie'
      TabOrder = 0
      OnClick = Btn_AlunoSerieClick
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 23
    Width = 755
    Height = 411
    Align = alClient
    DataSource = Frm_Modulo.Dts_MatrConceito
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'MATR_ANO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MATRSERI'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIDESC'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MATRALUN'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUNNOME'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MATRDISC'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DISCDESC'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MATR1BCT'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MATR2BCT'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MATR3BCT'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MATR4BCT'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TURNDESC'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MATRAGEN'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AGENNOME'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 64
        Visible = True
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 652
    Top = 16
    object abela1: TMenuItem
      Caption = 'Tabela'
      object NvelEscolar1: TMenuItem
        Caption = 'N'#237'vel Escolar'
        OnClick = NvelEscolar1Click
      end
      object Disciplina1: TMenuItem
        Caption = 'Disciplina'
        OnClick = Disciplina1Click
      end
      object Srie1: TMenuItem
        Caption = 'S'#233'rie'
        OnClick = Srie1Click
      end
    end
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Docente1: TMenuItem
        Caption = 'Docente'
        OnClick = Docente1Click
      end
      object Dicente1: TMenuItem
        Caption = 'Dicente'
        OnClick = Dicente1Click
      end
    end
  end
end
