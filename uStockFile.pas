unit uStockFile;

interface

uses
    Stock_1_2
  , Obj.SSI.IMatrix
  ;

type
    IStockView = Interface
      function UpdateHeader(NIF: Integer; FiscalYear: Word; EndPeriod: TDateTime; NoStock: Boolean): IStockView;
      function UpdateData(StockData: IMatrix<String>): IStockView;
    End;

    IStockFile = Interface
      function Open: IStockFile;
    End;

    TStockFile = Class(TInterfacedObject, IStockFile)
    private
      FView : IStockView;
      FXml  : IXMLStockFile;
      FData : IMatrix<String>;
      constructor Create(StockView: IStockView; StockFile: String; Data : IMatrix<String>);
      procedure Header;
      procedure Data;
    public
      class function New(StockView: IStockView; StockFile: String; Data : IMatrix<String>): IStockFile;
      function Open: IStockFile;
    End;

implementation

uses
    SysUtils
  ;

{ TStockFile }

constructor TStockFile.Create(StockView: IStockView; StockFile: String; Data : IMatrix<String>);
begin
     FView := StockView;
     FXml  := LoadStockFile(StockFile);
     FData := Data.Resize(
                          FXml.Stock.ChildNodes[1].ChildNodes.Count,
                          FXml.Stock.Count + 1
                         );
end;

procedure TStockFile.Data;
var
   i: Integer;
begin
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
                             StrToDate(EndDate),
                             NoStock
                            );
end;

class function TStockFile.New(StockView: IStockView; StockFile: String; Data : IMatrix<String>): IStockFile;
begin
     Result := Create(StockView, StockFile, Data);
end;

function TStockFile.Open: IStockFile;
begin
     Header;
     Data;
end;

end.
