unit RscPixCalendario;

interface

type

  TBaseCalendario = class
  private
      Fcriacao : String;
      Fexpiracao: Integer;

  public
      property criacao                : String  read Fcriacao                 write Fcriacao;
      property expiracao              : Integer read Fexpiracao               write Fexpiracao;
  end;

  TCalendarioCob = class(TBaseCalendario)
  end;

  TCalendarioCobV = class(TBaseCalendario)
  private
    FdataDeVencimento: String;
    FvalidadeAposVencimento: Integer;
    public
      property dataDeVencimento       : String  read FdataDeVencimento        write FdataDeVencimento;
      property validadeAposVencimento : Integer read FvalidadeAposVencimento  write FvalidadeAposVencimento;
  end;

implementation

end.
