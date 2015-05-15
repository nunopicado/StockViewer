unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfMain = class(TForm)
    grid: TStringGrid;
    dlgOpen: TOpenDialog;
    sbMain: TStatusBar;
    pnlHeader: TPanel;
    Label1: TLabel;
    lblEdNIF: TLabel;
    Label2: TLabel;
    lblEdAnoFiscal: TLabel;
    Label3: TLabel;
    lblEdData: TLabel;
    Label4: TLabel;
    lblEdNoStock: TLabel;
    procedure gridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure LoadXML(Filename: String);
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

uses
    Stock_1_2;

{$R *.dfm}

procedure TfMain.FormCreate(Sender: TObject);
begin
     if (ParamCount = 1) and (FileExists(ParamStr(1)))
        then LoadXML(ParamStr(1));

     dlgOpen.Filter := 'Ficheiro XML de inventários v1.02|*.xml';
     sbMain.Panels[1].Text := '';
     sbMain.Panels[2].Text := '';

     lblEdNIF.Caption       := '';
     lblEdAnoFiscal.Caption := '';
     lblEdData.Caption      := '';
     lblEdNoStock.Caption   := '';

     grid.RowCount := 2;
     grid.Cells[0,0] := 'Categoria';
     grid.Cells[1,0] := 'Código';
     grid.Cells[2,0] := 'Descrição';
     grid.Cells[3,0] := 'Cód. Barras';
     grid.Cells[4,0] := 'Quantidade';
     grid.Cells[5,0] := 'Unidade';
end;

procedure TfMain.gridDblClick(Sender: TObject);
begin
     if dlgOpen.Execute
        then LoadXML(dlgOpen.FileName);
end;

procedure TfMain.LoadXML(Filename: String);
const
     NoStock: Array [Boolean] of String = ('Não','Sim');
var
   xml: IXMLStockFile;
   i: Integer;
begin
     xml := LoadStockFile (Filename);

     grid.RowCount := xml.Stock.Count + 1;

     for i := 0 to xml.Stock.Count-1 do
         begin
              grid.Cells[0,i+1] := xml.Stock[i].ProductCategory;
              grid.Cells[1,i+1] := xml.Stock[i].ProductCode;
              grid.Cells[2,i+1] := xml.Stock[i].ProductDescription;
              grid.Cells[3,i+1] := xml.Stock[i].ProductNumberCode;
              grid.Cells[4,i+1] := xml.Stock[i].ClosingStockQuantity;
              grid.Cells[5,i+1] := xml.Stock[i].UnitOfMeasure;
         end;

     lblEdNIF.Caption       := IntToStr(xml.StockHeader.TaxRegistrationNumber);
     lblEdAnoFiscal.Caption := IntToStr(xml.StockHeader.FiscalYear);
     lblEdData.Caption      := xml.StockHeader.EndDate;
     lblEdNoStock.Caption   := NoStock[xml.StockHeader.NoStock];

     sbMain.Panels[1].Text := IntToStr(xml.Stock.Count) + ' artigos inventariados';
     sbMain.Panels[2].Text := Filename;
end;

end.
