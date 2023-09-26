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
unit uRscPix.PSP;
interface
  uses
    System.Classes,
    uRscPix.Tipos;
type
  TEndPoint = class(TPersistent)
  private
    FPixPut: string;
    FPixGetCP: string;
    FCobPut: string;
    FCobGet: string;
    FPixGetCD: string;
    FPixGetCPR: string;
    FCobPatch: string;
    FLocPost: string;
    FLocGetGQL: string;
    FLocDelete: string;
    FLocIdGet: string;
    FLocGet: string;
    FCobvPut: string;
    FCobvGet: string;
    FCobvEmvPut: string;
    FCobvPatch: string;
    FCobEmvPostS: string;
    FCobPost: string;
    FCobEmvPut: string;
    FCobGetS: string;
    FCobPostS: string;
    FWebhookPost: string;
    FWebhookPut: string;
    FWebhookGet: string;
    FWebhookDelete: string;
    FWebhookGetCWC: string;
    procedure SetCobGet(const Value: string);
    procedure SetCobPatch(const Value: string);
    procedure SetCobPut(const Value: string);
    procedure SetPixGetCD(const Value: string);
    procedure SetPixGetCP(const Value: string);
    procedure SetPixGetCPR(const Value: string);
    procedure SetPixPut(const Value: string);
    procedure SetLocDelete(const Value: string);
    procedure SetLocGet(const Value: string);
    procedure SetLocGetGQL(const Value: string);
    procedure SetLocIdGet(const Value: string);
    procedure SetLocPost(const Value: string);
    procedure SetCobvEmvPut(const Value: string);
    procedure SetCobvGet(const Value: string);
    procedure SetCobvPatch(const Value: string);
    procedure SetCobvPut(const Value: string);
    procedure SetCobEmvPostS(const Value: string);
    procedure SetCobEmvPut(const Value: string);
    procedure SetCobPost(const Value: string);
    procedure SetCobGetS(const Value: string);
    procedure SetCobPostS(const Value: string);
    procedure SetWebhookDelete(const Value: string);
    procedure SetWebhookGet(const Value: string);
    procedure SetWebhookGetCWC(const Value: string);
    procedure SetWebhookPost(const Value: string);
    procedure SetWebhookPut(const Value: string);
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    property CobPut         : string read FCobPut         write SetCobPut;
    property CobEmvPut      : string read FCobEmvPut      write SetCobEmvPut;
    property CobPatch       : string read FCobPatch       write SetCobPatch;
    property CobGet         : string read FCobGet         write SetCobGet;
    property CobPost        : string read FCobPost        write SetCobPost;
    property CobPostS       : string read FCobPostS       write SetCobPostS;
    property CobEmvPostS    : string read FCobEmvPostS    write SetCobEmvPostS;
    property CobGetS        : string read FCobGetS        write SetCobGetS;

    property CobvPut        : string read FCobvPut        write SetCobvPut;
    property CobvEmvPut     : string read FCobvEmvPut     write SetCobvEmvPut;
    property CobvPatch      : string read FCobvPatch      write SetCobvPatch;
    property CobvGet        : string read FCobvGet        write SetCobvGet;

    property LocPost        : string read FLocPost        write SetLocPost;
    property LocGet         : string read FLocGet         write SetLocGet;
    property LocIdGet       : string read FLocIdGet       write SetLocIdGet;
    property LocDelete      : string read FLocDelete      write SetLocDelete;
    property LocGetGQL      : string read FLocGetGQL      write SetLocGetGQL;

    property PixPut         : string read FPixPut         write SetPixPut;
    property PixGetCPR      : string read FPixGetCPR      write SetPixGetCPR;
    property PixGetCP       : string read FPixGetCP       write SetPixGetCP;
    property PixGetCD       : string read FPixGetCD       write SetPixGetCD;

    property WebhookPut     : string read FWebhookPut     write SetWebhookPut;
    property WebhookPost    : string read FWebhookPost    write SetWebhookPost;
    property WebhookGet     : string read FWebhookGet     write SetWebhookGet;
    property WebhookDelete  : string read FWebhookDelete  write SetWebhookDelete;
    property WebhookGetCWC  : string read FWebhookGetCWC  write SetWebhookGetCWC;

  published
    { published declarations }
  end;

  TTPSP = class(TPersistent)
    private
      FTipoPsp: TTipoPSP;
      FTipoPspAmbiente: TTipoAmbiente;
      FUrlToken: string;
      FUrlHostCert: string;
      FUrlApi: string;
      FEndPoints: TEndPoint;
    FScopePix: string;
      procedure SetTipoPsp(const Value: TTipoPSP);
      procedure SetTipoPspAmbiente(const Value: TTipoAmbiente);
      procedure SetUrlApi(const Value: string);
      procedure SetUrlHostCert(const Value: string);
      procedure SetUrlToken(const Value: string);
      procedure SetConfigUrls;
      procedure SetEndPoints(const Value: TEndPoint);
    procedure SetScopePix(const Value: string);
    public
      property UrlToken         : string  read FUrlToken        write SetUrlToken;
      property UrlApi           : string  read FUrlApi          write SetUrlApi;
      property UrlHostCert      : string  read FUrlHostCert     write SetUrlHostCert;
      property EndPoints        : TEndPoint read FEndPoints     write SetEndPoints;
      property ScopePix         : string read FScopePix         write SetScopePix;


      Constructor Create;
      Destructor  Destroy;  Override;
    published
      property TipoPsp          : TTipoPSP      read FTipoPsp         write SetTipoPsp;
      property TipoPspAmbiente  : TTipoAmbiente read FTipoPspAmbiente write SetTipoPspAmbiente;
  End;
