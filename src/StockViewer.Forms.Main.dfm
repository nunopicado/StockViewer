object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'Visualizador de Invent'#225'rio'
  ClientHeight = 660
  ClientWidth = 906
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sbMain: TStatusBar
    Left = 0
    Top = 641
    Width = 906
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
    Top = 23
    Width = 906
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 0
    object lblTaxRegistrationNumber: TLabel
      Left = 16
      Top = 10
      Width = 21
      Height = 13
      Caption = 'NIF:'
    end
    object lblEdTaxRegistrationNumber: TLabel
      Left = 43
      Top = 10
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
      Top = 10
      Width = 52
      Height = 13
      Caption = 'Ano Fiscal:'
    end
    object lblEdFiscalYear: TLabel
      Left = 322
      Top = 10
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
      Top = 10
      Width = 113
      Height = 13
      Caption = 'Data de fim de per'#237'odo:'
    end
    object lblEdEndDate: TLabel
      Left = 599
      Top = 10
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
      Top = 10
      Width = 80
      Height = 13
      Caption = 'Sem exist'#234'ncias:'
    end
    object lblEdNoStock: TLabel
      Left = 807
      Top = 10
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
  object gridStock: TcxGrid
    Left = 0
    Top = 56
    Width = 906
    Height = 585
    Align = alClient
    TabOrder = 2
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'MoneyTwins'
    ExplicitTop = 33
    ExplicitHeight = 608
    object gridStockDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsStock
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderFilterButtonShowMode = fbmButton
      object gridStockDBTableView1Column1: TcxGridDBColumn
        Caption = 'Categoria'
        DataBinding.FieldName = 'ProductCategory'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 80
      end
      object gridStockDBTableView1Column2: TcxGridDBColumn
        Caption = 'C'#243'digo Produto'
        DataBinding.FieldName = 'ProductCode'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 120
      end
      object gridStockDBTableView1Column3: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'ProductDescription'
        HeaderAlignmentHorz = taCenter
        Width = 300
      end
      object gridStockDBTableView1Column4: TcxGridDBColumn
        Caption = 'C'#243'digo Barras'
        DataBinding.FieldName = 'ProductNumberCode'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 150
      end
      object gridStockDBTableView1Column5: TcxGridDBColumn
        Caption = 'Exist'#234'ncia'
        DataBinding.FieldName = 'ClosingStockQuantity'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 120
      end
      object gridStockDBTableView1Column6: TcxGridDBColumn
        Caption = 'Unidade'
        DataBinding.FieldName = 'UnitOfMeasure'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 120
      end
    end
    object gridStockLevel1: TcxGridLevel
      GridView = gridStockDBTableView1
    end
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 906
    Height = 23
    ActionManager = mgrMain
    Caption = 'ActionToolBar1'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 7171437
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Spacing = 0
  end
  object dlgOpen: TOpenDialog
    Filter = 'Ficheiro XML de invent'#225'rios v1.02|*.xml'
    Left = 64
    Top = 232
  end
  object csvStock: TJvCsvDataSet
    CsvFieldDef = 
      'ProductCategory:$1,ProductCode:$60,ProductDescription:$200,Produ' +
      'ctNumberCode:$60,ClosingStockQuantity:&,UnitOfMeasure:$20'
    Separator = ';'
    LoadsFromFile = False
    SavesChanges = False
    AutoBackupCount = 0
    EnquoteBackslash = True
    AlwaysEnquoteStrings = True
    AlwaysEnquoteFloats = True
    Left = 64
    Top = 416
  end
  object dsStock: TDataSource
    DataSet = csvStock
    Left = 64
    Top = 480
  end
  object mgrMain: TActionManager
    ActionBars = <
      item
        Items.CaptionOptions = coAll
        Items = <
          item
            Action = actOpen
          end
          item
            Action = actExport
          end>
        ActionBar = ActionToolBar1
      end>
    Left = 64
    Top = 352
    StyleName = 'Platform Default'
    object actOpen: TAction
      Caption = '&Abrir Invent'#225'rio XML'
      OnExecute = actOpenExecute
    end
    object actExport: TAction
      Caption = '&Exportar Invent'#225'rio CSV'
      OnExecute = actExportExecute
    end
  end
  object dlgSave: TSaveDialog
    DefaultExt = '*.csv'
    Filter = 'Invent'#225'rio CSV|*.csv'
    Left = 64
    Top = 288
  end
end
