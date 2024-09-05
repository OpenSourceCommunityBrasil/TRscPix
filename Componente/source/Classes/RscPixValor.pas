unit RscPixValor;

interface

type

  TValor = class
  private
      Foriginal            : String;
      FmodalidadeAlteracao : Integer;
  public
      property original             : String  read Foriginal             write Foriginal;
      property modalidadeAlteracao  : Integer read FmodalidadeAlteracao  write FmodalidadeAlteracao;
  end;

implementation

end.
