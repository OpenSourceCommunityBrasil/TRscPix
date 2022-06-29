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
    FLocPostCLP: string;
    FLocGetGQL: string;
    FLocDeleteDTL: string;
    FLocGetRLP: string;
    FLocGetCLC: string;
    procedure SetCobGet(const Value: string);
    procedure SetCobPatch(const Value: string);
    procedure SetCobPut(const Value: string);
    procedure SetPixGetCD(const Value: string);
    procedure SetPixGetCP(const Value: string);
    procedure SetPixGetCPR(const Value: string);
    procedure SetPixPut(const Value: string);
    procedure SetLocDeleteDTL(const Value: string);
    procedure SetLocGetCLC(const Value: string);
    procedure SetLocGetGQL(const Value: string);
    procedure SetLocGetRLP(const Value: string);
    procedure SetLocPostCLP(const Value: string);
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    property CobPut         : string read FCobPut       write SetCobPut;
    property CobPatch       : string read FCobPatch     write SetCobPatch;
    property CobGet         : string read FCobGet       write SetCobGet;

    property PixGetCPR      : string read FPixGetCPR    write SetPixGetCPR;
    property PixGetCP       : string read FPixGetCP     write SetPixGetCP;
    property PixGetCD       : string read FPixGetCD     write SetPixGetCD;
    property PixPut         : string read FPixPut       write SetPixPut;

    property LocGetCLC      : string read FLocGetCLC    write SetLocGetCLC;
    property LocGetRLP      : string read FLocGetRLP    write SetLocGetRLP;
    property LocGetGQL      : string read FLocGetGQL    write SetLocGetGQL;
    property LocDeleteDTL   : string read FLocDeleteDTL write SetLocDeleteDTL;
    property LocPostCLP     : string read FLocPostCLP   write SetLocPostCLP;

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
      procedure SetTipoPsp(const Value: TTipoPSP);
      procedure SetTipoPspAmbiente(const Value: TTipoAmbiente);
      procedure SetUrlApi(const Value: string);
      procedure SetUrlHostCert(const Value: string);
      procedure SetUrlToken(const Value: string);
      procedure SetConfigUrls;
      procedure SetEndPoints(const Value: TEndPoint);
    public
      property UrlToken         : string  read FUrlToken        write SetUrlToken;
      property UrlApi           : string  read FUrlApi          write SetUrlApi;
      property UrlHostCert      : string  read FUrlHostCert     write SetUrlHostCert;
      property EndPoints        : TEndPoint read FEndPoints write SetEndPoints;


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
  if TipoPspAmbiente = taSandBox then
  begin
    case TipoPsp of
                        {============================================}
      pspSicredi      : begin
                          URLToken              := 'https://api-pix-h.sicredi.com.br/oauth/token';
                          FURLAPI               := 'https://api-pix-h.sicredi.com.br/api/v2';
                          FUrlHostCert          := 'https://api-pix-h.sicredi.com.br';

                          FEndPoints.CobPut     :=  '/cob/{txid}';
                          FEndPoints.CobPatch   :=  '/cob/{txid}';
                          FEndPoints.CobGet     :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                        end;
                        {============================================}
      pspBancoDoBrasil: begin
                          FURLToken           := 'https://oauth.sandbox.bb.com.br/oauth/token';
                          FURLAPI             := 'https://api.sandbox.bb.com.br/pix/v1';
                          FUrlHostCert        := '';

                          FEndPoints.CobPut   :=  '/cobqrcode/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                        end;
                        {============================================}
      pspSantander:     begin
                          FURLToken           := 'https://pix.santander.com.br/sandbox/oauth/token';
                          FURLAPI             := 'https://pix.santander.com.br/api/v1/sandbox';
                          FUrlHostCert        := 'https://trust-pix-h.santander.com.br';

                          FEndPoints.CobPut   :=  '/cob/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                        end;
                        {============================================}
      pspSicoob:        begin
                          FURLToken           := 'https://api-homol.sicoob.com.br/cooperado/pix/token';
                          FURLAPI             := 'https://api-homol.sicoob.com.br/cooperado/pix/api/v2';
                          FUrlHostCert        := 'https://api-homol.sicoob.com.br';

                          FEndPoints.CobPut   :=  '/cob/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                        end;
                        {============================================}
      pspBradesco     : begin
                          FURLToken           := 'https://qrpix-h.bradesco.com.br/oauth/token';
                          FURLAPI             := 'https://qrpix-h.bradesco.com.br/v2';
                          FUrlHostCert        := 'https://qrpix-h.bradesco.com.br';

                          FEndPoints.CobPut   :=  '/cob/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                          FEndPoints.LocGetCLC      :=  '/loc';
                          FEndPoints.LocGetRLP      :=  '/loc/{locId}';
                          FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
                          FEndPoints.LocDeleteDTL   :=  '/loc/{locId}/{txid}';
                          FEndPoints.LocPostCLP     :=  '/loc';

                        end;
                        {============================================}
      pspGerencianet  : begin
                          FURLToken           := 'https://api-pix-h.gerencianet.com.br/oauth/token';
                          FURLAPI             := 'https://api-pix-h.gerencianet.com.br/v2';
                          FUrlHostCert        := 'https://api-pix-h.gerencianet.com.br';

                          FEndPoints.CobPut   :=  '/cob/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                          FEndPoints.LocGetCLC      :=  '/loc';
                          FEndPoints.LocGetRLP      :=  '/loc/{locId}';
                          FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
                          FEndPoints.LocDeleteDTL   :=  '/loc/{locId}/{txid}';
                          FEndPoints.LocPostCLP     :=  '/loc';
                        end;
                        {============================================}
      pspPagSeguro    : begin
                          FURLToken           := 'https://secure.sandbox.api.pagseguro.com/pix/oauth2';
                          FURLAPI             := 'https://secure.sandbox.api.pagseguro.com/instant-payments';
                          FUrlHostCert        := 'https://secure.sandbox.api.pagseguro.com';

                          FEndPoints.CobPut   :=  '/cob/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                          FEndPoints.LocGetCLC      :=  '/loc';
                          FEndPoints.LocGetRLP      :=  '/loc/{locId}';
                          FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
                          FEndPoints.LocDeleteDTL   :=  '/loc/{locId}/{txid}';
                          FEndPoints.LocPostCLP     :=  '/loc';
                        end;
                        {============================================}

    end;
  end
  else if TipoPspAmbiente = taHomologacao then
  begin
    case TipoPsp of
                        {============================================}
      pspSicredi      : begin
                          FURLToken           := 'https://api-pix-h.sicredi.com.br/oauth/token';
                          FURLAPI             := 'https://api-pix-h.sicredi.com.br/api/v2';
                          FUrlHostCert        := 'https://api-pix-h.sicredi.com.br';

                          FEndPoints.CobPut   :=  '/cob/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                        end;
                        {============================================}
      pspBancoDoBrasil: begin
                          FURLToken           := 'https://oauth.hm.bb.com.br/oauth/token';
                          FURLAPI             := 'https://api.hm.bb.com.br/pix/v1';
                          FUrlHostCert        := '';

                          FEndPoints.CobPut   := '/cobqrcode/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                        end;
                        {============================================}
      pspSantander:     begin
                          FURLToken           := 'https://trust-pix-h.santander.com.br/oauth/token';
                          FURLAPI             := 'https://trust-pix-h.santander.com.br/api/v1';
                          FUrlHostCert        := 'https://trust-pix-h.santander.com.br';

                          FEndPoints.CobPut   :=  '/cob/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                        end;
                        {============================================}
      pspSicoob:        begin
                          FURLToken           := 'https://api-homol.sicoob.com.br/cooperado/pix/token';
                          FURLAPI             := 'https://api-homol.sicoob.com.br/cooperado/pix/api/v2';
                          FUrlHostCert        := 'https://api-homol.sicoob.com.br';

                          FEndPoints.CobPut   :=  '/cob/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                        end;
                        {============================================}
      pspBradesco     : begin
                          FURLToken           := 'https://qrpix-h.bradesco.com.br/oauth/token';
                          FURLAPI             := 'https://qrpix-h.bradesco.com.br/v2';
                          FUrlHostCert        := 'https://qrpix-h.bradesco.com.br';

                          FEndPoints.CobPut   :=  '/cob/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                          FEndPoints.LocGetCLC      :=  '/loc';
                          FEndPoints.LocGetRLP      :=  '/loc/{locId}';
                          FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
                          FEndPoints.LocDeleteDTL   :=  '/loc/{locId}/{txid}';
                          FEndPoints.LocPostCLP     :=  '/loc';

                        end;
                        {============================================}
      pspGerencianet  : begin
                          FURLToken           := 'https://api-pix-h.gerencianet.com.br/oauth/token';
                          FURLAPI             := 'https://api-pix-h.gerencianet.com.br/v2';
                          FUrlHostCert        := 'https://api-pix-h.gerencianet.com.br';

                          FEndPoints.CobPut   :=  '/cob/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                          FEndPoints.LocGetCLC      :=  '/loc';
                          FEndPoints.LocGetRLP      :=  '/loc/{locId}';
                          FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
                          FEndPoints.LocDeleteDTL   :=  '/loc/{locId}/{txid}';
                          FEndPoints.LocPostCLP     :=  '/loc';
                        end;
                        {============================================}
      pspPagSeguro    : begin
                          FURLToken           := 'https://secure.sandbox.api.pagseguro.com/pix/oauth2';
                          FURLAPI             := 'https://secure.sandbox.api.pagseguro.com/instant-payments';
                          FUrlHostCert        := 'https://secure.sandbox.api.pagseguro.com';

                          FEndPoints.CobPut   :=  '/cob/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                          FEndPoints.LocGetCLC      :=  '/loc';
                          FEndPoints.LocGetRLP      :=  '/loc/{locId}';
                          FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
                          FEndPoints.LocDeleteDTL   :=  '/loc/{locId}/{txid}';
                          FEndPoints.LocPostCLP     :=  '/loc';
                        end;
                        {============================================}
    end;
  end
  else if TipoPspAmbiente = taProducao then
  begin
    case TipoPsp of
                        {============================================}
      pspSicredi      : begin
                          FURLToken           :=  'https://api-pix.sicredi.com.br/oauth/token';;  // 'https://api-pix.sicredi.com.br/v2/oauth/token';
                          FURLAPI             :=  'https://api-pix.sicredi.com.br/api/v2';
                          FUrlHostCert        :=  'https://api-pix.sicredi.com.br';

                          FEndPoints.CobPut   :=  '/cob/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                        end;
                        {===========================================}
      pspBancoDoBrasil: begin
                          FURLToken           := 'https://oauth.bb.com.br/oauth/token';
                          FURLAPI             := 'https://api.bb.com.br/pix/v1';
                          FUrlHostCert        := '';

                          FEndPoints.CobPut   := '/cobqrcode/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                        end;
                        {============================================}
      pspSantander    : begin
                          FURLToken           := 'https://trust-pix.santander.com.br/oauth/token';
                          FURLAPI             := 'https://trust-pix.santander.com.br/api/v1';
                          FUrlHostCert        := 'https://trust-pix.santander.com.br';

                          FEndPoints.CobPut   :=  '/cob/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                        end;
                        {============================================}
       pspSicoob:       begin
                          FURLToken           := 'https://auth.sicoob.com.br/auth/realms/cooperado/protocol/openid-connect/token';
                          FURLAPI             := 'https://apis.sicoob.com.br/cooperado/pix/api/v2';
                          FUrlHostCert        := 'https://apis.sicoob.com.br';

                          FEndPoints.CobPut   :=  '/cob/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                        end;
                        {============================================}
      pspBradesco     : begin
                          FURLToken           := 'https://qrpix.bradesco.com.br/oauth/token';
                          FURLAPI             := 'https://qrpix.bradesco.com.br/v2';
                          FUrlHostCert        := 'https://qrpix.bradesco.com.br';

                          FEndPoints.CobPut   :=  '/cob/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                          FEndPoints.LocGetCLC      :=  '/loc';
                          FEndPoints.LocGetRLP      :=  '/loc/{locId}';
                          FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
                          FEndPoints.LocDeleteDTL   :=  '/loc/{locId}/{txid}';
                          FEndPoints.LocPostCLP     :=  '/loc';

                        end;
                        {============================================}
      pspGerencianet  : begin
                          FURLToken           := 'https://api-pix.gerencianet.com.br/oauth/token';
                          FURLAPI             := 'https://api-pix.gerencianet.com.br/v2';
                          FUrlHostCert        := 'https://api-pix.gerencianet.com.br';

                          FEndPoints.CobPut   :=  '/cob/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                          FEndPoints.LocGetCLC      :=  '/loc';
                          FEndPoints.LocGetRLP      :=  '/loc/{locId}';
                          FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
                          FEndPoints.LocDeleteDTL   :=  '/loc/{locId}/{txid}';
                          FEndPoints.LocPostCLP     :=  '/loc';
                        end;
                        {============================================}
      pspPagSeguro    : begin
                          FURLToken           := 'https://secure.api.pagseguro.com/pix/oauth2';
                          FURLAPI             := 'https://secure.api.pagseguro.com/instant-payments';
                          FUrlHostCert        := 'https://secure.api.pagseguro.com';

                          FEndPoints.CobPut   :=  '/cob/{txid}';
                          FEndPoints.CobPatch :=  '/cob/{txid}';
                          FEndPoints.CobGet   :=  '/cob/{txid}';

                          FEndPoints.FPixPut    :=  '/pix/{e2eid}/devolucao/{id}';
                          FEndPoints.FPixGetCPR :=  '/pix';
                          FEndPoints.FPixGetCP  :=  '/pix/{e2eid}';
                          FEndPoints.FPixGetCD  :=  '/pix/{e2eid}/devolucao/{id}';

                          FEndPoints.LocGetCLC      :=  '/loc';
                          FEndPoints.LocGetRLP      :=  '/loc/{locId}';
                          FEndPoints.LocGetGQL      :=  '/loc/{locId}/qrcode';
                          FEndPoints.LocDeleteDTL   :=  '/loc/{locId}/{txid}';
                          FEndPoints.LocPostCLP     :=  '/loc';
                        end;
                        {============================================}
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

procedure TEndPoint.SetCobGet(const Value: string);
begin
  FCobGet := Value;
end;

procedure TEndPoint.SetCobPatch(const Value: string);
begin
  FCobPatch := Value;
end;

procedure TEndPoint.SetCobPut(const Value: string);
begin
  FCobPut := Value;
end;

procedure TEndPoint.SetLocDeleteDTL(const Value: string);
begin
  FLocDeleteDTL := Value;
end;

procedure TEndPoint.SetLocGetCLC(const Value: string);
begin
  FLocGetCLC := Value;
end;

procedure TEndPoint.SetLocGetGQL(const Value: string);
begin
  FLocGetGQL := Value;
end;

procedure TEndPoint.SetLocGetRLP(const Value: string);
begin
  FLocGetRLP := Value;
end;

procedure TEndPoint.SetLocPostCLP(const Value: string);
begin
  FLocPostCLP := Value;
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

procedure TTPSP.SetEndPoints(const Value: TEndPoint);
begin
  FEndPoints := Value;
end;

end.
