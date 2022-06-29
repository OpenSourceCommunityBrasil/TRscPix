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

unit uRscPix.Constantes;

interface


const

  VersaoComponente                            = '1.2.0.0'; {Versão anterior = 1.1.0.0 }

  ID_PAYLOAD_FORMAT_INDICATOR                 = '00';
  ID_POINT_OF_INITIATION_METHOD               = '01';
  ID_MERCHANT_ACCOUNT_INFORMATION             = '26';
  ID_MERCHANT_ACCOUNT_INFORMATION_GUI         = '00';
  ID_MERCHANT_ACCOUNT_INFORMATION_KEY         = '01';

  ID_MERCHANT_ACCOUNT_INFORMATION_DESCRIPTION = '02';
  ID_MERCHANT_ACCOUNT_INFORMATION_URL         = '25';

  ID_MERCHANT_CATEGORY_CODE                   = '52';
  ID_TRANSACTION_CURRENCY                     = '53';

  ID_TRANSACTION_AMOUNT                       = '54';

  ID_COUNTRY_CODE                             = '58';
  ID_MERCHANT_NAME                            = '59';
  ID_MERCHANT_CITY                            = '60';

  ID_ADDITIONAL_DATA_FIELD_TEMPLATE           = '62';
  ID_ADDITIONAL_DATA_FIELD_TEMPLATE_TXID      = '05';

  ID_CRC16                                    = '63';



  {Error}
  {Erros Gerais}
  Sucesso                           = 'Sucesso na Requisição.'; {200}
  ObteveExito                       = 'Exito na Criação.'; {201}
  RequisicaoInvalida                = 'Requisição inválida, há algo de errado com os dados informados.'; {400}
  NaoAutorizado                     = 'Não autorizado.'; {401}
  AcessoNegado                      = 'Requisição de participante autenticado que viola alguma regra de permissão.'; {403}
  NaoEncontrado                     = 'Entidade não encontrada.'; {404}
  NaoPermitido                      = 'Método não permitido.'; {405}
  PermanentementeRemovido           = 'Indica que a entidade existia, mas foi permanentemente removida.'; {410}
  MuitosPedidos                     = 'Muitos pedidos, Tente novamente em instantes'; {429}
  ErroInternoDoServidor             = 'Erro Interno do Servidor, Condição inesperada ao processar requisição.'; {500}
  ServicoIndisponivel               = 'Serviço não está disponível no momento. Serviço solicitado pode estar em manutenção ou para a janela de funcionamento.'; {503}
  IndisponibilidadePorTempoEsgotado = 'Indica que o serviço demorou além do esperado para retornar.'; {504}

  {Erros Tag CobPayload}
  CobPayloadNaoEncontrado           = 'A cobrança em questão não foi encontrada para a localização requisitada.'; {404 ou 410}
    //endpoints : GET /{pixUrlAccessToken}, GET /cobv/{pixUrlAccessToken}.
  CobPayloadOperacaoInvalida        = 'A cobrança existe, mas a requisição é inválida.'; {400}
    //endpoints : GET /cobv/{pixUrlAccessToken}.

  {Erros Tag Cob}
  CobNaoEncontrado                  = 'Cobrança não encontrada para o txid.'; {404}
    //endpoints : [GET|PATCH] /cob/{txid}.
  CobOperacaoInvalida               = 'A requisição que busca alterar ou criar uma cobrança para pagamento imediato não respeita o esquema ou está semanticamente errado.'; {400}
    //endpoints : [POST|PUT|PATCH] /cob/{txid}.
  CobConsultaInvalida               = 'Os parâmetros de consulta à lista de cobranças para pagamento imediato não respeitam o esquema ou não fazem sentido semanticamente.'; {400}
    //endpoints: GET /cob e GET /cob/{txid}.


  {Erros Tag CobV}
  CobVNaoEncontrada                 = 'Cobrança com vencimento não encontrada para o txid.'; {404}
    //endpoints: [GET|PATCH] /cobv/{txid}.
  CobVOperacaoInvalida              = 'A requisição que busca alterar ou criar uma cobrança com vencimento não respeita o esquema ou está semanticamente errado.'; {400}
    //endpoints: [PUT|PATCH] /cobv/{txid}.
  CobVConsultaInvalida              = 'os parâmetros de consulta à lista de cobranças com vencimento não respeitam o esquema ou não fazem sentido semanticamente.'; {400}
    //endpoints: GET /cobv e GET /cobv/{txid}.

  {Erros Tag LoteCobV}
  LoteCobVNaoEncontrado             = 'Lote não encontrado para a idInternet.'; {404}
    //endpoints: [GET|PATCH] /lotecobv/{id}.
  LoteCobVOperacaoInvalida          = 'A requisição que busca alterar ou criar um lote de cobranças com vencimento não respeita o esquema ou está semanticamente incorreto.'; {400}
    //endpoints: [PUT|PATCH] /lotecobv/{id}.
  LoteCobVConsultaInvalida          = 'Os parâmetros de consulta à lista de lotes de cobrança com vencimento não respeitam o esquema ou não fazem sentido semanticamente.'; {400}
    //endpoints: GET /lotecobv e GET /lotecobv/{id}.

  {Erros Tag PayloadLocation}
  PayloadLocationNaoEncontrado      = 'Location não encontrada para o idDNS.'; {404}
    //[GET|PATCH] /loc/{id}, DELETE /loc/{id}/txid.
  PayloadLocationOperacaoInvalida   = 'A presente requisição busca criar uma localização sem respeitar o esquema estabelecido.'; {400}
    //endpoints: POST /loc.
  PayloadLocationConsultaInvalida   = 'Os parâmetros de consulta à lista de locais não respeitam o esquema ou não fazem sentido semanticamente.'; {400}
    //endpoints: GET /loc e GET /loc/{id}.

  {Erros Tag Pix}
  PixNaoEncontrado                  = 'Pix não encontrada para a e2eidrede.'; {404}
    //endpoints: GET /pix/{e2eid}
  PixDevolucaoNaoEncontrada         = 'Devolução representada por {id} não encontrada para a e2eidInternet.'; {404}
    //endpoints: GET /pix/{e2eid}/devolucao/{id}
  PixConsultaInvalida               = 'Os parâmetros de consulta à lista de pix recebidos não respeitam o esquema ou não fazem sentido semanticamente.'; {403}
    //endpoints: GET /pix.
  PixDevolucaoInvalida              = 'A presente requisição de devolução não respeita o esquema ou não faz sentido semanticamente.'; {400}
    //endpoints: PUT /pix/{e2eid}/devolucao/{id}.

  {Erros Tag Webhook}
  WebhookOperacaoInvalida        = 'a presente requisição busca criar um webhook sem respeitar o schema ou, ainda, apresenta semântica inválida.'; {400}
    //endpoints: PUT /webhook/{chave}.
  WebhookNaoEncontrado        = 'o webhook denotado por {chave} não encontra-se estabelecido.'; {404}
    //endpoints: GET /webhook/{chave}, DELETE /webhook/{chave}
  WebhookConsultaInvalida        = 'os parâmetros de consulta à lista de webhooks ativados não respeitam o schema ou não fazem sentido semanticamente.'; {400}
    //endpoints: GET /webhook.





implementation

end.
