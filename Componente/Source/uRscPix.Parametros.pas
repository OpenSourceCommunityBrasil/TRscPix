{=======================================}
{             RSC SISTEMAS              }
{        SOLUÇÕES TECNOLÓGICAS          }
{         rscsistemas.com.br            }
{          +55 92 4141-2737             }
{      contato@rscsistemas.com.br       }
{                                       }
{ Desenvolvidor por:                    }
{   Roniery Santos Cardoso              }
{     ronierys2@hotmail.com             }
{     +55 92 984391279                  }
{                                       }
{                                       }
{ Versão Original RSC SISTEMAS          }
{ Versão: 3.0.0                         }
{                                       }
{ Faça uma  doação:                     }
{ Pix - Email: ronierys2@hotmail.com    }
{ Banco: NuBank                         }
{                                       }
{                                       }
{                                       }
{ Componente TRscPix                    }
{ Componente OpenSource                 }
{ license Apache-2.0                    }
{                                       }
{=======================================}
unit uRscPix.Parametros;
interface
uses  System.Generics.collections

  ,uRscPix.funcoes, uRscPix.Pagador
  ,uRscPix.InformacoesAdicionais
  ,uRscPix.Calendario
  ,uRscPix.Devolucao
  ,uRscPix.Recebedor
  ,uRscPix.Valor
  ,uRscPix.Loc
  ,uRscPix.Tipos

      , System.SysUtils
      ;
