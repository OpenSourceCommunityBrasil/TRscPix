unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  uniGUITypes;

type
  TUniServerModule = class(TUniGUIServerModule)
    procedure UniGUIServerModuleCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure FirstInit; override;
  public
    { Public declarations }
  end;

function UniServerModule: TUniServerModule;

implementation

{$R *.dfm}

uses
  UniGUIVars;

function UniServerModule: TUniServerModule;
begin
  Result:=TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

procedure TUniServerModule.UniGUIServerModuleCreate(Sender: TObject);
begin

  if not DirectoryExists(StartPath+'Uploads') then
     CreateDir(StartPath+'Uploads');

//  UniRoot :=  'C:\0_Componentes_D11\Unigui\FMSoft\Framework\uniGUI\uni-1.90.0.1555\';
//  ExtRoot :=  'C:\0_Componentes_D11\Unigui\FMSoft\Framework\uniGUI\ext-7.4.0\';
end;

initialization
  RegisterServerModuleClass(TUniServerModule);
end.
