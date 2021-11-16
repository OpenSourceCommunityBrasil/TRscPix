unit uRscPix.Token;

interface

type
  TTToken  = class
  private
    FAcessToken: string;
    FTokenType: string;
    FExpires_in: Integer;
    procedure SetAcessToken(const Value: string);
    procedure SetExpires_in(const Value: Integer);
    procedure SetTokenType(const Value: string);

  published

    property Expires_in            : Integer read FExpires_in write SetExpires_in;
    property AcessToken            : string read FAcessToken write SetAcessToken;
    property TokenType             : string read FTokenType write SetTokenType;

  end;

implementation

{ TTPixCobranca }

procedure TTToken.SetAcessToken(const Value: string);
begin
  FAcessToken := Value;
end;

procedure TTToken.SetExpires_in(const Value: Integer);
begin
  FExpires_in := Value;
end;

procedure TTToken.SetTokenType(const Value: string);
begin
  FTokenType := Value;
end;

end.
