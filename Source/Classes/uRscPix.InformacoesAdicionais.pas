unit uRscPix.InformacoesAdicionais;

interface

type

  TInformacoesAdicionais = class
  private
      Fnome    : String;
      Fvalor   : String;
  public
      property nome  : String read Fnome  write Fnome;
      property valor : String read Fvalor write Fvalor;
  end;

implementation

end.
