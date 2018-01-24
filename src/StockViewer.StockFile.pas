unit StockViewer.StockFile;

interface

uses
    Stock_1_2
  , RO.IValue
  , Classes
  ;

type
  IStockHeader = interface(IInvokable)
  ['{36D9C270-C8D0-46B0-8E78-5C0EF68B75DA}']
    function TaxRegistrationNumber: Integer;
    function FiscalYear: Integer;
    function EndDate: TDateTime;
    function NoStock: Boolean;
  end;

  IStockData = interface(IInvokable)
  ['{3B6C0BBC-C900-4E28-A604-4B881328D1AD}']
    function Fields: string;
    function Content: TStrings;
  end;

  IStockFile = interface(IInvokable)
  ['{E4A04C2A-90C0-4C18-974D-707F521DC9A7}']
    function Header: IStockHeader;
    function Data: IStockData;
  end;

  TStockFile = class(TInterfacedObject, IStockFile)
  private var
    FXml    : IXMLStockFile;
    FHeader : IStockHeader;
    FData   : IStockData;
  public
    constructor Create(const StockFile: string); reintroduce;
    class function New(const StockFile: string): IStockFile;
    function Header: IStockHeader;
    function Data: IStockData;
  end;

  TStockHeader = class(TInterfacedObject, IStockHeader)
  private
    FHeaderNode: IXMLStockHeader;
  public
    constructor Create(const HeaderNode: IXMLStockHeader); reintroduce;
    class function New(const HeaderNode: IXMLStockHeader): IStockHeader;
    function TaxRegistrationNumber: Integer;
    function FiscalYear: Integer;
    function EndDate: TDateTime;
    function NoStock: Boolean;
  end;

  TStockData = class(TInterfacedObject, IStockData)
  private
    FStockNode: IXMLStockList;
    FContent: IValue<TStrings>;
  public
    constructor Create(const StockNode: IXMLStockList); reintroduce;
    destructor Destroy; override;
    class function New(const StockNode: IXMLStockList): IStockData;
    function Fields: string;
    function Content: TStrings;
  end;

implementation

uses
    SysUtils
  , RO.TValue
  , Variants
  ;

{ TStockFile }

constructor TStockFile.Create(const StockFile: string);
begin
  FXml := LoadStockFile(StockFile);
  if FXml.Stock.ChildNodes.Count > 0
    then FHeader := TStockHeader.New(FXml.StockHeader);
  if FXml.Stock.ChildNodes.Count > 1
    then FData := TStockData.New(FXml.Stock);
end;

function TStockFile.Data: IStockData;
begin
  Result := FData;
end;

function TStockFile.Header: IStockHeader;
begin
  Result := FHeader;
end;

class function TStockFile.New(const StockFile: string): IStockFile;
begin
  Result := Create(StockFile);
end;

{ TStockHeader }

constructor TStockHeader.Create(const HeaderNode: IXMLStockHeader);
begin
  FHeaderNode := HeaderNode;
end;

function TStockHeader.EndDate: TDateTime;
begin
  Result := VarToDateTime(FHeaderNode.EndDate);
end;

function TStockHeader.FiscalYear: Integer;
begin
  Result := FHeaderNode.FiscalYear;
end;

class function TStockHeader.New(const HeaderNode: IXMLStockHeader): IStockHeader;
begin
  Result := Create(HeaderNode);
end;

function TStockHeader.NoStock: Boolean;
begin
  Result := FHeaderNode.NoStock;
end;

function TStockHeader.TaxRegistrationNumber: Integer;
begin
  Result := FHeaderNode.TaxRegistrationNumber;
end;

{ TStockData }

function TStockData.Content: TStrings;
begin
  Result := FContent.Value;
end;

constructor TStockData.Create(const StockNode: IXMLStockList);
begin
  FStockNode := StockNode;
  FContent   := TValue<TStrings>.New(
    function : TStrings
    var
      i: Integer;
    begin
      Result := TStringList.Create;
      for i := 0 to Pred(StockNode.Count) do
        with StockNode[i] do
          Result.Add(
            '"' + ProductCategory + '";' +
            '"' + ProductCode + '";' +
            '"' + ProductDescription + '";' +
            '"' + ProductNumberCode + '";' +
                  ClosingStockQuantity + ';' +
            '"' + UnitOfMeasure + '"'
          );
    end
  );
end;

destructor TStockData.Destroy;
begin
  if Assigned(FContent.Value)
    then FContent.Value.Free;
  inherited;
end;

function TStockData.Fields: string;
var
  i: Byte;
begin
  Result := '';
  for i := 0 to Pred(FStockNode.ChildNodes[1].ChildNodes.Count) do
    begin
      if i > 0
        then Result := Result + ';';
      Result := Result + FStockNode.ChildNodes[1].ChildNodes[i].NodeName.Substring(3);
    end;
end;

class function TStockData.New(const StockNode: IXMLStockList): IStockData;
begin
  Result := Create(StockNode);
end;

end.
