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
    ColCount = 1
    DefaultColWidth = 140
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 0
    OnDblClick = gridDblClick
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
    object lblTaxRegistrationNumber: TLabel
      Left = 16
      Top = 8
      Width = 21
      Height = 13
      Caption = 'NIF:'
    end
    object lblEdTaxRegistrationNumber: TLabel
      Left = 43
      Top = 8
      Width = 182
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFiscalYear: TLabel
      Left = 264
      Top = 8
      Width = 52
      Height = 13
      Caption = 'Ano Fiscal:'
    end
    object lblEdFiscalYear: TLabel
      Left = 322
      Top = 8
      Width = 79
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblEndDate: TLabel
      Left = 480
      Top = 8
      Width = 113
      Height = 13
      Caption = 'Data de fim de per'#237'odo:'
    end
    object lblEdEndDate: TLabel
      Left = 599
      Top = 8
      Width = 116
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNoStock: TLabel
      Left = 721
      Top = 8
      Width = 80
      Height = 13
      Caption = 'Sem exist'#234'ncias:'
    end
    object lblEdNoStock: TLabel
      Left = 807
      Top = 8
      Width = 72
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object dlgOpen: TOpenDialog
    Filter = 'Ficheiro XML de invent'#225'rios v1.02|*.xml'
    Left = 576
    Top = 224
  end
end
