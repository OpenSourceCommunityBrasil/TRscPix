program Demo_Pix;

uses
  Vcl.Forms,
  uFrmMain in '..\View\uFrmMain.pas' {FrmMain},
  PIX_Tela in '..\View\PIX_Tela.pas' {frmPIX_Tela},
  configuraserial in '..\View\configuraserial.pas' {frConfiguraSerial};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown :=  True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