implementation


{ TTPSP }

constructor TTPSP.Create;
begin
  FEndPoints  :=  TEndPoint.Create;
end;

destructor TTPSP.Destroy;
begin
  FEndPoints.DisposeOf;
  inherited;
end;

procedure TTPSP.SetConfigUrls;
begin
  case TipoPsp of

    pspSicredi:
      begin
        case TipoPspAmbiente of
          taSandBox:
            begin
              URLToken                  :=  'https://api-pix-h.sicredi.com.br/oauth/token?grant_type=client_credentials&scope=cob.write+cob.read+webhook.read+webhook.write+pix.read+pix.write';
              FURLAPI                   :=  'https://api-pix-h.sicredi.com.br/api/v2';
              FUrlHostCert              :=  'https://api-pix-h.sicredi.com.br';
              FScopePix                 :=  '';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';
            end;

          taHomologacao:
            begin
              FURLToken                 :=  'https://api-pix-h.sicredi.com.br/oauth/token?grant_type=client_credentials&scope=cob.write+cob.read+webhook.read+webhook.write+pix.read+pix.write';
              FURLAPI                   :=  'https://api-pix-h.sicredi.com.br/api/v2';
              FUrlHostCert              :=  'https://api-pix-h.sicredi.com.br';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';
            end;

          taProducao:
            begin
              FURLToken                 :=  'https://api-pix.sicredi.com.br/oauth/token?grant_type=client_credentials&scope=cob.write+cob.read+webhook.read+webhook.write+pix.read+pix.write';  // 'https://api-pix.sicredi.com.br/v2/oauth/token';
              FURLAPI                   :=  'https://api-pix.sicredi.com.br/api/v2';
              FUrlHostCert              :=  'https://api-pix.sicredi.com.br';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';
            end;
        end;
      end;

    pspBancoDoBrasil:
      begin
        case TipoPspAmbiente of
          taSandBox:
            begin
              FURLToken                 :=  'https://oauth.sandbox.bb.com.br/oauth/token';
              FURLAPI                   :=  'https://api.sandbox.bb.com.br/pix/v1';
              FUrlHostCert              :=  '';

              FEndPoints.CobPut         :=  '/cobqrcode/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';
            end;

          taHomologacao:
            begin
              FURLToken                 :=  'https://oauth.hm.bb.com.br/oauth/token';
              FURLAPI                   :=  'https://api.hm.bb.com.br/pix/v1';
              FUrlHostCert              :=  '';

              FEndPoints.CobPut         :=  '/cobqrcode/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';
            end;

          taProducao:
            begin
              FURLToken                 :=  'https://oauth.bb.com.br/oauth/token';
              FURLAPI                   :=  'https://api.bb.com.br/pix/v1';
              FUrlHostCert              :=  '';

              FEndPoints.CobPut         :=  '/cobqrcode/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';
            end;
        end;
      end;

    pspBradesco:
      begin
        case TipoPspAmbiente of
          taSandBox:
            begin
              FURLToken                 :=  'https://qrpix-h.bradesco.com.br/oauth/token';
              FURLAPI                   :=  'https://qrpix-h.bradesco.com.br/v2';
              FUrlHostCert              :=  'https://qrpix-h.bradesco.com.br';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobEmvPut      :=  '/cob-emv/{txid}';
              FEndPoints.CobPostS       :=  '/cob';
              FEndPoints.CobEmvPostS    :=  '/cob-emv';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';
              FEndPoints.CobGetS        :=  '/cob';

              FEndPoints.CobvPut        :=  '/cobv/{txid}';
              FEndPoints.CobvEmvPut     :=  '/cobv-emv/{txid}';
              FEndPoints.CobvPatch      :=  '/cobv/{txid}';
              FEndPoints.CobvGet        :=  '/cobv/{txid}';

              FEndPoints.LocPost        :=  '/loc';
              FEndPoints.LocGet         :=  '/loc';
              FEndPoints.LocIdGet       :=  '/loc/{locId}'; //{id}
              FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode'; //{id}
              FEndPoints.LocDelete      :=  '/loc/{locId}/{txid}'; //{id}

              FEndPoints.PixPut         :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.PixGetCD       :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.PixGetCP       :=  '/pix/{e2eid}';
              FEndPoints.PixGetCPR      :=  '/pix';

              FEndPoints.WebhookPut     :=  '/webhook/{chave}';
              FEndPoints.WebhookPost    :=  '{$request.body#/webhookUrl}/pix';
              FEndPoints.WebhookGet     :=  '/webhook/{chave}';
              FEndPoints.WebhookDelete  :=  '/webhook/{chave}';
              FEndPoints.WebhookGetCWC  :=  '/webhook';
            end;

          taHomologacao:
            begin
              FURLToken                 :=  'https://qrpix-h.bradesco.com.br/oauth/token';
              FURLAPI                   :=  'https://qrpix-h.bradesco.com.br/v2';
              FUrlHostCert              :=  'https://qrpix-h.bradesco.com.br';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';

              FEndPoints.LocGet         :=  '/loc';
              FEndPoints.LocIdGet       :=  '/loc/{locId}';
              FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
              FEndPoints.LocDelete      :=  '/loc/{locId}/{txid}';
              FEndPoints.LocPost        :=  '/loc';
            end;

          taProducao:
            begin
              FURLToken                 :=  'https://qrpix.bradesco.com.br/oauth/token';
              FURLAPI                   :=  'https://qrpix.bradesco.com.br/v2';
              FUrlHostCert              :=  'https://qrpix.bradesco.com.br';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';

              FEndPoints.LocGet         :=  '/loc';
              FEndPoints.LocIdGet       :=  '/loc/{locId}';
              FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
              FEndPoints.LocDelete      :=  '/loc/{locId}/{txid}';
              FEndPoints.LocPost        :=  '/loc';
            end;
        end;
      end;

    pspSantander:
      begin
        case TipoPspAmbiente of
          taSandBox:
            begin
              FURLToken                 :=  'https://pix.santander.com.br/sandbox/oauth/token';
              FURLAPI                   :=  'https://pix.santander.com.br/api/v1/sandbox';
              FUrlHostCert              :=  'https://trust-pix-h.santander.com.br';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';
            end;

          taHomologacao:
            begin
              FURLToken                 :=  'https://trust-pix-h.santander.com.br/oauth/token';
              FURLAPI                   :=  'https://trust-pix-h.santander.com.br/api/v1';
              FUrlHostCert              :=  'https://trust-pix-h.santander.com.br';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';
            end;

          taProducao:
            begin
              FURLToken                 :=  'https://trust-pix.santander.com.br/oauth/token';
              FURLAPI                   :=  'https://trust-pix.santander.com.br/api/v1';
              FUrlHostCert              :=  'https://trust-pix.santander.com.br';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';
            end;
        end;
      end;

    pspSicoob:
      begin
        case TipoPspAmbiente of
          taSandBox:
            begin
              FURLToken                 :=  'https://api-homol.sicoob.com.br/cooperado/pix/token';
              FURLAPI                   :=  'https://api-homol.sicoob.com.br/cooperado/pix/api/v2';
              FUrlHostCert              :=  'https://api-homol.sicoob.com.br';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';
            end;

          taHomologacao:
            begin
              FURLToken                 :=  'https://api-homol.sicoob.com.br/cooperado/pix/token';
              FURLAPI                   :=  'https://api-homol.sicoob.com.br/cooperado/pix/api/v2';
              FUrlHostCert              :=  'https://api-homol.sicoob.com.br';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';
            end;

          taProducao:
            begin
              FURLToken                 :=  'https://auth.sicoob.com.br/auth/realms/cooperado/protocol/openid-connect/token';
              FURLAPI                   :=  'https://apis.sicoob.com.br/cooperado/pix/api/v2';
              FUrlHostCert              :=  'https://apis.sicoob.com.br';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';
            end;
        end;
      end;

    pspGerencianet:
      begin
        case TipoPspAmbiente of
          taSandBox:
            begin
              FURLToken                 :=  'https://api-pix-h.gerencianet.com.br/oauth/token';
              FURLAPI                   :=  'https://api-pix-h.gerencianet.com.br/v2';
              FUrlHostCert              :=  'https://api-pix-h.gerencianet.com.br';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';

              FEndPoints.LocGet         :=  '/loc';
              FEndPoints.LocIdGet       :=  '/loc/{locId}';
              FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
              FEndPoints.LocDelete      :=  '/loc/{locId}/{txid}';
              FEndPoints.LocPost        :=  '/loc';
            end;

          taHomologacao:
            begin
              FURLToken                 :=  'https://api-pix-h.gerencianet.com.br/oauth/token';
              FURLAPI                   :=  'https://api-pix-h.gerencianet.com.br/v2';
              FUrlHostCert              :=  'https://api-pix-h.gerencianet.com.br';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';

              FEndPoints.LocGet         :=  '/loc';
              FEndPoints.LocIdGet       :=  '/loc/{locId}';
              FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
              FEndPoints.LocDelete      :=  '/loc/{locId}/{txid}';
              FEndPoints.LocPost        :=  '/loc';
            end;

          taProducao:
            begin
              FURLToken                 :=  'https://api-pix.gerencianet.com.br/oauth/token';
              FURLAPI                   :=  'https://api-pix.gerencianet.com.br/v2';
              FUrlHostCert              :=  'https://api-pix.gerencianet.com.br';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';

              FEndPoints.LocGet         :=  '/loc';
              FEndPoints.LocIdGet       :=  '/loc/{locId}';
              FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
              FEndPoints.LocDelete      :=  '/loc/{locId}/{txid}';
              FEndPoints.LocPost        :=  '/loc';
            end;
        end;
      end;

    pspPagSeguro:
      begin
        case TipoPspAmbiente of
          taSandBox:
            begin
              FURLToken                 :=  'https://secure.sandbox.api.pagseguro.com/pix/oauth2';
              FURLAPI                   :=  'https://secure.sandbox.api.pagseguro.com/instant-payments';
              FUrlHostCert              :=  'https://secure.sandbox.api.pagseguro.com';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';

              FEndPoints.LocGet         :=  '/loc';
              FEndPoints.LocIdGet       :=  '/loc/{locId}';
              FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
              FEndPoints.LocDelete      :=  '/loc/{locId}/{txid}';
              FEndPoints.LocPost        :=  '/loc';
            end;

          taHomologacao:
            begin
              FURLToken                 :=  'https://secure.sandbox.api.pagseguro.com/pix/oauth2';
              FURLAPI                   :=  'https://secure.sandbox.api.pagseguro.com/instant-payments';
              FUrlHostCert              :=  'https://secure.sandbox.api.pagseguro.com';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';

              FEndPoints.LocGet         :=  '/loc';
              FEndPoints.LocIdGet       :=  '/loc/{locId}';
              FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
              FEndPoints.LocDelete      :=  '/loc/{locId}/{txid}';
              FEndPoints.LocPost        :=  '/loc';
            end;

          taProducao:
            begin
              FURLToken                 :=  'https://secure.api.pagseguro.com/pix/oauth2';
              FURLAPI                   :=  'https://secure.api.pagseguro.com/instant-payments';
              FUrlHostCert              :=  'https://secure.api.pagseguro.com';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';

              FEndPoints.LocGet         :=  '/loc';
              FEndPoints.LocIdGet       :=  '/loc/{locId}';
              FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
              FEndPoints.LocDelete      :=  '/loc/{locId}/{txid}';
              FEndPoints.LocPost        :=  '/loc';
            end;
        end;
      end;

    pspItau:
      begin
        case TipoPspAmbiente of
          taSandBox:
            begin
              FURLToken                 :=  'https://devportal.itau.com.br/api/jwt/as/token.oauth2';
              FURLAPI                   :=  'https://devportal.itau.com.br/sandboxapi/pix_recebimentos_ext_v2/v2';
              FUrlHostCert              :=  'https://devportal.itau.com.br/sandboxapi/seguranca/v1/certificado';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';

              FEndPoints.LocGet         :=  '/loc';
              FEndPoints.LocIdGet       :=  '/loc/{locId}';
              FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
              FEndPoints.LocDelete      :=  '/loc/{locId}/{txid}';
              FEndPoints.LocPost        :=  '/loc';
            end;

          taHomologacao:
            begin
              FURLToken                 :=  'https://devportal.itau.com.br/api/jwt/as/token.oauth2';
              FURLAPI                   :=  'https://devportal.itau.com.br/sandboxapi/pix_recebimentos_ext_v2/v2';
              FUrlHostCert              :=  'https://devportal.itau.com.br/sandboxapi/seguranca/v1/certificado';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';

              FEndPoints.LocGet         :=  '/loc';
              FEndPoints.LocIdGet       :=  '/loc/{locId}';
              FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
              FEndPoints.LocDelete      :=  '/loc/{locId}/{txid}';
              FEndPoints.LocPost        :=  '/loc';
            end;

          taProducao:
            begin
              FURLToken                 :=  'https://sts.itau.com.br/as/token.oauth2';
              FURLAPI                   :=  'https://secure.api.itau/pix_recebimentos/v2';
              FUrlHostCert              :=  'https://secure.api.itau/seguranca/v1/certificado';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';

              FEndPoints.LocGet         :=  '/loc';
              FEndPoints.LocIdGet       :=  '/loc/{locId}';
              FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
              FEndPoints.LocDelete      :=  '/loc/{locId}/{txid}';
              FEndPoints.LocPost        :=  '/loc';
            end;
        end;
      end;

    pspInter:
      begin
        case TipoPspAmbiente of
          taSandBox:
            begin
              FURLToken                 :=  'https://cdpj.partners.bancointer.com.br/oauth/v2/token';
              FURLAPI                   :=  'https://cdpj.partners.bancointer.com.br/pix/v2';
              FUrlHostCert              :=  'https://cdpj.partners.bancointer.com.br';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';

              FEndPoints.LocGet         :=  '/loc';
              FEndPoints.LocIdGet       :=  '/loc/{locId}';
              FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
              FEndPoints.LocDelete      :=  '/loc/{locId}/{txid}';
              FEndPoints.LocPost        :=  '/loc';
            end;

          taHomologacao:
            begin
              FURLToken                 :=  'https://cdpj.partners.bancointer.com.br/oauth/v2/token';
              FURLAPI                   :=  'https://cdpj.partners.bancointer.com.br/pix/v2';
              FUrlHostCert              :=  'https://cdpj.partners.bancointer.com.br';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';

              FEndPoints.LocGet         :=  '/loc';
              FEndPoints.LocIdGet       :=  '/loc/{locId}';
              FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
              FEndPoints.LocDelete      :=  '/loc/{locId}/{txid}';
              FEndPoints.LocPost        :=  '/loc';
            end;

          taProducao:
            begin
              FURLToken                 :=  'https://cdpj.partners.bancointer.com.br/oauth/v2/token';
              FURLAPI                   :=  'https://cdpj.partners.bancointer.com.br/pix/v2';
              FUrlHostCert              :=  'https://cdpj.partners.bancointer.com.br';

              FEndPoints.CobPut         :=  '/cob/{txid}';
              FEndPoints.CobPatch       :=  '/cob/{txid}';
              FEndPoints.CobGet         :=  '/cob/{txid}';

              FEndPoints.FPixPut        :=  '/pix/{e2eid}/devolucao/{id}';
              FEndPoints.FPixGetCPR     :=  '/pix';
              FEndPoints.FPixGetCP      :=  '/pix/{e2eid}';
              FEndPoints.FPixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';

              FEndPoints.LocGet         :=  '/loc';
              FEndPoints.LocIdGet       :=  '/loc/{locId}';
              FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
              FEndPoints.LocDelete      :=  '/loc/{locId}/{txid}';
              FEndPoints.LocPost        :=  '/loc';
            end;
        end;
      end;
  end;

