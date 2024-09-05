unit RscPixAutenticar;

interface

  uses
    Classes;

type

  TAutenticar = class(TPersistent)
    private
      FClient_ID: String;
      FClient_Secret: String;
      FApplication_key: String;
    published
      property Application_key  : String read FApplication_key  write FApplication_key;
      property Client_ID        : String read FClient_ID        write FClient_ID;
      property Client_Secret    : String read FClient_Secret    write FClient_Secret;
  end;

implementation

end.
