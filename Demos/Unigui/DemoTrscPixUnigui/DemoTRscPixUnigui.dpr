program DemoTRscPixUnigui;

uses
  Forms,
  ServerModule in 'Surce\Modules\ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'Surce\Modules\MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Surce\View\Main.pas' {MainForm: TUniForm},
  uRsc.funcoes in 'Surce\Extra\uRsc.funcoes.pas',
  DelphiZXIngQRCode in 'Surce\Extra\DelphiZXIngQRCode.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
