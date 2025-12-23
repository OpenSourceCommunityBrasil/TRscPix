unit RscPixPSP;

interface
  uses
    Classes,
    RscPixTipos,
    RscPixEndPoint;

type

  TPSP = class(TPersistent)
    private
      FTipoPsp          : TTipoPSP;
      FTipoPspAmbiente  : TTipoAmbiente;
      FUrlToken         : string;
      FUrlHostCert      : string;
      FUrlApi           : string;
      FEndPoints        : TEndPoint;
      FScopePix         : string;
      
      procedure SetTipoPsp(const Value: TTipoPSP);
      procedure SetTipoPspAmbiente(const Value: TTipoAmbiente);

    protected
      procedure SetConfigUrls;

    public
      property UrlToken         : string    read FUrlToken;
      property UrlApi           : string    read FUrlApi;
      property UrlHostCert      : string    read FUrlHostCert;
      property EndPoints        : TEndPoint read FEndPoints;
      property ScopePix         : string    read FScopePix;

      Constructor Create;
      Destructor  Destroy;  Override;
    published
      property Psp          : TTipoPSP      read FTipoPsp         write SetTipoPsp;
      property PspAmbiente  : TTipoAmbiente read FTipoPspAmbiente write SetTipoPspAmbiente;
  End;
implementation


{ TPSP }

constructor TPSP.Create;
begin
  FEndPoints  :=  TEndPoint.Create;
end;

destructor TPSP.Destroy;
begin
  FEndPoints.Free;
  inherited;
end;

