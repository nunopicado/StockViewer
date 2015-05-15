program StockViewer;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fMain},
  Stock_1_2 in 'Stock_1_2.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Luna');
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
