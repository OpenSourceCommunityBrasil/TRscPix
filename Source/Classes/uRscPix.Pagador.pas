unit uRscPix.Pagador;

interface

type

  TTPagador = class
  private
    Fcpf          : String;
    Fcnpj         : String;
    Fnome         : String;
    Finformacao   : String;

  public
    property cpf         : String read Fcpf        write Fcpf;
    property cnpj        : String read Fcnpj       write Fcnpj;
    property nome        : String read Fnome       write Fnome;
    property informacao  : String read Finformacao write Finformacao;
  end;

implementation

end.
