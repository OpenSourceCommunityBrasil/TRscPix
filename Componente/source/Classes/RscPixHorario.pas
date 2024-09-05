unit RscPixHorario;

interface

type

  THorario = class
  private
    Fsolicitacao: string;
    Fliquidacao: string;
  public
    property solicitacao: string read Fsolicitacao write Fsolicitacao;
    property liquidacao: string read Fliquidacao write Fliquidacao;

  end;

implementation

end.
