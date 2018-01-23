unit uStockFile;

interface

uses
    Stock_1_2
  , RO.IMatrix
  ;

type
  IStockView = interface
    function UpdateHeader(NIF: Integer; FiscalYear: Word; EndPeriod: TDateTime; NoStock: Boolean): IStockView;
    function UpdateData(StockData: IMatrix<string>): IStockView;
  end;

  IStockFile = interface
    function Open: IStockFile;
  end;

  TStockFile = class(TInterfacedObject, IStockFile)
  private var
    FView : IStockView;
    FXml  : IXMLStockFile;
    FData : IMatrix<string>;
  private
    constructor Create(StockView: IStockView; StockFile: string; Data : IMatrix<string>);
    procedure Header;
    procedure Data;
  public
    class function New(StockView: IStockView; StockFile: string; Data : IMatrix<string>): IStockFile;
    function Open: IStockFile;
  end;

implementation

uses
    SysUtils
  , RO.TMatrix
  , Variants
  ;

{ TStockFile }

constructor TStockFile.Create(StockView: IStockView; StockFile: string; Data : IMatrix<string>);
begin
  FView := StockView;
  FXml  := LoadStockFile(StockFile);
  if FXml.Stock.ChildNodes.Count > 1
    then
      FData := Data.Resize(
        FXml.Stock.ChildNodes[1].ChildNodes.Count,
        FXml.Stock.Count + 1
      );
end;

procedure TStockFile.Data;
var
  i: Integer;
begin
  if FXml.Stock.ChildNodes.Count <= 1
    then Exit;

  for i := 0 to Pred(FXml.Stock.ChildNodes[1].ChildNodes.Count) do
    FData.Edit(i, 0, FXml.Stock.ChildNodes[1].ChildNodes[i].NodeName.Substring(3));
  for i := 0 to Pred(FXml.Stock.Count) do
    with FXml.Stock[i] do
      begin
        FData.Edit(0, Succ(i), ProductCategory);
        FData.Edit(1, Succ(i), ProductCode);
        FData.Edit(2, Succ(i), ProductDescription);
        FData.Edit(3, Succ(i), ProductNumberCode);
        FData.Edit(4, Succ(i), ClosingStockQuantity);
        FData.Edit(5, Succ(i), UnitOfMeasure);
      end;
  FView.UpdateData(FData);
end;

procedure TStockFile.Header;
begin
  with FXml.StockHeader do
    FView.UpdateHeader(
      TaxRegistrationNumber,
      FiscalYear,
      VarToDateTime(EndDate),
      NoStock
    );
end;

class function TStockFile.New(StockView: IStockView; StockFile: string; Data : IMatrix<string>): IStockFile;
begin
  Result := Create(StockView, StockFile, Data);
end;

function TStockFile.Open: IStockFile;
begin
  Header;
  Data;
end;

end.
