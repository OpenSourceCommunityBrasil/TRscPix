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
