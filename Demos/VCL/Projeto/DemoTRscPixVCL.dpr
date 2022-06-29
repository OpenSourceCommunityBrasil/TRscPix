program DemoTRscPixVCL;
uses
  Vcl.Forms,
  uFrmMain in '..\View\uFrmMain.pas' {FrmMain},
  uRsc.funcoes in '..\Extra\uRsc.funcoes.pas';

{$R *.res}
begin
  ReportMemoryLeaksOnShutdown :=  True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