end;

procedure TTPSP.SetTipoPsp(const Value: TTipoPSP);
begin
  FTipoPsp := Value;
  SetConfigUrls;
end;

procedure TTPSP.SetTipoPspAmbiente(const Value: TTipoAmbiente);
begin
  FTipoPspAmbiente := Value;
  SetConfigUrls;
end;

procedure TTPSP.SetUrlApi(const Value: string);
begin
  FUrlApi := Value;
end;

procedure TTPSP.SetUrlHostCert(const Value: string);
begin
  FUrlHostCert := Value;
end;

procedure TTPSP.SetUrlToken(const Value: string);
begin
  FUrlToken := Value;
end;


{ TEndPoint }

procedure TEndPoint.SetCobEmvPostS(const Value: string);
begin
  FCobEmvPostS := Value;
end;

procedure TEndPoint.SetCobEmvPut(const Value: string);
begin
  FCobEmvPut := Value;
end;

procedure TEndPoint.SetCobGet(const Value: string);
begin
  FCobGet := Value;
end;

procedure TEndPoint.SetCobGetS(const Value: string);
begin
  FCobGetS := Value;
end;

procedure TEndPoint.SetCobPatch(const Value: string);
begin
  FCobPatch := Value;
end;

procedure TEndPoint.SetCobPost(const Value: string);
begin
  FCobPost := Value;
