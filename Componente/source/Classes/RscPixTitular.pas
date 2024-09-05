unit RscPixTitular;

interface
  uses
    Classes, RscPixTipos;
type

  TTitular = class(TPersistent)
    private
      FChavePix: string;
      FTipoChavePix: TTipoChavePIX;
      FDuracaoMinutos: integer;
    published
      property ChavePix       : string        read FChavePix        write FChavePix;
      property TipoChavePix   : TTipoChavePIX read FTipoChavePix    write FTipoChavePix;
      property DuracaoMinutos : integer       read FDuracaoMinutos  write FDuracaoMinutos Default 30;
  end;
implementation
end.
