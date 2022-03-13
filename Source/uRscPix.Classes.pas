{=======================================}
{             RSC SISTEMAS              }
{        SOLUÇÕES TECNOLÓGICAS          }
{         rscsistemas.com.br            }
{          +55 92 4141-2737             }
{      contato@rscsistemas.com.br       }
{                                       }
{ Desenvolvidor por:                    }
{   Roniery Santos Cardoso              }
{     ronierys2@hotmail.com             }
{     +55 92 984391279                  }
{                                       }
{                                       }
{ Versão Original RSC SISTEMAS          }
{ Versão: 3.0.0                         }
{                                       }
{ Faça uma  doação:                     }
{ Pix - Email: ronierys2@hotmail.com    }
{ Banco: NuBank                         }
{                                       }
{                                       }
{                                       }
{ Componente TRscPix                    }
{ Componente OpenSource                 }
{ license Apache-2.0                    }
{                                       }
{=======================================}

unit uRscPix.Classes;

interface
  uses
    System.Classes,
    System.SysUtils,

    uRscPix.Certificado, uRscPix.Pix, uRscPix.Desenvolvedor,
    uRscPix.PSP, uRscPix.Pix.Cobranca, uRscPix.Token,
    uRscPix.Calendario, uRscPix.Recebedor, uRscPix.Localizacao,
    uRscPix.Valor, uRscPix.InformacoesAdicionais, uRscPix.Devolucao,
    uRscPix.Pagador, uRscPix.Parametros;


type

  TSeguranca = class(TSecurityConnection)
  end;

  TTitularPix = class(TDadosTitularPix)
  end;

  TDeveloper = class(TDeveloperSettings)
  end;

  TPSP = class(TTPSP)
  end;

  TPixCobranca  = class(TTPixCobranca)
  end;

  TPIXSolicitaDevolocao = class(TPIXParams)
  end;

  TPix_ListPixsRecebPeriodo = class(TPix_GetListPixsRecebPeriodo)
  end;

  TPixCobRevisa = class(TTPixCobranca)
  private
    FStatusRevisa: string;
    procedure SetStatusRevisa(const Value: string);
  public
    property StatusRevisa : string  read FStatusRevisa write SetStatusRevisa;
  end;

  TToken = class(TTToken)
  end;

  TCalendario = class(TTCalendario)
  end;

  TRecebedor = class(TTRecebedor)
  end;

  TLoc = class(TLocalizacao)
  end;

  TValor = class(TTValor)
  end;

  TInfo_Adicionais = class(TInformacoesAdicionais)
  end;

  TDevolucao = class(TTDevolucao)
  end;

  TPagador = class(TTPagador)
  end;

  TRespCobPut = class(TPix_Parametros)
  end;

  TRespCobPatch = class(TPix_Parametros)
  end;

  TRespCobGet = class(TPix_Parametros)
  end;

  TRespPixGet = class(TPix_Get)
  end;

  TRespPixPut = class(TPix_Put)
  end;


//  TRetornoErroBcBR = class
//  private
//    Fmessage: string;
//    Ferror: string;
//    FstatusCode: integer;
//    procedure Seterror(const Value: string);
//    procedure Setmessage(const Value: string);
//    procedure SetstatusCode(const Value: integer);
//  public
//    property statusCode : integer read FstatusCode write SetstatusCode;
//    property error  : string read Ferror write Seterror;
//    property  &message  : string read Fmessage write Setmessage;
//
//  end;
//
//
//
//  TRetornoErro = class(TRetornoErroBcBR)
//    private
//    Fdetail: string;
//    Ftitle: string;
//    Fstatus: string;
//    Ftype: string;
//    procedure Setdetail(const Value: string);
//    procedure Setstatus(const Value: string);
//    procedure Settitle(const Value: string);
//    procedure Settype(const Value: string);
//
//    public
//      property &type : string read Ftype write Settype;
//      property title :  string read Ftitle write Settitle;
//      property status : string read Fstatus write Setstatus;
//      property detail : string read Fdetail write Setdetail;
//  end;


//  TRetornoErroPostToken = class
//    private
//    Ferror: string;
//    Ferror_description: string;
//    procedure Seterror(const Value: string);
//    procedure Seterror_description(const Value: string);
//    public
//      property error  : string read Ferror write Seterror;
//      property error_description  : string read Ferror_description write Seterror_description;
//
//  end;



type
  TOnGetStatusCobranca  = procedure(Sender : TObject; Const sStatus: String = '')  of object;
  TNotifica             = procedure(Sender : TObject; Const Status: String = ''; Erro: String = '')  of object;
  TNotificaToken        = procedure(Sender : TObject; Const Token: TToken = nil; Erro: String = '')  of object;
  TNotificaCobPut       = procedure(Sender : TObject; Const RespCobPut: TRespCobPut = nil; Erro: String = '')  of object;
  TNotificaCobPatch     = procedure(Sender : TObject; Const RespCobPatch: TRespCobPatch = nil; Erro: String = '')  of object;
  TNotificaCobGet       = procedure(Sender : TObject; Const RespCobGet: TRespCobGet = nil; Erro: String = '')  of object;

  TNotificaPixPut       = procedure(Sender : TObject; Const RespPixPut: TRespPixPut = nil; Erro: String = '')  of object;
  TNotificaPixGet       = procedure(Sender : TObject; Const RespPixGet: TRespPixGet = nil; Erro: String = '')  of object;


implementation

{ TRetornoErro }
//
//procedure TRetornoErro.Setdetail(const Value: string);
//begin
//  Fdetail := Value;
//end;
//
//procedure TRetornoErro.Setstatus(const Value: string);
//begin
//  Fstatus := Value;
//end;
//
//procedure TRetornoErro.Settitle(const Value: string);
//begin
//  Ftitle := Value;
//end;
//
//procedure TRetornoErro.Settype(const Value: string);
//begin
//  Ftype := Value;
//end;

{ TRetornoErroBR }

//procedure TRetornoErroBcBR.Seterror(const Value: string);
//begin
//  if Value = 'Not Found' then
//    Ferror  :=  'Não encontrado'
//  else
//    Ferror := Value;
//end;
//
//procedure TRetornoErroBcBR.Setmessage(const Value: string);
//begin
//  if Value = 'Resource not found' then
//    Fmessage  :=  'Recurso não encontrado'
//  else
//    Fmessage := Value;
//end;
//
//procedure TRetornoErroBcBR.SetstatusCode(const Value: integer);
//begin
//  FstatusCode := Value;
//end;

{ TRetornoErroPostToken }
//
//procedure TRetornoErroPostToken.Seterror(const Value: string);
//begin
//  if Value = 'invalid_request' then
//    Ferror  :=  'pedido inválido'
//  else
//    Ferror := Value;
//end;
//
//procedure TRetornoErroPostToken.Seterror_description(const Value: string);
//begin
//  Ferror_description := Value;
//end;


{ TPixCobRevisa }

procedure TPixCobRevisa.SetStatusRevisa(const Value: string);
begin
  if Value = '' then
    raise Exception.Create('Informe o Status para Alteração.')
  else
    FStatusRevisa := Value;
end;

end.
