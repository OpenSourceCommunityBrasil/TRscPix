unit uRscPix.Calendario;

interface

type

  TTCalendario = class
  private
      Fcriacao : String;
      Fexpiracao: Integer;
      FdataDeVencimento : String;
      FvalidadeAposVencimento : Integer;

  public
      property criacao                : String  read Fcriacao                 write Fcriacao;
      property expiracao              : Integer read Fexpiracao               write Fexpiracao;
      property dataDeVencimento       : String  read FdataDeVencimento        write FdataDeVencimento;
      property validadeAposVencimento : Integer read FvalidadeAposVencimento  write FvalidadeAposVencimento;
  end;

implementation

end.
