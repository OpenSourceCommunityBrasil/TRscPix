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
  TTPSP = class(TPersistent)
    private
      FTipoPsp: TTipoPSP;
      FTipoPspAmbiente: TTipoAmbiente;
      FPermiteCancelar: Boolean;
      FEndPoint_Cob: string;
      FPermiteRevisar: Boolean;
      FUrlToken: string;
      FUrlHostCert: string;
      FUrlApi: string;
      procedure SetTipoPsp(const Value: TTipoPSP);
      procedure SetTipoPspAmbiente(const Value: TTipoAmbiente);
      procedure SetEndPoint_Cob(const Value: string);
      procedure SetPermiteCancelar(const Value: Boolean);
      procedure SetPermiteRevisar(const Value: Boolean);
      procedure SetUrlApi(const Value: string);
      procedure SetUrlHostCert(const Value: string);
      procedure SetUrlToken(const Value: string);

      procedure SetConfigUrls;

    public
      property UrlToken         : string  read FUrlToken        write SetUrlToken;
      property UrlApi           : string  read FUrlApi          write SetUrlApi;
      property UrlHostCert      : string  read FUrlHostCert     write SetUrlHostCert;
      property EndPoint_Cob     : string  read FEndPoint_Cob    write SetEndPoint_Cob;
      property PermiteRevisar   : Boolean read FPermiteRevisar  write SetPermiteRevisar;
      property PermiteCancelar  : Boolean read FPermiteCancelar write SetPermiteCancelar;
    published
      property TipoPsp          : TTipoPSP      read FTipoPsp         write SetTipoPsp;
      property TipoPspAmbiente  : TTipoAmbiente read FTipoPspAmbiente write SetTipoPspAmbiente;
  End;

implementation

{ TTPSP }

procedure TTPSP.SetConfigUrls;
begin
  if TipoPspAmbiente = taSandBox then
  begin
    case TipoPsp of
                        {============================================}
      pspSicredi      : begin
                          URLToken            := 'https://api-pix-h.sicredi.com.br/oauth/token';
                          FURLAPI             := 'https://api-pix-h.sicredi.com.br/api/v2';
                          FUrlHostCert        := 'https://api-pix-h.sicredi.com.br';

                          FEndPoint_Cob       := '/cob/{txid}';
                          fPermiteRevisar     := False;
                          fPermiteCancelar    := False;
                        end;
                        {============================================}
      pspBancoDoBrasil: begin
                          FURLToken           := 'https://oauth.sandbox.bb.com.br/oauth/token';
                          FURLAPI             := 'https://api.sandbox.bb.com.br/pix/v1';
                          FUrlHostCert        := '';

                          FEndPoint_Cob       := '/cobqrcode/{txid}';
                          fPermiteRevisar     := False;
                          fPermiteCancelar    := False;
                        end;
                        {============================================}
      pspSantander:     begin
                          FURLToken           := 'https://pix.santander.com.br/sandbox/oauth/token';
                          FURLAPI             := 'https://pix.santander.com.br/api/v1/sandbox';
                          FUrlHostCert        := 'https://trust-pix-h.santander.com.br';

                          FEndPoint_Cob       := '/cob/{txid}';

                          fPermiteRevisar     := False;
                          fPermiteCancelar    := False;
                        end;
                        {============================================}
      pspSicoob:        begin
                          FURLToken           := 'https://api-homol.sicoob.com.br/cooperado/pix/token';
                          FURLAPI             := 'https://api-homol.sicoob.com.br/cooperado/pix/api/v2';
                          FUrlHostCert        := 'https://api-homol.sicoob.com.br';

                          FEndPoint_Cob       := '/cob/{txid}';
                          fPermiteRevisar     := False;
                          fPermiteCancelar    := False;
                        end;
                        {============================================}
      pspBradesco     : begin
                          FURLToken           := '';
                          FURLAPI             := '';
                          FUrlHostCert        := '';

                          FEndPoint_Cob       := '/cob/{txid}';
                          fPermiteRevisar     := False;
                          fPermiteCancelar    := False;
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

                          FEndPoint_Cob       := '/cob/{txid}';