procedure TPSP.SetConfigUrls;
begin
  FEndPoints.CobPut         :=  '/cob/{txid}';
  FEndPoints.CobPatch       :=  '/cob/{txid}';
  FEndPoints.CobGet         :=  '/cob/{txid}';
  FEndPoints.CobGetS        :=  '/cob';
  FEndPoints.CobPostS       :=  '/cob';

  FEndPoints.CobvGet        :=  '/cobv/{txid}';
  FEndPoints.CobvGetS       :=  '/cobv';
  FEndPoints.CobvPut        :=  '/cobv/{txid}';
  FEndPoints.CobvPatch      :=  '/cobv/{txid}';

  FEndPoints.PixPut        :=  '/pix/{e2eid}/devolucao/{id}';
  FEndPoints.PixGetCPR     :=  '/pix';
  FEndPoints.PixGetCP      :=  '/pix/{e2eid}';
  FEndPoints.PixGetCD      :=  '/pix/{e2eid}/devolucao/{id}';

  FEndPoints.WebhookGetCWC  :=  '/webhook';
  FEndPoints.WebhookGet     :=  '/webhook/{chave}';
  FEndPoints.WebhookPut     :=  '/webhook/{chave}';
  FEndPoints.WebhookDelete  :=  '/webhook/{chave}';

  FEndPoints.LocGet         :=  '/loc';
  FEndPoints.LocGetId       :=  '/loc/{locId}'; //{id}
  FEndPoints.LocDelete      :=  '/loc/{locId}/txid'; //{id}
  FEndPoints.LocPost        :=  '/loc';
  FEndPoints.LocGetIdQrcode :=  '/loc/{locId}/qrcode';


  case Psp of
    pspSicredi:
      begin
        case PspAmbiente of
          taSandBox:
            begin
              FURLToken                 :=  'https://api-pix-h.sicredi.com.br/oauth/token?grant_type=client_credentials&scope=cob.write+cob.read+webhook.read+webhook.write+pix.read+pix.write';
              FURLAPI                   :=  'https://api-pix-h.sicredi.com.br/api/v2';
              FUrlHostCert              :=  'https://api-pix-h.sicredi.com.br';
              FScopePix                 :=  '';
            end;

          taHomologacao:
            begin
              FURLToken                 :=  'https://api-pix-h.sicredi.com.br/oauth/token?grant_type=client_credentials&scope=cob.write+cob.read+webhook.read+webhook.write+pix.read+pix.write';
              FURLAPI                   :=  'https://api-pix-h.sicredi.com.br/api/v2';
              FUrlHostCert              :=  'https://api-pix-h.sicredi.com.br';
            end;

          taProducao:
            begin
              FURLToken                 :=  'https://api-pix.sicredi.com.br/oauth/token?grant_type=client_credentials&scope=cob.write+cob.read+webhook.read+webhook.write+pix.read+pix.write';  // 'https://api-pix.sicredi.com.br/v2/oauth/token';
              FURLAPI                   :=  'https://api-pix.sicredi.com.br/api/v2';
              FUrlHostCert              :=  'https://api-pix.sicredi.com.br';
            end;
        end;
      end;

    pspBancoDoBrasil:
      begin
        case PspAmbiente of
          taSandBox:
            begin
              FURLToken                 :=  'https://oauth.sandbox.bb.com.br/oauth/token';
              FURLAPI                   :=  'https://api.sandbox.bb.com.br/pix/v2';
              FUrlHostCert              :=  '';
            end;

          taHomologacao:
            begin
              FURLToken                 :=  'https://oauth.hm.bb.com.br/oauth/token';
              FURLAPI                   :=  'https://api.hm.bb.com.br/pix/v2';
              FUrlHostCert              :=  '';
            end;

          taProducao:
            begin
              FURLToken                 :=  'https://oauth.bb.com.br/oauth/token';
              FURLAPI                   :=  'https://api-pix.bb.com.br/pix/v2';
              FUrlHostCert              :=  '';
            end;
        end;
      end;

    pspBradesco:
      begin
        case PspAmbiente of
          taSandBox:
            begin
              FURLToken                 :=  'https://qrpix-h.bradesco.com.br/oauth/token';
              FURLAPI                   :=  'https://qrpix-h.bradesco.com.br/v2';
              FUrlHostCert              :=  'https://qrpix-h.bradesco.com.br';

              FEndPoints.CobEmvPut      :=  '/cob-emv/{txid}';
              FEndPoints.CobEmvPostS    :=  '/cob-emv';

              FEndPoints.CobvEmvPut     :=  '/cobv-emv/{txid}';

              FEndPoints.WebhookPost    :=  '{$request.body#/webhookUrl}/pix';
            end;

          taHomologacao:
            begin
              FURLToken                 :=  'https://qrpix-h.bradesco.com.br/oauth/token';
              FURLAPI                   :=  'https://qrpix-h.bradesco.com.br/v2';
              FUrlHostCert              :=  'https://qrpix-h.bradesco.com.br';

              FEndPoints.CobEmvPut      :=  '/cob-emv/{txid}';
              FEndPoints.CobEmvPostS    :=  '/cob-emv';

              FEndPoints.CobvEmvPut     :=  '/cobv-emv/{txid}';

              FEndPoints.WebhookPost    :=  '{$request.body#/webhookUrl}/pix';
            end;

          taProducao:
            begin
              FURLToken                 :=  'https://qrpix.bradesco.com.br/oauth/token';
              FURLAPI                   :=  'https://qrpix.bradesco.com.br/v2';
              FUrlHostCert              :=  'https://qrpix.bradesco.com.br';

              FEndPoints.CobEmvPut      :=  '/cob-emv/{txid}';
              FEndPoints.CobEmvPostS    :=  '/cob-emv';

              FEndPoints.CobvEmvPut     :=  '/cobv-emv/{txid}';

              FEndPoints.WebhookPost    :=  '{$request.body#/webhookUrl}/pix';
            end;
        end;
      end;

    pspSantander:
      begin
        case PspAmbiente of
          taSandBox:
            begin
              FURLToken                 :=  'https://pix.santander.com.br/sandbox/oauth/token';
              FURLAPI                   :=  'https://pix.santander.com.br/api/v1/sandbox';
              FUrlHostCert              :=  'https://trust-pix-h.santander.com.br';
            end;

          taHomologacao:
            begin
              FURLToken                 :=  'https://trust-pix-h.santander.com.br/oauth/token';
              FURLAPI                   :=  'https://trust-pix-h.santander.com.br/api/v1';
              FUrlHostCert              :=  'https://trust-pix-h.santander.com.br';
            end;

          taProducao:
            begin
              FURLToken                 :=  'https://trust-pix.santander.com.br/oauth/token';
              FURLAPI                   :=  'https://trust-pix.santander.com.br/api/v1';
              FUrlHostCert              :=  'https://trust-pix.santander.com.br';
            end;
        end;
      end;

    pspSicoob:
      begin
        case PspAmbiente of
          taSandBox:
            begin
              FURLToken                 :=  'https://api-homol.sicoob.com.br/cooperado/pix/token';
              FURLAPI                   :=  'https://api-homol.sicoob.com.br/cooperado/pix/api/v2';
              FUrlHostCert              :=  'https://api-homol.sicoob.com.br';
            end;

          taHomologacao:
            begin
              FURLToken                 :=  'https://api-homol.sicoob.com.br/cooperado/pix/token';
              FURLAPI                   :=  'https://api-homol.sicoob.com.br/cooperado/pix/api/v2';
              FUrlHostCert              :=  'https://api-homol.sicoob.com.br';
            end;

          taProducao:
            begin
              FURLToken                 :=  'https://auth.sicoob.com.br/auth/realms/cooperado/protocol/openid-connect/token';
              FURLAPI                   :=  'https://apis.sicoob.com.br/cooperado/pix/api/v2';
              FUrlHostCert              :=  'https://apis.sicoob.com.br';
            end;
        end;
      end;

    pspEfi:
      begin
        case PspAmbiente of
          taSandBox:
            begin
              FURLToken                 :=  'https://pix-h.api.efipay.com.br/oauth/token';
              FURLAPI                   :=  'https://pix-h.api.efipay.com.br/v2';
              FUrlHostCert              :=  'https://pix-h.api.efipay.com.br';
            end;

          taHomologacao:
            begin
              FURLToken                 :=  'https://pix-h.api.efipay.com.br/oauth/token';
              FURLAPI                   :=  'https://pix-h.api.efipay.com.br/v2';
              FUrlHostCert              :=  'https://pix-h.api.efipay.com.br';
            end;

          taProducao:
            begin
              FURLToken                 :=  'https://pix.api.efipay.com.br/oauth/token';
              FURLAPI                   :=  'https://pix.api.efipay.com.br/v2';
              FUrlHostCert              :=  'https://pix.api.efipay.com.br';
            end;
        end;
      end;

    pspPagSeguro:
      begin
        case PspAmbiente of
          taSandBox:
            begin
              FURLToken                 :=  'https://secure.sandbox.api.pagseguro.com/pix/oauth2';
              FURLAPI                   :=  'https://secure.sandbox.api.pagseguro.com/instant-payments';
              FUrlHostCert              :=  'https://secure.sandbox.api.pagseguro.com';
            end;

          taHomologacao:
            begin
              FURLToken                 :=  'https://secure.sandbox.api.pagseguro.com/pix/oauth2';
              FURLAPI                   :=  'https://secure.sandbox.api.pagseguro.com/instant-payments';
              FUrlHostCert              :=  'https://secure.sandbox.api.pagseguro.com';
            end;

          taProducao:
            begin
              FURLToken                 :=  'https://secure.api.pagseguro.com/pix/oauth2';
              FURLAPI                   :=  'https://secure.api.pagseguro.com/instant-payments';
              FUrlHostCert              :=  'https://secure.api.pagseguro.com';
            end;
        end;
      end;

    pspItau:
      begin
        case PspAmbiente of
          taSandBox:
            begin
              FURLToken                 :=  'https://devportal.itau.com.br/api/jwt/as/token.oauth2';
              FURLAPI                   :=  'https://devportal.itau.com.br/sandboxapi/pix_recebimentos_ext_v2/v2';
              FUrlHostCert              :=  'https://devportal.itau.com.br/sandboxapi/seguranca/v1/certificado';
            end;

          taHomologacao:
            begin
              FURLToken                 :=  'https://devportal.itau.com.br/api/jwt/as/token.oauth2';
              FURLAPI                   :=  'https://devportal.itau.com.br/sandboxapi/pix_recebimentos_ext_v2/v2';
              FUrlHostCert              :=  'https://devportal.itau.com.br/sandboxapi/seguranca/v1/certificado';
            end;

          taProducao:
            begin
              FURLToken                 :=  'https://sts.itau.com.br/as/token.oauth2';
              FURLAPI                   :=  'https://secure.api.itau/pix_recebimentos/v2';
              FUrlHostCert              :=  'https://secure.api.itau/seguranca/v1/certificado';
            end;
        end;
      end;

    pspInter:
      begin
        case PspAmbiente of
          taSandBox:
            begin
              FURLToken                 :=  'https://cdpj.partners.bancointer.com.br/oauth/v2/token';
              FURLAPI                   :=  'https://cdpj.partners.bancointer.com.br/pix/v2';
              FUrlHostCert              :=  'https://cdpj.partners.bancointer.com.br';
            end;

          taHomologacao:
            begin
              FURLToken                 :=  'https://cdpj.partners.bancointer.com.br/oauth/v2/token';
              FURLAPI                   :=  'https://cdpj.partners.bancointer.com.br/pix/v2';
              FUrlHostCert              :=  'https://cdpj.partners.bancointer.com.br';
            end;

          taProducao:
            begin
              FURLToken                 :=  'https://cdpj.partners.bancointer.com.br/oauth/v2/token';
              FURLAPI                   :=  'https://cdpj.partners.bancointer.com.br/pix/v2';
              FUrlHostCert              :=  'https://cdpj.partners.bancointer.com.br';
            end;
        end;
      end;

    pspBanRiSul:
      begin
        case PspAmbiente of
          taSandBox:
            begin
              FURLToken                 :=  'https://mtls-api-h.banrisul.com.br/auth/oauth/v2/token';
              FURLAPI                   :=  'https://mtls-api-h.banrisul.com.br/pix/api-mtls';
              FUrlHostCert              :=  'https://mtls-api-h.banrisul.com.br';
            end;

          taHomologacao:
            begin
              FURLToken                 :=  'https://mtls-api-h.banrisul.com.br/auth/oauth/v2/token';
              FURLAPI                   :=  'https://mtls-api-h.banrisul.com.br/pix/api-mtls';
              FUrlHostCert              :=  'https://mtls-api-h.banrisul.com.br';
            end;

          taProducao:
            begin
              FURLToken                 :=  'https://mtls-api.banrisul.com.br/auth/oauth/v2/token';
              FURLAPI                   :=  'https://mtls-api.banrisul.com.br/pix/api-mtls';
              FUrlHostCert              :=  'https://mtls-api.banrisul.com.br';
            end;
        end;
      end;

  end;

end;

procedure TPSP.SetTipoPsp(const Value: TTipoPSP);
begin
  FTipoPsp := Value;
  SetConfigUrls;
end;

procedure TPSP.SetTipoPspAmbiente(const Value: TTipoAmbiente);
begin
  FTipoPspAmbiente := Value;
  SetConfigUrls;
end;

end.

