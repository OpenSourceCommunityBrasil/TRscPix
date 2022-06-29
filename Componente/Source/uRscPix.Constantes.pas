{=======================================}
{             RSC SISTEMAS              }
{        SOLU��ES TECNOL�GICAS          }
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
{ Vers�o Original RSC SISTEMAS          }
{ Vers�o: 3.0.0                         }
{                                       }
{ Fa�a uma  doa��o:                     }
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

  VersaoComponente                            = '1.2.0.0'; {Vers�o anterior = 1.1.0.0 }

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
  Sucesso                           = 'Sucesso na Requisi��o.'; {200}
  ObteveExito                       = 'Exito na Cria��o.'; {201}
  RequisicaoInvalida                = 'Requisi��o inv�lida, h� algo de errado com os dados informados.'; {400}
  NaoAutorizado                     = 'N�o autorizado.'; {401}
  AcessoNegado                      = 'Requisi��o de participante autenticado que viola alguma regra de permiss�o.'; {403}
  NaoEncontrado                     = 'Entidade n�o encontrada.'; {404}
  NaoPermitido                      = 'M�todo n�o permitido.'; {405}
  PermanentementeRemovido           = 'Indica que a entidade existia, mas foi permanentemente removida.'; {410}
  MuitosPedidos                     = 'Muitos pedidos, Tente novamente em instantes'; {429}
  ErroInternoDoServidor             = 'Erro Interno do Servidor, Condi��o inesperada ao processar requisi��o.'; {500}
  ServicoIndisponivel               = 'Servi�o n�o est� dispon�vel no momento. Servi�o solicitado pode estar em manuten��o ou para a janela de funcionamento.'; {503}
  IndisponibilidadePorTempoEsgotado = 'Indica que o servi�o demorou al�m do esperado para retornar.'; {504}

  {Erros Tag CobPayload}
  CobPayloadNaoEncontrado           = 'A cobran�a em quest�o n�o foi encontrada para a localiza��o requisitada.'; {404 ou 410}
    //endpoints : GET /{pixUrlAccessToken}, GET /cobv/{pixUrlAccessToken}.
  CobPayloadOperacaoInvalida        = 'A cobran�a existe, mas a requisi��o � inv�lida.'; {400}
    //endpoints : GET /cobv/{pixUrlAccessToken}.

  {Erros Tag Cob}
  CobNaoEncontrado                  = 'Cobran�a n�o encontrada para o txid.'; {404}
    //endpoints : [GET|PATCH] /cob/{txid}.
  CobOperacaoInvalida               = 'A requisi��o que busca alterar ou criar uma cobran�a para pagamento imediato n�o respeita o esquema ou est� semanticamente errado.'; {400}
    //endpoints : [POST|PUT|PATCH] /cob/{txid}.
  CobConsultaInvalida               = 'Os par�metros de consulta � lista de cobran�as para pagamento imediato n�o respeitam o esquema ou n�o fazem sentido semanticamente.'; {400}
    //endpoints: GET /cob e GET /cob/{txid}.


  {Erros Tag CobV}
  CobVNaoEncontrada                 = 'Cobran�a com vencimento n�o encontrada para o txid.'; {404}
    //endpoints: [GET|PATCH] /cobv/{txid}.
  CobVOperacaoInvalida              = 'A requisi��o que busca alterar ou criar uma cobran�a com vencimento n�o respeita o esquema ou est� semanticamente errado.'; {400}
    //endpoints: [PUT|PATCH] /cobv/{txid}.
  CobVConsultaInvalida              = 'os par�metros de consulta � lista de cobran�as com vencimento n�o respeitam o esquema ou n�o fazem sentido semanticamente.'; {400}
    //endpoints: GET /cobv e GET /cobv/{txid}.

  {Erros Tag LoteCobV}
  LoteCobVNaoEncontrado             = 'Lote n�o encontrado para a idInternet.'; {404}
    //endpoints: [GET|PATCH] /lotecobv/{id}.
  LoteCobVOperacaoInvalida          = 'A requisi��o que busca alterar ou criar um lote de cobran�as com vencimento n�o respeita o esquema ou est� semanticamente incorreto.'; {400}
    //endpoints: [PUT|PATCH] /lotecobv/{id}.
  LoteCobVConsultaInvalida          = 'Os par�metros de consulta � lista de lotes de cobran�a com vencimento n�o respeitam o esquema ou n�o fazem sentido semanticamente.'; {400}
    //endpoints: GET /lotecobv e GET /lotecobv/{id}.

  {Erros Tag PayloadLocation}
  PayloadLocationNaoEncontrado      = 'Location n�o encontrada para o idDNS.'; {404}
    //[GET|PATCH] /loc/{id}, DELETE /loc/{id}/txid.
  PayloadLocationOperacaoInvalida   = 'A presente requisi��o busca criar uma localiza��o sem respeitar o esquema estabelecido.'; {400}
    //endpoints: POST /loc.
  PayloadLocationConsultaInvalida   = 'Os par�metros de consulta � lista de locais n�o respeitam o esquema ou n�o fazem sentido semanticamente.'; {400}
    //endpoints: GET /loc e GET /loc/{id}.

  {Erros Tag Pix}
  PixNaoEncontrado                  = 'Pix n�o encontrada para a e2eidrede.'; {404}
    //endpoints: GET /pix/{e2eid}
  PixDevolucaoNaoEncontrada         = 'Devolu��o representada por {id} n�o encontrada para a e2eidInternet.'; {404}
    //endpoints: GET /pix/{e2eid}/devolucao/{id}
  PixConsultaInvalida               = 'Os par�metros de consulta � lista de pix recebidos n�o respeitam o esquema ou n�o fazem sentido semanticamente.'; {403}
    //endpoints: GET /pix.
  PixDevolucaoInvalida              = 'A presente requisi��o de devolu��o n�o respeita o esquema ou n�o faz sentido semanticamente.'; {400}
    //endpoints: PUT /pix/{e2eid}/devolucao/{id}.

  {Erros Tag Webhook}
  WebhookOperacaoInvalida        = 'a presente requisi��o busca criar um webhook sem respeitar o schema ou, ainda, apresenta sem�ntica inv�lida.'; {400}
    //endpoints: PUT /webhook/{chave}.
  WebhookNaoEncontrado        = 'o webhook denotado por {chave} n�o encontra-se estabelecido.'; {404}
    //endpoints: GET /webhook/{chave}, DELETE /webhook/{chave}
  WebhookConsultaInvalida        = 'os par�metros de consulta � lista de webhooks ativados n�o respeitam o schema ou n�o fazem sentido semanticamente.'; {400}
    //endpoints: GET /webhook.





implementation

end.