end;

procedure TEndPoint.SetCobPostS(const Value: string);
begin
  FCobPostS := Value;
end;

procedure TEndPoint.SetCobPut(const Value: string);
begin
  FCobPut := Value;
end;

procedure TEndPoint.SetCobvEmvPut(const Value: string);
begin
  FCobvEmvPut := Value;
end;

procedure TEndPoint.SetCobvGet(const Value: string);
begin
  FCobvGet := Value;
end;

procedure TEndPoint.SetCobvPatch(const Value: string);
begin
  FCobvPatch := Value;
end;

procedure TEndPoint.SetCobvPut(const Value: string);
begin
  FCobvPut := Value;
end;

procedure TEndPoint.SetLocDelete(const Value: string);
begin
  FLocDelete := Value;
end;

procedure TEndPoint.SetLocGet(const Value: string);
begin
  FLocGet := Value;
end;

procedure TEndPoint.SetLocGetGQL(const Value: string);
begin
  FLocGetGQL := Value;
end;

procedure TEndPoint.SetLocIdGet(const Value: string);
begin
  FLocIdGet := Value;
end;

procedure TEndPoint.SetLocPost(const Value: string);
begin
  FLocPost := Value;
end;

procedure TEndPoint.SetPixGetCD(const Value: string);
begin
  FPixGetCD := Value;
end;

procedure TEndPoint.SetPixGetCP(const Value: string);
begin
  FPixGetCP := Value;
end;

procedure TEndPoint.SetPixGetCPR(const Value: string);
begin
  FPixGetCPR := Value;
end;

procedure TEndPoint.SetPixPut(const Value: string);
begin
  FPixPut := Value;
end;

procedure TEndPoint.SetWebhookDelete(const Value: string);
begin
  FWebhookDelete := Value;
end;

procedure TEndPoint.SetWebhookGet(const Value: string);
begin
  FWebhookGet := Value;
end;

procedure TEndPoint.SetWebhookGetCWC(const Value: string);
begin
  FWebhookGetCWC := Value;
end;

procedure TEndPoint.SetWebhookPost(const Value: string);
begin
  FWebhookPost := Value;
end;

procedure TEndPoint.SetWebhookPut(const Value: string);
begin
  FWebhookPut := Value;
end;

procedure TTPSP.SetEndPoints(const Value: TEndPoint);
begin
  FEndPoints := Value;
end;

procedure TTPSP.SetScopePix(const Value: string);
begin
  FScopePix := Value;
end;

end.
