object fMain: TfMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Visualizador de Invent'#225'rio'
  ClientHeight = 670
  ClientWidth = 890
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grid: TStringGrid
    Left = 0
    Top = 33
    Width = 890
    Height = 618
    Align = alClient
    ColCount = 6
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 0
    OnDblClick = gridDblClick
    ExplicitTop = 0
    ExplicitHeight = 651
    ColWidths = (
      73
      130
      331
      142
      91
      88)
  end
  object sbMain: TStatusBar
    Left = 0
    Top = 651
    Width = 890
    Height = 19
    Panels = <
      item
        Width = 8
      end
      item
        Alignment = taCenter
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 890
    Height = 33
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 21
      Height = 13
      Caption = 'NIF:'
    end
    object lblEdNIF: TLabel
      Left = 43
      Top = 8
      Width = 102
      Height = 13
      Caption = 'lblEdNIF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 264
      Top = 8
      Width = 52
      Height = 13
      Caption = 'Ano Fiscal:'
    end
    object lblEdAnoFiscal: TLabel
      Left = 322
      Top = 8
      Width = 44
      Height = 13
      Caption = 'lblEdNIF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 480
      Top = 8
      Width = 113
      Height = 13
      Caption = 'Data de fim de per'#237'odo:'
    end
    object lblEdData: TLabel
      Left = 599
      Top = 8
      Width = 66
      Height = 13
      Caption = 'lblEdNIF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 721
      Top = 8
      Width = 80
      Height = 13
      Caption = 'Sem exist'#234'ncias:'
    end
    object lblEdNoStock: TLabel
      Left = 807
      Top = 8
      Width = 44
      Height = 13
      Caption = 'lblEdNIF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object dlgOpen: TOpenDialog
    Left = 576
    Top = 224
  end
end
