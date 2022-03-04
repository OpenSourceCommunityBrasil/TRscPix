unit uRscPix.ErrosToString;

interface

  uses
    uRscPix.Constantes, System.SysUtils;



  function ErroGeralToString(Erro: Integer): String;

implementation

function ErroGeralToString(Erro: Integer): String;
begin
  case Erro of
    400: Result :=  RequisicaoInvalida;
    403: Result :=  AcessoNegado;
    404: Result :=  NaoEncontrado;
    410: Result :=  PermanentementeRemovido;
    500: Result :=  ErroInternoDoServidor;
    503: Result :=  ServicoIndisponivel;
    504: Result :=  IndisponibilidadePorTempoEsgotado;
  else
    Result  :=  'Cód. Erro:'  + IntToStr(Erro) +  #13 +  'Erro Não Definido!';
  end;
end;

end.
