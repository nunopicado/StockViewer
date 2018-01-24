unit StockViewer.Forms.Main;

interface

uses
    Winapi.Windows
  , Winapi.Messages
  , System.SysUtils
  , System.Variants
  , System.Classes
  , Vcl.Graphics
  , Vcl.Controls
  , Vcl.Forms
  , Vcl.Dialogs
  , Vcl.Grids
  , Vcl.ComCtrls
  , Vcl.StdCtrls
  , Vcl.ExtCtrls
  , StockViewer.StockFile
  , RO.IMatrix
  , Data.DB
  , JvCsvData
  , Vcl.DBGrids
  , cxGraphics
  , cxControls
  , cxLookAndFeels
  , cxLookAndFeelPainters
  , dxSkinsCore
  , dxSkinMoneyTwins
  , cxCustomData
  , cxFilter
  , cxData
  , cxDataStorage
  , cxEdit
  , cxNavigator
  , cxDBData
  , cxGridCustomTableView
  , cxGridTableView
  , cxGridDBTableView
  , cxGridLevel
  , cxClasses
  , cxGridCustomView
  , cxGrid
  , cxTextEdit
  , cxStyles
  , dxSkinOffice2010Blue
  , dxSkinscxPCPainter
  , Vcl.ToolWin
  , Vcl.ActnMan
  , Vcl.ActnCtrls
  , System.Actions
  , Vcl.ActnList
  , Vcl.PlatformDefaultStyleActnCtrls
  ;

type
  TfMain = class(TForm)
    dlgOpen: TOpenDialog;
    sbMain: TStatusBar;
    pnlHeader: TPanel;
    lblTaxRegistrationNumber: TLabel;
    lblEdTaxRegistrationNumber: TLabel;
    lblFiscalYear: TLabel;
    lblEdFiscalYear: TLabel;
    lblEndDate: TLabel;
    lblEdEndDate: TLabel;
    lblNoStock: TLabel;
    lblEdNoStock: TLabel;
    csvStock: TJvCsvDataSet;
    dsStock: TDataSource;
    gridStockDBTableView1: TcxGridDBTableView;
    gridStockLevel1: TcxGridLevel;
    gridStock: TcxGrid;
    gridStockDBTableView1Column1: TcxGridDBColumn;
    gridStockDBTableView1Column2: TcxGridDBColumn;
    gridStockDBTableView1Column3: TcxGridDBColumn;
    gridStockDBTableView1Column4: TcxGridDBColumn;
    gridStockDBTableView1Column5: TcxGridDBColumn;
    gridStockDBTableView1Column6: TcxGridDBColumn;
    mgrMain: TActionManager;
    actOpen: TAction;
    actExport: TAction;
    ActionToolBar1: TActionToolBar;
    dlgSave: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
  private const
    cProductCount = 1;
    cStockFile    = 2;
  private
    Stock: IStockFile;
    procedure LoadXML(Filename: string);
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

procedure TfMain.actExportExecute(Sender: TObject);
begin
  if dlgSave.Execute
    then begin
      if FileExists(dlgSave.FileName) and
          (MessageDlg('O ficheiro já existe. Sobreescrever?', mtConfirmation, [mbYes, mbNo], 0) = mrNo)
        then begin
          ShowMessage('Nenhum ficheiro guardado');
          Exit;
        end;
      csvStock.SaveToFile(dlgSave.FileName);
    end;
end;

procedure TfMain.actOpenExecute(Sender: TObject);
begin
  if dlgOpen.Execute
    then LoadXML(dlgOpen.FileName);
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  csvStock.DecimalSeparator  := ',';
  csvStock.CsvFieldDef       := 'ProductCategory:$1,ProductCode:$60,ProductDescription:$200,ProductNumberCode:$60,ClosingStockQuantity:&,UnitOfMeasure:$20';
end;

procedure TfMain.FormShow(Sender: TObject);
begin
  if (ParamCount = 1) and (FileExists(ParamStr(1)))
    then LoadXML(ParamStr(1));
end;

procedure TfMain.LoadXML(Filename: string);
const
  cNoStock: array [Boolean] of string = ('Não', 'Sim');
begin
  sbMain.Panels[cStockFile].Text := Filename;
  Stock := TStockFile.New(FileName);
  with Stock do
    begin
      lblEdTaxRegistrationNumber.Caption := Header.TaxRegistrationNumber.ToString;
      lblEdFiscalYear.Caption            := Header.FiscalYear.ToString;
      lblEdEndDate.Caption               := FormatDateTime('yyyy-mm-dd', Header.EndDate);
      lblEdNoStock.Caption               := cNoStock[Header.NoStock];
      csvStock.AssignFromStrings(Data.Content);
      csvStock.Open;
      TFloatField(csvStock.FieldByName('ClosingStockQuantity')).DisplayFormat := '#.000';
    end;
end;

end.
