program StockViewer;

uses
  Vcl.Forms,
  StockViewer.Forms.Main in 'StockViewer.Forms.Main.pas' {fMain},
  Stock_1_2 in 'Stock_1_2.pas',
  Vcl.Themes,
  Vcl.Styles,
  StockViewer.StockFile in 'StockViewer.StockFile.pas',
  SysUtils,
  RO.IMatrix;

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'StockViewer';
  FormatSettings.DecimalSeparator := ',';
  TStyleManager.TrySetStyle('Luna');
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
