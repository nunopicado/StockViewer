
{*******************************************************************************************}
{                                                                                           }
{                                     XML Data Binding                                      }
{                                                                                           }
{         Generated on: 2015-01-07 13:10:05                                                 }
{       Generated from: E:\Dropbox\Delphi\nPOSitivo\Certificação\Inventario\Stock_1_2.xsd   }
{   Settings stored in: E:\Dropbox\Delphi\nPOSitivo\Certificação\Inventario\Stock_1_2.xdb   }
{                                                                                           }
{*******************************************************************************************}

unit Stock_1_2;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLStockFile = interface;
  IXMLStockHeader = interface;
  IXMLStock = interface;
  IXMLStockList = interface;

{ IXMLStockFile }

  IXMLStockFile = interface(IXMLNode)
    ['{B745AE4E-F689-4562-8B0F-C57A45BCAD71}']
    { Property Accessors }
    function Get_StockHeader: IXMLStockHeader;
    function Get_Stock: IXMLStockList;
    { Methods & Properties }
    property StockHeader: IXMLStockHeader read Get_StockHeader;
    property Stock: IXMLStockList read Get_Stock;
  end;

{ IXMLStockHeader }

  IXMLStockHeader = interface(IXMLNode)
    ['{2821C7B7-19D5-4F8D-B34D-A817995A892C}']
    { Property Accessors }
    function Get_FileVersion: UnicodeString;
    function Get_TaxRegistrationNumber: Integer;
    function Get_FiscalYear: Integer;
    function Get_EndDate: UnicodeString;
    function Get_NoStock: Boolean;
    procedure Set_FileVersion(Value: UnicodeString);
    procedure Set_TaxRegistrationNumber(Value: Integer);
    procedure Set_FiscalYear(Value: Integer);
    procedure Set_EndDate(Value: UnicodeString);
    procedure Set_NoStock(Value: Boolean);
    { Methods & Properties }
    property FileVersion: UnicodeString read Get_FileVersion write Set_FileVersion;
    property TaxRegistrationNumber: Integer read Get_TaxRegistrationNumber write Set_TaxRegistrationNumber;
    property FiscalYear: Integer read Get_FiscalYear write Set_FiscalYear;
    property EndDate: UnicodeString read Get_EndDate write Set_EndDate;
    property NoStock: Boolean read Get_NoStock write Set_NoStock;
  end;

{ IXMLStock }

  IXMLStock = interface(IXMLNode)
    ['{3B92BA26-014A-44B5-9E6B-F23526A387FD}']
    { Property Accessors }
    function Get_ProductCategory: UnicodeString;
    function Get_ProductCode: UnicodeString;
    function Get_ProductDescription: UnicodeString;
    function Get_ProductNumberCode: UnicodeString;
    function Get_ClosingStockQuantity: UnicodeString;
    function Get_UnitOfMeasure: UnicodeString;
    procedure Set_ProductCategory(Value: UnicodeString);
    procedure Set_ProductCode(Value: UnicodeString);
    procedure Set_ProductDescription(Value: UnicodeString);
    procedure Set_ProductNumberCode(Value: UnicodeString);
    procedure Set_ClosingStockQuantity(Value: UnicodeString);
    procedure Set_UnitOfMeasure(Value: UnicodeString);
    { Methods & Properties }
    property ProductCategory: UnicodeString read Get_ProductCategory write Set_ProductCategory;
    property ProductCode: UnicodeString read Get_ProductCode write Set_ProductCode;
    property ProductDescription: UnicodeString read Get_ProductDescription write Set_ProductDescription;
    property ProductNumberCode: UnicodeString read Get_ProductNumberCode write Set_ProductNumberCode;
    property ClosingStockQuantity: UnicodeString read Get_ClosingStockQuantity write Set_ClosingStockQuantity;
    property UnitOfMeasure: UnicodeString read Get_UnitOfMeasure write Set_UnitOfMeasure;
  end;

