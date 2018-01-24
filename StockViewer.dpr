program StockViewer;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fMain},
  Stock_1_2 in 'Stock_1_2.pas',
  Vcl.Themes,
  Vcl.Styles,
  StockViewer.StockFile in 'StockViewer.StockFile.pas',
  RO.IMatrix;

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Luna');
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
