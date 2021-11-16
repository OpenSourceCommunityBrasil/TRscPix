unit uRscPix.Recebedor;

interface

type

  TTRecebedor = class
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
      property UF          : String read FUF         write FUF;
      property CEP         : String read FCEP        write FCEP;
  end;

implementation

end.
