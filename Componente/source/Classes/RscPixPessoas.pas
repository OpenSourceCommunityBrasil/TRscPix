unit RscPixPessoas;

interface

type

  TPagador = class
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

type

  TRecebedor = class
  private
      Fcpf        : String;
      Fcnpj       : String;
      Fnome       : String;
      Flogradouro : String;
      Fcidade     : String;
      FUF         : String;
      FCEP        : String;
  public
      property cpf         : String read Fcpf        write Fcpf;
      property cnpj        : String read Fcnpj       write Fcnpj;
      property nome        : String read Fnome       write Fnome;
      property logradouro  : String read Flogradouro write Flogradouro;
      property cidade      : String read Fcidade     write Fcidade;
      property uf          : String read FUF         write FUF;
      property cep         : String read FCEP        write FCEP;
  end;

implementation

end.
