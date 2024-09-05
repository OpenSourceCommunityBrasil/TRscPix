unit RscPixToken;

interface
  uses
    RscJSON;

type
  TToken  = class
  private
    FAccessToken: string;
    FTokenType: string;
    FExpires_in: Integer;
    FScope: string;
  public
    function ToJson: string;
    procedure LoadJson(sJson: string);
    property AccessToken : string   read FAccessToken write FAccessToken;
    property TokenType  : string  read FTokenType   write FTokenType;
    property Expires_in : Integer read FExpires_in  write FExpires_in;
    property Scope      : string  read FScope       write FScope;
  end;
implementation
{ TToken }

procedure TToken.LoadJson(sJson: string);
var
  RespJson  : TRscJSONobject;
begin
  RespJson          :=  TRscJSON.LoadFromstring(sJson) as TRscJSONobject;
  try
    FAccessToken := RespJson.GetValue('access_token').AsString;
    FTokenType   := RespJson.GetValue('token_type').AsString;
    FExpires_in  := RespJson.GetValue('expires_in').AsInteger;
    FScope       := RespJson.GetValue('scope').AsString;
  finally
    RespJson.Free;
  end;
end;

function TToken.ToJson: string;
var
  aJson : TRscJSONobject;
begin
  aJson := TRscJSONobject.Create;
  try
    aJson.AddPair('access_token', FAccessToken);
    aJson.AddPair('token_type', FTokenType);
    aJson.AddPair('expires_in', FExpires_in);
    aJson.AddPair('scope', FScope);
  finally
    Result  :=  aJson.ToJson;
    aJson.Free;
  end;
end;

end.
