unit uRscPix.Localizacao;

interface

type

  TLocalizacao = class
  private
    FId       : Integer;
    FLocation : string;
    FTipoCob  : string;
  public
    property Id         : Integer read FId        write FId;
    property Location   : string  read FLocation  write FLocation;
    property TipoCob    : string  read FTipoCob   write FTipoCob;
  end;

implementation

end.