type
  TPIXParams = class
      private
          FendToEndId  : String;
          FTXIDDev        : String;
          Fvalor       : Currency;
          Fhorario     : String;
          Fpagador     : TTPagador;
          FinfoPagador : string;
          FValorToString: String;
          FTXID: String;
          procedure SetValor(const Value: Currency);
      public
          property endToEndId   : String    read FendToEndId    write FendToEndId;
          property TXIDDev      : String    read FTXIDDev       write FTXIDDev;
          property TXID         : String    read FTXID          write FTXID;
          property valor        : Currency  read Fvalor         write SetValor;
          property ValorToString: String    read FValorToString;
          property horario      : String    read Fhorario       write Fhorario;
          property pagador      : TTPagador read Fpagador       write Fpagador;
          property infoPagador  : string    read FinfoPagador   write FinfoPagador;
          function ValidaDaddos:boolean;
    destructor Destroy; override;
  end;
  TPix_GetListPixsRecebPeriodo = class
    private
      FData_Hora_Ini: TDateTime;
      FIndex_Pag: integer;
      FData_Hora_Fim: TDateTime;
      FData_Hora_Fim_ToStr: String;
      FData_Hora_Ini_ToStr: String;
      FPSP: TTipoPSP;
      procedure SetData_Hora_Fim(const Value: TDateTime);
      procedure SetData_Hora_Ini(const Value: TDateTime);
    public
      property Data_Hora_Ini  : TDateTime read FData_Hora_Ini write SetData_Hora_Ini;
      property Data_Hora_Fim  : TDateTime read FData_Hora_Fim write SetData_Hora_Fim;
      property Index_Pag      : integer   read FIndex_Pag     write FIndex_Pag;
      property Data_Hora_Ini_ToStr  : String read FData_Hora_Ini_ToStr;
      property Data_Hora_Fim_ToStr  : String read FData_Hora_Fim_ToStr;
      property PSP                  : TTipoPSP  read FPSP write FPSP;
  end;


  TPaginacaoPixs = class
  private
      FquantidadeTotalDeItens: integer;
      FquantidadeDePaginas: integer;
      FpaginaAtual: integer;
      FitensPorPagina: integer;
      procedure SetitensPorPagina(const Value: integer);
      procedure SetpaginaAtual(const Value: integer);
      procedure SetquantidadeDePaginas(const Value: integer);
      procedure SetquantidadeTotalDeItens(const Value: integer);    
    public
      property paginaAtual: integer read FpaginaAtual write SetpaginaAtual;
      property itensPorPagina: integer read FitensPorPagina write SetitensPorPagina;
      property quantidadeDePaginas: integer read FquantidadeDePaginas write SetquantidadeDePaginas;
      property quantidadeTotalDeItens: integer read FquantidadeTotalDeItens write SetquantidadeTotalDeItens;
  end;


  TParametrosListaPixs = class
  private
    Ffim: string;
    Finicio: string;
    Fpaginacao: TPaginacaoPixs;
    procedure Setpaginacao(const Value: TPaginacaoPixs);  
  public
    property inicio : string read Finicio write Finicio;
    property fim    : string read Ffim    write Ffim;
    property paginacao: TPaginacaoPixs  read Fpaginacao write Setpaginacao;

    Constructor Create;
    destructor Destroy;override;
  end;

  TPix_Parametros = class
  private
    Fchave              : String;
    Ftxid               : String;
    Fstatus             : String;
    Fcalendario         : TTcalendario;
    FRecebedor          : TTRecebedor;
    Frevisao            : Integer;
    Flocation           : String;
    Fvalor              : TTValor;
    Fsolicitacaopagador : String;
    Finfo_adicionais    : TArray<TInformacoesAdicionais>;
    Finformacaopagador  : String;
    FDevolucao          : tArray<TTDevolucao>;
    fdata_inicio_criacao: String;
    fdata_final_criacao : String;
    ftextoImagemQRcode  : String;
    FPIX                : tArray<TPIXParams>;
    fpagador            : TTPagador;
    FHorario            : string;
    Fparametros         : TParametrosListaPixs;
    FendToEndID         : String;
    FinfoPagador        : string;
    Fdevedor            : TTPagador;
    Floc: TTLoc;
    FpixCopiaECola: string;
  public
    {Cob}
    property status               : String                          read Fstatus              write Fstatus;
    property calendario           : TTcalendario                    read Fcalendario          write Fcalendario;
    property location             : String                          read Flocation            write Flocation;
    property textoImagemQRcode    : String                          read ftextoImagemQRcode   write ftextoImagemQRcode;
    property txid                 : String                          read Ftxid                write Ftxid;
    property revisao              : Integer                         read Frevisao             write Frevisao;
    property valor                : TTValor                         read Fvalor               write Fvalor;
    property chave                : String                          read Fchave               write Fchave;
    property solicitacaopagador   : String                          read Fsolicitacaopagador  write Fsolicitacaopagador;
    property Recebedor            : TTRecebedor                     read FRecebedor           write FRecebedor;
    property info_adicionais      : TArray<TInformacoesAdicionais>  read Finfo_adicionais     write Finfo_adicionais;
    property data_inicio_criacao  : String                          read fdata_inicio_criacao write fdata_inicio_criacao;
    property data_final_criacao   : String                          read fdata_final_criacao  write fdata_final_criacao;
    property pix                  : TArray<TPIXParams>              read Fpix                 write Fpix;
    property endToEndId           : String                          read FendToEndID          write FendToEndID;
    property Horario              : string                          read FHorario             write FHorario;
    property infoPagador          : string                          read FinfoPagador         write FinfoPagador;
    property Pagador              : TTPagador                       read fpagador             write fpagador;
    property devedor              : TTPagador                       read Fdevedor             write Fdevedor;
    property parametros           : TParametrosListaPixs            read Fparametros          write Fparametros;
    property loc                  : TTLoc                           read Floc                 write Floc;
    property pixCopiaECola        : string                          read FpixCopiaECola       write FpixCopiaECola;

    Constructor Create;
    destructor Destroy;override;
  end;


  TPix_Put = class
  private
    fpagador: TTPagador;
    Fvalor: Currency;
    FendToEndID: String;
    FinfoPagador: string;
    Ftxid: String;
    FHorario: string;
    Fmotivo: String;
    Fid: String;
    Fstatus: String;
    FrtrId: String;
    procedure SetValor(const Value: Currency);
  public
    property endToEndId           : String                          read FendToEndID          write FendToEndID;
    property txid                 : String                          read Ftxid                write Ftxid;
    property valor                : Currency                        read Fvalor               write SetValor;
    property horario              : string                          read FHorario             write FHorario;
    property infoPagador          : string                          read FinfoPagador         write FinfoPagador;
    property pagador              : TTPagador                       read fpagador             write fpagador;
    {Devolução}
    property id                   : String                          read Fid                  write Fid;
    property status               : String                          read Fstatus              write Fstatus;
    property motivo               : String                          read Fmotivo              write Fmotivo;
    property rtrId                : String                          read FrtrId               write FrtrId;
    destructor Destroy;override;
  end;


  TPix_Get = class
  private
    fpagador: TTPagador;
    Fvalor: Currency;
    FendToEndID: String;
    FinfoPagador: string;
    Ftxid: String;
    Fparametros: TParametrosListaPixs;
    Fpix: TArray<TPIXParams>;
    Fstatus: String;
    Fmotivo: String;
    Fid: String;
    FrtrId: String;
    Fdevedor: TTPagador;
    procedure SetValor(const Value: Currency);
  public
    property endToEndId           : String                          read FendToEndID          write FendToEndID;
    property txid                 : String                          read Ftxid                write Ftxid;
    property valor                : Currency                        read Fvalor               write SetValor;
    property infoPagador          : string                          read FinfoPagador         write FinfoPagador;
    property Pagador              : TTPagador                       read fpagador             write fpagador;
    property devedor              : TTPagador                       read Fdevedor             write Fdevedor;
    {Devolução}
    property id                   : String                          read Fid                  write Fid;
    property status               : String                          read Fstatus              write Fstatus;
    property motivo               : String                          read Fmotivo              write Fmotivo;
    property rtrId                : String                          read FrtrId               write FrtrId;
    property pix                  : TArray<TPIXParams>              read Fpix                 write Fpix;
    property parametros           : TParametrosListaPixs            read Fparametros          write Fparametros;

    destructor Destroy;override;
    Constructor Create;
  end;


