unit uMain;

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
  , uStockFile
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
  ;

type
  TfMain = class(TForm, IStockView)
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
    procedure gridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private const
    cProductCount = 1;
    cStockFile    = 2;
  private
    procedure LoadXML(Filename: string);
  public
    function UpdateHeader(NIF: Integer; FiscalYear: Word; EndPeriod: TDateTime; NoStock: Boolean): IStockView;
    function UpdateData(StockData: IMatrix<string>): IStockView;
  end;

var
  fMain: TfMain;

implementation

uses
    RO.TMatrix
  ;

{$R *.dfm}

function TfMain.UpdateData(StockData: IMatrix<string>): IStockView;
var
  Row: Integer;
begin
  csvStock.Open;
  csvStock.DeleteRows(1, csvStock.RecordCount);
  TFloatField(csvStock.FieldByName('ClosingStockQuantity')).DisplayFormat := '#.000';
  for Row := 1 to Pred(StockData.RowCount) do
    begin
      csvStock.Append;
      csvStock.FieldValues['ProductCategory']      := StockData.Cell(0, Row);
      csvStock.FieldValues['ProductCode']          := StockData.Cell(1, Row);
      csvStock.FieldValues['ProductDescription']   := StockData.Cell(2, Row);
      csvStock.FieldValues['ProductNumberCode']    := StockData.Cell(3, Row);
      csvStock.FieldValues['ClosingStockQuantity'] := StockData.Cell(4, Row);
      csvStock.FieldValues['UnitOfMeasure']        := StockData.Cell(5, Row);
      csvStock.Post;
    end;
  csvStock.RecNo := 1;
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

procedure TfMain.gridDblClick(Sender: TObject);
begin
  if dlgOpen.Execute
    then LoadXML(dlgOpen.FileName);
end;

function TfMain.UpdateHeader(NIF: Integer; FiscalYear: Word; EndPeriod: TDateTime; NoStock: Boolean): IStockView;
const
  cNoStock: array [Boolean] of string = ('Não', 'Sim');
begin
  lblEdTaxRegistrationNumber.Caption := NIF.ToString;
  lblEdFiscalYear.Caption            := FiscalYear.ToString;
  lblEdEndDate.Caption               := DateTimeToStr(EndPeriod);
  lblEdNoStock.Caption               := cNoStock[NoStock];
end;

procedure TfMain.LoadXML(Filename: string);
begin
  sbMain.Panels[cStockFile].Text := Filename;
  TStockFile.New(
    Self,
    FileName,
    TMatrix<string>.New
  )
    .Open;
end;

end.
