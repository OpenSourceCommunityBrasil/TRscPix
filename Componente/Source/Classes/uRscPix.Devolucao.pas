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

unit uRscPix.Devolucao;

interface

type

   TDevolucaoHorario = class
  private
    fSolicitacao: string;
    fLiquidacao: string;
  public
    property Solicitacao: string read fSolicitacao write fSolicitacao;
    property Liquidacao : string read fLiquidacao write fSolicitacao;
  end;

  TTDevolucao = class
  private
    fId         : string;
    fRtrId      : string;
    fValor      : Currency;
    fHorario    : TDevolucaoHorario;
    fStatus     : string;
  public
    property Id       : string              read fId write fId;
    property RtrId    : string              read fRtrId write fRtrId;
    property Valor    : Currency            read fValor write fValor;
    property Horario  : TDevolucaoHorario   read fHorario write fHorario;
    property Status   : string              read fStatus write fStatus;
  end;

implementation

end.