{ IXMLStockList }

  IXMLStockList = interface(IXMLNodeCollection)
    ['{19AAA264-1334-438D-A153-87F34221B7CF}']
    { Methods & Properties }
    function Add: IXMLStock;
    function Insert(const Index: Integer): IXMLStock;

    function Get_Item(Index: Integer): IXMLStock;
    property Items[Index: Integer]: IXMLStock read Get_Item; default;
  end;

{ Forward Decls }

  TXMLStockFile = class;
  TXMLStockHeader = class;
  TXMLStock = class;
  TXMLStockList = class;

{ TXMLStockFile }

  TXMLStockFile = class(TXMLNode, IXMLStockFile)
  private
    FStock: IXMLStockList;
  protected
    { IXMLStockFile }
    function Get_StockHeader: IXMLStockHeader;
    function Get_Stock: IXMLStockList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLStockHeader }

  TXMLStockHeader = class(TXMLNode, IXMLStockHeader)
  protected
    { IXMLStockHeader }
    function Get_FileVersion: UnicodeString;
    function Get_TaxRegistrationNumber: Integer;
    function Get_FiscalYear: Integer;
    function Get_EndDate: UnicodeString;
    function Get_NoStock: Boolean;
    procedure Set_FileVersion(Value: UnicodeString);
    procedure Set_TaxRegistrationNumber(Value: Integer);
    procedure Set_FiscalYear(Value: Integer);
    procedure Set_EndDate(Value: UnicodeString);
    procedure Set_NoStock(Value: Boolean);
  end;

{ TXMLStock }

  TXMLStock = class(TXMLNode, IXMLStock)
  protected
    { IXMLStock }
    function Get_ProductCategory: UnicodeString;
    function Get_ProductCode: UnicodeString;
    function Get_ProductDescription: UnicodeString;
    function Get_ProductNumberCode: UnicodeString;
    function Get_ClosingStockQuantity: UnicodeString;
    function Get_UnitOfMeasure: UnicodeString;
    procedure Set_ProductCategory(Value: UnicodeString);
    procedure Set_ProductCode(Value: UnicodeString);
    procedure Set_ProductDescription(Value: UnicodeString);
    procedure Set_ProductNumberCode(Value: UnicodeString);
    procedure Set_ClosingStockQuantity(Value: UnicodeString);
    procedure Set_UnitOfMeasure(Value: UnicodeString);
  end;

{ TXMLStockList }

  TXMLStockList = class(TXMLNodeCollection, IXMLStockList)
  protected
    { IXMLStockList }
    function Add: IXMLStock;
    function Insert(const Index: Integer): IXMLStock;

    function Get_Item(Index: Integer): IXMLStock;
  end;

{ Global Functions }

function GetStockFile(Doc: IXMLDocument): IXMLStockFile;
function LoadStockFile(const FileName: string): IXMLStockFile;
function NewStockFile: IXMLStockFile;

const
  TargetNamespace = 'urn:StockFile:PT_1_02';

implementation

{ Global Functions }

function GetStockFile(Doc: IXMLDocument): IXMLStockFile;
begin
  Result := Doc.GetDocBinding('StockFile', TXMLStockFile, TargetNamespace) as IXMLStockFile;
end;

function LoadStockFile(const FileName: string): IXMLStockFile;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('StockFile', TXMLStockFile, TargetNamespace) as IXMLStockFile;
end;

function NewStockFile: IXMLStockFile;
begin
  Result := NewXMLDocument.GetDocBinding('StockFile', TXMLStockFile, TargetNamespace) as IXMLStockFile;
end;

{ TXMLStockFile }

procedure TXMLStockFile.AfterConstruction;
begin
  RegisterChildNode('StockHeader', TXMLStockHeader);
  RegisterChildNode('Stock', TXMLStock);
  FStock := CreateCollection(TXMLStockList, IXMLStock, 'Stock') as IXMLStockList;
  inherited;
end;

function TXMLStockFile.Get_StockHeader: IXMLStockHeader;
begin
  Result := ChildNodes['StockHeader'] as IXMLStockHeader;
