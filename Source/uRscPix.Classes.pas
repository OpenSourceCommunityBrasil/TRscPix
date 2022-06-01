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
    uRscPix.Pagador, uRscPix.Parametros, uRscPix.Loc;


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

  TRespLocPost = class(TTLocPost)
  end;

  TRespLocGet = class(TTLocGet)
  end;

  TRespLocDelete = class(TTLocDelete)
  end;




type
  TOnGetStatusCobranca  = procedure(Sender : TObject; Const sStatus: String = '')  of object;
  TNotifica             = procedure(Sender : TObject; Const Status: String = ''; Erro: String = '')  of object;
  TNotificaToken        = procedure(Sender : TObject; Const Token: TToken = nil; Erro: String = '')  of object;
  TNotificaCobPut       = procedure(Sender : TObject; Const RespCobPut: TRespCobPut = nil; Erro: String = '')  of object;
  TNotificaCobPatch     = procedure(Sender : TObject; Const RespCobPatch: TRespCobPatch = nil; Erro: String = '')  of object;
  TNotificaCobGet       = procedure(Sender : TObject; Const RespCobGet: TRespCobGet = nil; Erro: String = '')  of object;

  TNotificaPixPut       = procedure(Sender : TObject; Const RespPixPut: TRespPixPut = nil; Erro: String = '')  of object;
  TNotificaPixGet       = procedure(Sender : TObject; Const RespPixGet: TRespPixGet = nil; Erro: String = '')  of object;

  TNotificaLocPost      = procedure(Sender : TObject; Const RespLocPost: TRespLocPost = nil; Erro: String = '')  of object;
  TNotificaLocGet       = procedure(Sender : TObject; Const RespLocGet: TRespLocGet = nil; Erro: String = '')  of object;
  TNotificaLocDelete    = procedure(Sender : TObject; Const RespLocDelete: TRespLocDelete = nil; Erro: String = '')  of object;




implementation


{ TPixCobRevisa }

procedure TPixCobRevisa.SetStatusRevisa(const Value: string);
begin
  if Value = '' then
    raise Exception.Create('Informe o Status para Alteração.')
  else
    FStatusRevisa := Value;
end;

end.
