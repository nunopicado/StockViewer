unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, uStockFile, RO.IMatrix;

type
  TfMain = class(TForm, IStockView)
    grid: TStringGrid;
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
    procedure gridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    const
         cProductCount = 1;
         cStockFile    = 2;
    procedure LoadXML(Filename: String);
  public
    function UpdateHeader(NIF: Integer; FiscalYear: Word; EndPeriod: TDateTime; NoStock: Boolean): IStockView;
    function UpdateData(StockData: IMatrix<String>): IStockView;
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

function TfMain.UpdateData(StockData: IMatrix<String>): IStockView;
var
   Col: Integer;
   Row: Integer;
begin
     grid.ColCount := StockData.ColCount;
     grid.RowCount := StockData.RowCount;
     sbMain.Panels[cProductCount].Text := Pred(StockData.RowCount).ToString + ' artigos inventariados';
     for Col := 0 to Pred(StockData.ColCount) do
         for Row := 0 to Pred(StockData.RowCount) do
             grid.Cells[Col, Row] := StockData.Cell(Col, Row);
end;

procedure TfMain.FormCreate(Sender: TObject);
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
     cNoStock: Array [Boolean] of String = ('Não','Sim');
begin
     lblEdTaxRegistrationNumber.Caption := NIF.ToString;
     lblEdFiscalYear.Caption            := FiscalYear.ToString;
     lblEdEndDate.Caption               := DateTimeToStr(EndPeriod);
     lblEdNoStock.Caption               := cNoStock[NoStock];
end;

procedure TfMain.LoadXML(Filename: String);
begin
     sbMain.Panels[cStockFile].Text := Filename;
     TStockFile.New(
                    Self,
                    FileName,
                    TMatrix<String>.New
                   )
               .Open;
end;

end.