end;

function TXMLStockFile.Get_Stock: IXMLStockList;
begin
  Result := FStock;
end;

{ TXMLStockHeader }

function TXMLStockHeader.Get_FileVersion: UnicodeString;
begin
  Result := ChildNodes['FileVersion'].Text;
end;

procedure TXMLStockHeader.Set_FileVersion(Value: UnicodeString);
begin
  ChildNodes['FileVersion'].NodeValue := Value;
end;

function TXMLStockHeader.Get_TaxRegistrationNumber: Integer;
begin
  Result := ChildNodes['TaxRegistrationNumber'].NodeValue;
end;

procedure TXMLStockHeader.Set_TaxRegistrationNumber(Value: Integer);
begin
  ChildNodes['TaxRegistrationNumber'].NodeValue := Value;
end;

function TXMLStockHeader.Get_FiscalYear: Integer;
begin
  Result := ChildNodes['FiscalYear'].NodeValue;
end;

procedure TXMLStockHeader.Set_FiscalYear(Value: Integer);
begin
  ChildNodes['FiscalYear'].NodeValue := Value;
end;

function TXMLStockHeader.Get_EndDate: UnicodeString;
begin
  Result := ChildNodes['EndDate'].Text;
end;

procedure TXMLStockHeader.Set_EndDate(Value: UnicodeString);
begin
  ChildNodes['EndDate'].NodeValue := Value;
end;

function TXMLStockHeader.Get_NoStock: Boolean;
begin
  Result := ChildNodes['NoStock'].NodeValue;
end;

procedure TXMLStockHeader.Set_NoStock(Value: Boolean);
begin
  ChildNodes['NoStock'].NodeValue := Value;
end;

{ TXMLStock }

function TXMLStock.Get_ProductCategory: UnicodeString;
begin
  Result := ChildNodes['ProductCategory'].Text;
end;

procedure TXMLStock.Set_ProductCategory(Value: UnicodeString);
begin
  ChildNodes['ProductCategory'].NodeValue := Value;
end;

function TXMLStock.Get_ProductCode: UnicodeString;
begin
  Result := ChildNodes['ProductCode'].Text;
end;

procedure TXMLStock.Set_ProductCode(Value: UnicodeString);
begin
  ChildNodes['ProductCode'].NodeValue := Value;
end;

function TXMLStock.Get_ProductDescription: UnicodeString;
begin
  Result := ChildNodes['ProductDescription'].Text;
end;

procedure TXMLStock.Set_ProductDescription(Value: UnicodeString);
begin
  ChildNodes['ProductDescription'].NodeValue := Value;
end;

function TXMLStock.Get_ProductNumberCode: UnicodeString;
begin
  Result := ChildNodes['ProductNumberCode'].Text;
end;

procedure TXMLStock.Set_ProductNumberCode(Value: UnicodeString);
begin
  ChildNodes['ProductNumberCode'].NodeValue := Value;
end;

function TXMLStock.Get_ClosingStockQuantity: UnicodeString;
begin
  Result := ChildNodes['ClosingStockQuantity'].Text;
end;

procedure TXMLStock.Set_ClosingStockQuantity(Value: UnicodeString);
begin
  ChildNodes['ClosingStockQuantity'].NodeValue := Value;
end;

function TXMLStock.Get_UnitOfMeasure: UnicodeString;
begin
  Result := ChildNodes['UnitOfMeasure'].Text;
end;

procedure TXMLStock.Set_UnitOfMeasure(Value: UnicodeString);
begin
  ChildNodes['UnitOfMeasure'].NodeValue := Value;
end;

{ TXMLStockList }

function TXMLStockList.Add: IXMLStock;
begin
  Result := AddItem(-1) as IXMLStock;
end;

function TXMLStockList.Insert(const Index: Integer): IXMLStock;
begin
  Result := AddItem(Index) as IXMLStock;
end;

function TXMLStockList.Get_Item(Index: Integer): IXMLStock;
begin
  Result := List[Index] as IXMLStock;
end;

end.