implementation

{ TPix_Entrada }

constructor TPix_Parametros.Create;
begin
  Fparametros :=  TParametrosListaPixs.Create;
end;

destructor TPix_Parametros.Destroy;
var Vinfo_adicionais : TInformacoesAdicionais;
    Vdevolucao : TTDevolucao;
    Vpix : TPIXParams;
begin

  if Floc <> nil then
    Floc.Free;

  if Fdevedor <> nil then
    Fdevedor.Free;

  if  Assigned(FRecebedor) then
    FRecebedor.Free;

  if  Assigned(Fvalor) then
    Fvalor.DisposeOf;

  if  Assigned(Fpagador) then
    Fpagador.Free;

  if  Assigned(Fcalendario) then
    Fcalendario.DisposeOf;

  for Vinfo_adicionais in Finfo_adicionais do
    Vinfo_adicionais.Free;

  for Vdevolucao in FDevolucao do
    Vdevolucao.Free;

  for Vpix in Fpix do
    Vpix.Free;

  Fparametros.DisposeOf;

  inherited;
end;


{ TPIX }

destructor TPIXParams.Destroy;
begin
  if  Assigned(Fpagador) then
    Fpagador.Free;
  inherited;
end;

procedure TPIXParams.SetValor(const Value: Currency);
begin
  if Value < 0 then
    begin
      raise Exception.Create('Somente Valores Positivos são válidos!');
      Exit;
    end;
  FValor := Value;
  if FValor > 0 then
    begin
      FValorToString := FormatFloat('#0.00', FValor);
      if Pos(',', FValorToString) > 0 then
         FValorToString := StringReplace(FValorToString,',','.',[rfReplaceAll]);
    end
  else
    FValorToString  :=  '0';
end;
function TPIXParams.ValidaDaddos: boolean;
var
  Erro  : String;
begin
  Erro  :=  '';
  Result  :=  True;
  if Valor < 0 then
    begin
      Erro  :=  'O valor deve ser maior que Zero!';
    end;
  if endToEndId = '' then
    begin
      if Erro <> '' then
        Erro  :=  Erro  + #13 + 'O E2eid deve ser informado!'
      else
        Erro  :=  'O E2eid deve ser informado!';
    end;
  if TXIDDev = '' then
    begin
      if Erro <> '' then
        Erro  :=  Erro  + #13 + 'O TXIDDev deve ser informado!'
      else
        Erro  :=  'O TXIDDev deve ser informado!';
    end;
  if Erro <> '' then
    begin
      Result  :=  False;
      raise Exception.Create(Erro);
    end;
end;

