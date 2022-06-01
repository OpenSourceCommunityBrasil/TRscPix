unit uRscPix.Loc;

interface

type

  TTLoc = class
  private
    Fcriacao: string;
    Flocation: string;
    FtipoCob: string;
    Fid: integer;
    procedure Setcriacao(const Value: string);
    procedure Setid(const Value: integer);
    procedure Setlocation(const Value: string);
    procedure SettipoCob(const Value: string);
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }

  published
    { published declarations }
    property id       : integer read Fid        write Setid;
    property location : string  read Flocation  write Setlocation;
    property tipoCob  : string  read FtipoCob   write SettipoCob;
    property criacao  : string  read Fcriacao   write Setcriacao;
  end;



  TTLocGet = class(TTLoc)
  private
    Ftxid: string;
    FimagemQrcode: string;
    Fqrcode: string;
    procedure Settxid(const Value: string);
    procedure SetimagemQrcode(const Value: string);
    procedure Setqrcode(const Value: string);
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }

  published
    { published declarations }
    property  txid          : string read Ftxid         write Settxid;
    property  qrcode        : string read Fqrcode       write Setqrcode;
    property  imagemQrcode  : string read FimagemQrcode write SetimagemQrcode;

    property id;
    property location;
    property tipoCob;
    property criacao;
  end;

  TTLocDelete = class(TTLoc)
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }

  published
    { published declarations }
  end;

  TTLocPost = class(TTLoc)
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }

  published
    { published declarations }
  end;

implementation

{ TTLoc }

procedure TTLoc.Setcriacao(const Value: string);
begin
  Fcriacao := Value;
end;

procedure TTLoc.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TTLoc.Setlocation(const Value: string);
begin
  Flocation := Value;
end;

procedure TTLoc.SettipoCob(const Value: string);
begin
  FtipoCob := Value;
end;

{ TTLocGet }

procedure TTLocGet.SetimagemQrcode(const Value: string);
begin
  FimagemQrcode := Value;
end;

procedure TTLocGet.Setqrcode(const Value: string);
begin
  Fqrcode := Value;
end;

procedure TTLocGet.Settxid(const Value: string);
begin
  Ftxid := Value;
end;

end.
