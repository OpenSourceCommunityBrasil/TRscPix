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

unit uRscPix.ErrosToString;

interface

  uses
    uRscPix.Constantes, System.SysUtils;



  function ErroGeralToString(Erro: Integer): String;
   function ErroCobPostPutPatchToString(Erro: Integer): String;
  function ErroCobGetPatchToString(Erro: Integer): String;

  function ErroPixGetToString(Erro: Integer): String;
  function ErroPixPutToString(Erro: Integer): String;

implementation

function ErroGeralToString(Erro: Integer): String;
begin
  case Erro of
    400: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  RequisicaoInvalida;
    401: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  NaoAutorizado;
    403: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  AcessoNegado;
    404: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  NaoEncontrado;
    405: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  NaoPermitido;
    410: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  PermanentementeRemovido;
    429: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  MuitosPedidos;
    500: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  ErroInternoDoServidor;
    503: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  ServicoIndisponivel;
    504: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  IndisponibilidadePorTempoEsgotado;
  else
    Result  :=  '';
  end;
end;

function ErroCobPostPutPatchToString(Erro: Integer): String;
begin
  case Erro of
    400: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  CobOperacaoInvalida;
    401: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  NaoAutorizado;
    403: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  AcessoNegado;
    404: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  NaoEncontrado;
    405: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  NaoPermitido;
    410: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  PermanentementeRemovido;
    429: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  MuitosPedidos;
    500: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  ErroInternoDoServidor;
    503: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  ServicoIndisponivel;
    504: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  IndisponibilidadePorTempoEsgotado;
  else
    Result  :=  '';
  end;
end;

function ErroCobGetPatchToString(Erro: Integer): String;
begin
  case Erro of
    400: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  CobConsultaInvalida;
    401: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  NaoAutorizado;
    403: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  AcessoNegado;
    404: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  CobNaoEncontrado;
    405: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  NaoPermitido;
    410: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  PermanentementeRemovido;
    429: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  MuitosPedidos;
    500: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  ErroInternoDoServidor;
    503: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  ServicoIndisponivel;
    504: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  IndisponibilidadePorTempoEsgotado;
  else
    Result  :=  '';
  end;
end;

function ErroPixGetToString(Erro: Integer): String;
begin
  case Erro of
    400: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  RequisicaoInvalida;
    401: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  NaoAutorizado;
    403: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  PixConsultaInvalida;
    404: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  NaoEncontrado;
    405: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  NaoPermitido;
    410: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  PermanentementeRemovido;
    429: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  MuitosPedidos;
    500: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  ErroInternoDoServidor;
    503: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  ServicoIndisponivel;
    504: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  IndisponibilidadePorTempoEsgotado;
  else
    Result  :=  '';
  end;
end;

function ErroPixPutToString(Erro: Integer): String;
begin
  case Erro of
    400: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  PixDevolucaoInvalida;
    401: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  NaoAutorizado;
    403: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  AcessoNegado;
    404: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  NaoEncontrado;
    405: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  NaoPermitido;
    410: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  PermanentementeRemovido;
    429: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  MuitosPedidos;
    500: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  ErroInternoDoServidor;
    503: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  ServicoIndisponivel;
    504: Result :=  'Cód. Erro: '  + IntToStr(Erro) +  #13 +  IndisponibilidadePorTempoEsgotado;
  else
    Result  :=  '';
  end;
end;

end.