{ TPix_GetListPixsRecebPeriodo }
procedure TPix_GetListPixsRecebPeriodo.SetData_Hora_Fim(const Value: TDateTime);
begin
  FData_Hora_Fim := Value;

  case FPSP of
    pspSicredi, pspBancoDoBrasil, pspGerencianet:
      begin
        FData_Hora_Fim_ToStr  :=  FormatDataPix(FData_Hora_Fim, True);
      end;

    pspBradesco, pspSicoob:
      begin
        FData_Hora_Fim_ToStr  :=  FormatDataPix(FData_Hora_Fim);
      end;

    pspSantander:
      begin
        FData_Hora_Fim_ToStr  :=  FormatDataPix(FData_Hora_Fim, False, True);
      end;

  else
    FData_Hora_Fim_ToStr  :=  FormatDataPix(FData_Hora_Fim);
  end;

  case FPSP of
    pspSicredi: ;
    pspBancoDoBrasil: ;
    pspBradesco: ;
    pspSantander: ;
    pspSicoob: FData_Hora_Fim_ToStr :=  codificaURL(FData_Hora_Fim_ToStr);
    pspGerencianet: ;
    pspPagSeguro: ;
  end;
end;
procedure TPix_GetListPixsRecebPeriodo.SetData_Hora_Ini(const Value: TDateTime);
begin
  FData_Hora_Ini := Value;

  case FPSP of
    pspSicredi, pspBancoDoBrasil, pspGerencianet:
      begin
        FData_Hora_Ini_ToStr  :=  FormatDataPix(FData_Hora_Ini, True);
      end;

    pspBradesco, pspSicoob:
      begin
        FData_Hora_Ini_ToStr  :=  FormatDataPix(FData_Hora_Ini);
      end;

    pspSantander:
      begin
        FData_Hora_Ini_ToStr  :=  FormatDataPix(FData_Hora_Ini, False, True);
      end;

  else
    FData_Hora_Ini_ToStr  :=  FormatDataPix(FData_Hora_Ini);
  end;

  case FPSP of
    pspSicredi: ;
    pspBancoDoBrasil: ;
    pspBradesco: ;
    pspSantander: ;
    pspSicoob: FData_Hora_Ini_ToStr :=  codificaURL(FData_Hora_Ini_ToStr);
    pspGerencianet: ;
    pspPagSeguro: ;
  end;
end;


{ TPix_Get }

constructor TPix_Get.Create;
begin
  fpagador  :=  TTPagador.Create;
end;

destructor TPix_Get.Destroy;
var Vinfo_adicionais : TInformacoesAdicionais;
    Vdevolucao : TTDevolucao;
    Vpix : TPIXParams;
begin

  if  fpagador <> nil then
    fpagador.Free;
//
//  if  Assigned(Fvalor) then
//    Fvalor.DisposeOf;
//
//  if  Assigned(Fpagador) then
//    Fpagador.Free;
//
//  if  Assigned(Fcalendario) then
//    Fcalendario.DisposeOf;
//
//  for Vinfo_adicionais in Finfo_adicionais do
//    Vinfo_adicionais.Free;
//
//  for Vdevolucao in FDevolucao do
//    Vdevolucao.Free;
  for Vpix in Fpix do
    Vpix.Free;
  if Assigned(Fparametros) then
    Fparametros.Free;
  inherited;
end;
procedure TPix_Get.SetValor(const Value: Currency);
begin
  Fvalor := Value;
end;
{ TPix_Put }
destructor TPix_Put.Destroy;
begin
  inherited;
end;
procedure TPix_Put.SetValor(const Value: Currency);
begin
end;
{ TPaginacaoPixs }

procedure TPaginacaoPixs.SetitensPorPagina(const Value: integer);
begin
  FitensPorPagina := Value;
end;

procedure TPaginacaoPixs.SetpaginaAtual(const Value: integer);
begin
  FpaginaAtual := Value;
end;

procedure TPaginacaoPixs.SetquantidadeDePaginas(const Value: integer);
begin
  FquantidadeDePaginas := Value;
end;


procedure TPaginacaoPixs.SetquantidadeTotalDeItens(const Value: integer);
begin
  FquantidadeTotalDeItens := Value;
end;

{ TParametrosListaPixs }

constructor TParametrosListaPixs.Create;
begin
  Fpaginacao  :=  TPaginacaoPixs.Create;
end;

destructor TParametrosListaPixs.Destroy;
begin
  Fpaginacao.DisposeOf;
  inherited;
end;

procedure TParametrosListaPixs.Setpaginacao(const Value: TPaginacaoPixs);
begin
  Fpaginacao := Value;
end;

end.
