unit uRscPix.Classes;

interface
  uses
    System.Classes,
    uRscPix.Certificado, uRscPix.Pix, uRscPix.Desenvolvedor,
    uRscPix.PSP, uRscPix.Pix.Cobranca, uRscPix.Token,
    uRscPix.Calendario, uRscPix.Recebedor, uRscPix.Localizacao,
    uRscPix.Valor, uRscPix.InformacoesAdicionais, uRscPix.Devolucao,
    uRscPix.Pagador;

type
  TOnGetStatusCobranca  = procedure(Sender : TObject; Const sStatus: String = '')  of object;

type

  TCertificado = class(TCertified)
  end;

  TPix = class(TTPix)
  end;

  TDeveloper = class(TDeveloperSettings)
  end;

  TPSP = class(TTPSP)
  end;

  TPixCobranca  = class(TTPixCobranca)
  end;

  TToken = class(TTToken)
  end;

  TCalendario = class(TTCalendario)
  end;

  TRecebedor = class(TTRecebedor)
  end;

  TLoc = class(TLocalizacao)
  end;

  TValor = class(TTValor)
  end;

  TInfo_Adicionais = class(TInformacoesAdicionais)
  end;

  TDevolucao = class(TTDevolucao)
  end;

  TPagador = class(TTPagador)
  end;



  TRetornoErroBcBR = class
  private
    Fmessage: string;
    Ferror: string;
    FstatusCode: integer;
    procedure Seterror(const Value: string);
    procedure Setmessage(const Value: string);
    procedure SetstatusCode(const Value: integer);
  public
    property statusCode : integer read FstatusCode write SetstatusCode;
    property error  : string read Ferror write Seterror;
    property  &message  : string read Fmessage write Setmessage;

  end;



  TRetornoErro = class(TRetornoErroBcBR)
    private
    Fdetail: string;
    Ftitle: string;
    Fstatus: string;
    Ftype: string;
    procedure Setdetail(const Value: string);
    procedure Setstatus(const Value: string);
    procedure Settitle(const Value: string);
    procedure Settype(const Value: string);

    public
      property &type : string read Ftype write Settype;
      property title :  string read Ftitle write Settitle;
      property status : string read Fstatus write Setstatus;
      property detail : string read Fdetail write Setdetail;
  end;


  TRetornoErroPostToken = class
    private
    Ferror: string;
    Ferror_description: string;
    procedure Seterror(const Value: string);
    procedure Seterror_description(const Value: string);
    public
      property error  : string read Ferror write Seterror;
      property error_description  : string read Ferror_description write Seterror_description;

  end;






implementation

{ TRetornoErro }

procedure TRetornoErro.Setdetail(const Value: string);
begin
  Fdetail := Value;
end;

procedure TRetornoErro.Setstatus(const Value: string);
begin
  Fstatus := Value;
end;

procedure TRetornoErro.Settitle(const Value: string);
begin
  Ftitle := Value;
end;

procedure TRetornoErro.Settype(const Value: string);
begin
  Ftype := Value;
end;

{ TRetornoErroBR }

procedure TRetornoErroBcBR.Seterror(const Value: string);
begin
  if Value = 'Not Found' then
    Ferror  :=  'Não encontrado'
  else
    Ferror := Value;
end;

procedure TRetornoErroBcBR.Setmessage(const Value: string);
begin
  if Value = 'Resource not found' then
    Fmessage  :=  'Recurso não encontrado'
  else
    Fmessage := Value;
end;

procedure TRetornoErroBcBR.SetstatusCode(const Value: integer);
begin
  FstatusCode := Value;
end;

{ TRetornoErroPostToken }

procedure TRetornoErroPostToken.Seterror(const Value: string);
begin
  if Value = 'invalid_request' then
    Ferror  :=  'pedido inválido'
  else
    Ferror := Value;
end;

procedure TRetornoErroPostToken.Seterror_description(const Value: string);
begin
  Ferror_description := Value;
end;


end.
