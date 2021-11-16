unit uRscPix.Desenvolvedor;

interface

  uses
    System.Classes;

type

  TDeveloperSettings = class(TPersistent)
    private
      FClient_ID: String;
      FClient_Secret: String;
      FApplication_key: String;
      procedure SetApplication_key(const Value: String);
      procedure SetClient_ID(const Value: String);
      procedure SetClient_Secret(const Value: String);
    published
      property Application_key  : String read FApplication_key write SetApplication_key;
      property Client_ID        : String read FClient_ID write SetClient_ID;
      property Client_Secret    : String read FClient_Secret write SetClient_Secret;
  end;

implementation

{ TDeveloperSettings }

procedure TDeveloperSettings.SetApplication_key(const Value: String);
begin
  FApplication_key := Value;
end;

procedure TDeveloperSettings.SetClient_ID(const Value: String);
begin
  FClient_ID := Value;
end;

procedure TDeveloperSettings.SetClient_Secret(const Value: String);
begin
  FClient_Secret := Value;
end;

end.
