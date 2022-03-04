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

unit uRscPix.ErrosToString;

interface

  uses
    uRscPix.Constantes, System.SysUtils;



  function ErroGeralToString(Erro: Integer): String;
  function ErroCobPostPutPatchToString(Erro: Integer): String;
  function ErroCobGetPatchToString(Erro: Integer): String;

implementation

function ErroGeralToString(Erro: Integer): String;
begin
  case Erro of
    400: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  RequisicaoInvalida;
    401: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  NaoAutorizado;
    403: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  AcessoNegado;
    404: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  NaoEncontrado;
    405: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  NaoPermitido;
    410: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  PermanentementeRemovido;
    429: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  MuitosPedidos;
    500: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  ErroInternoDoServidor;
    503: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  ServicoIndisponivel;
    504: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  IndisponibilidadePorTempoEsgotado;
  else
    Result  :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  'Erro N�o Definido!';
  end;
end;

function ErroCobPostPutPatchToString(Erro: Integer): String;
begin
  case Erro of
    400: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  CobOperacaoInvalida;
    401: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  NaoAutorizado;
    403: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  AcessoNegado;
    404: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  NaoEncontrado;
    405: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  NaoPermitido;
    410: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  PermanentementeRemovido;
    429: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  MuitosPedidos;
    500: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  ErroInternoDoServidor;
    503: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  ServicoIndisponivel;
    504: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  IndisponibilidadePorTempoEsgotado;
  else
    Result  :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  'Erro N�o Definido!';
  end;
end;

function ErroCobGetPatchToString(Erro: Integer): String;
begin
  case Erro of
    400: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  CobConsultaInvalida;
    401: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  NaoAutorizado;
    403: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  AcessoNegado;
    404: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  CobNaoEncontrado;
    405: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  NaoPermitido;
    410: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  PermanentementeRemovido;
    429: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  MuitosPedidos;
    500: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  ErroInternoDoServidor;
    503: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  ServicoIndisponivel;
    504: Result :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  IndisponibilidadePorTempoEsgotado;
  else
    Result  :=  'C�d. Erro: '  + IntToStr(Erro) +  #13 +  'Erro N�o Definido!';
  end;
end;

end.

