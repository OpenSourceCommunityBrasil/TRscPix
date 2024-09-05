unit RscPixEndPoint;

interface
  uses
    Classes;

type

  TEndPoint = class(TPersistent)
  private
    FPixPut: string;
    FPixGetCP: string;
    FCobPut: string;
    FCobGet: string;
    FPixGetCD: string;
    FPixGetCPR: string;
    FCobPatch: string;
    FLocPost: string;
    FLocGetIdQrcode: string;
    FLocDelete: string;
    FLocGetId: string;
    FLocGet: string;
    FCobvPut: string;
    FCobvGet: string;
    FCobvEmvPut: string;
    FCobvPatch: string;
    FCobEmvPostS: string;
    FCobPost: string;
    FCobEmvPut: string;
    FCobGetS: string;
    FCobPostS: string;
    FWebhookPost: string;
    FWebhookPut: string;
    FWebhookGet: string;
    FWebhookDelete: string;
    FWebhookGetCWC: string;
    FCobvGetS: string;
  public
    property CobPut         : string read FCobPut         write FCobPut;
    property CobEmvPut      : string read FCobEmvPut      write FCobEmvPut;
    property CobPatch       : string read FCobPatch       write FCobPatch;
    property CobGet         : string read FCobGet         write FCobGet;
    property CobPost        : string read FCobPost        write FCobPost;
    property CobPostS       : string read FCobPostS       write FCobPostS;
    property CobEmvPostS    : string read FCobEmvPostS    write FCobEmvPostS;
    property CobGetS        : string read FCobGetS        write FCobGetS;

    property CobvPut        : string read FCobvPut        write FCobvPut;
    property CobvEmvPut     : string read FCobvEmvPut     write FCobvEmvPut;
    property CobvPatch      : string read FCobvPatch      write FCobvPatch;
    property CobvGet        : string read FCobvGet        write FCobvGet;
    property CobvGetS       : string read FCobvGetS       write FCobvGetS;

    property LocPost        : string read FLocPost        write FLocPost;
    property LocGet         : string read FLocGet         write FLocGet;
    property LocGetId       : string read FLocGetId       write FLocGetId;
    property LocDelete      : string read FLocDelete      write FLocDelete;
    property LocGetIdQrcode : string read FLocGetIdQrcode write FLocGetIdQrcode;

    property PixPut         : string read FPixPut         write FPixPut;
    property PixGetCPR      : string read FPixGetCPR      write FPixGetCPR;
    property PixGetCP       : string read FPixGetCP       write FPixGetCP;
    property PixGetCD       : string read FPixGetCD       write FPixGetCD;

    property WebhookPut     : string read FWebhookPut     write FWebhookPut;
    property WebhookPost    : string read FWebhookPost    write FWebhookPost;
    property WebhookGet     : string read FWebhookGet     write FWebhookGet;
    property WebhookDelete  : string read FWebhookDelete  write FWebhookDelete;
    property WebhookGetCWC  : string read FWebhookGetCWC  write FWebhookGetCWC;

  end;

implementation

end.