//                          fRecebidoTagPIX := False;
                          fPermiteRevisar     := False;
                          fPermiteCancelar    := False;
                        end;
                        {============================================}
      pspBancoDoBrasil: begin
                          FURLToken           := 'https://oauth.hm.bb.com.br/oauth/token';
                          FURLAPI             := 'https://api.hm.bb.com.br/pix/v1';
                          FUrlHostCert        := '';

                          FEndPoint_Cob       := '/cobqrcode/{txid}';
                          fPermiteRevisar     := False;
                          fPermiteCancelar    := False;
                        end;
                        {============================================}
      pspSantander:     begin
                          FURLToken           := 'https://trust-pix-h.santander.com.br/oauth/token';
                          FURLAPI             := 'https://trust-pix-h.santander.com.br/api/v1';
                          FUrlHostCert        := 'https://trust-pix-h.santander.com.br';

                          FEndPoint_Cob       := '/cob/{txid}';

                          fPermiteRevisar     := False;
                          fPermiteCancelar    := False;
                        end;
                        {============================================}
      pspSicoob:        begin
                          FURLToken           := 'https://api-homol.sicoob.com.br/cooperado/pix/token';
                          FURLAPI             := 'https://api-homol.sicoob.com.br/cooperado/pix/api/v2';
                          FUrlHostCert        := 'https://api-homol.sicoob.com.br';

                          FEndPoint_Cob       := '/cob/{txid}';
                          fPermiteRevisar     := False;
                          fPermiteCancelar    := False;
                        end;
                        {============================================}
      pspBradesco     : begin
                          FURLToken           := 'https://qrpix-h.bradesco.com.br/auth/server/oauth/token';
                          FURLAPI             := '';
                          FUrlHostCert        := '';

                          FEndPoint_Cob       := '/cob/{txid}';
                          fPermiteRevisar     := False;
                          fPermiteCancelar    := False;
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
                          FEndPoint_Cob       := '/cob/{txid}';
                          fPermiteRevisar     := False;
                          fPermiteCancelar    := False;
                        end;
                        {===========================================}
      pspBancoDoBrasil: begin
                          FURLToken           := 'https://oauth.bb.com.br/oauth/token';
                          FURLAPI             := 'https://api.bb.com.br/pix/v1';
                          FUrlHostCert        := '';

                          FEndPoint_Cob       := '/cobqrcode/{txid}';
                          fPermiteRevisar     := False;
                          fPermiteCancelar    := False;
                        end;
                        {============================================}
      pspSantander    : begin
                          FURLToken           := 'https://trust-pix.santander.com.br/oauth/token';
                          FURLAPI             := 'https://trust-pix.santander.com.br/api/v1';
                          FUrlHostCert        := 'https://trust-pix-h.santander.com.br';

                          FEndPoint_Cob       := '/cob/{txid}';
                          fPermiteRevisar     := False;
                          fPermiteCancelar    := False;
                        end;
                        {============================================}
       pspSicoob:       begin
                          FURLToken           := 'https://apis.sisbr.com.br/cooperado/pix/token';
                          FURLAPI             := 'https://apis.sisbr.com.br/cooperado/pix/api/v2/';
                          FUrlHostCert        := 'https://api.sicoob.com.br';

                          FEndPoint_Cob       := '/cob/{txid}';
                          fPermiteRevisar     := False;
                          fPermiteCancelar    := False;
                        end;
                        {============================================}
      pspBradesco     : begin
                          FURLToken           := '';
                          FURLAPI             := '';
                          FUrlHostCert        := '';

                          FEndPoint_Cob       := '/cob/{txid}';
                          fPermiteRevisar     := False;
                          fPermiteCancelar    := False;
                        end;
                        {============================================}
    end;
  end;
end;

procedure TTPSP.SetEndPoint_Cob(const Value: string);
begin
  FEndPoint_Cob := Value;
end;

procedure TTPSP.SetPermiteCancelar(const Value: Boolean);
begin
  FPermiteCancelar := Value;
end;

procedure TTPSP.SetPermiteRevisar(const Value: Boolean);
begin
  FPermiteRevisar := Value;
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

end.
