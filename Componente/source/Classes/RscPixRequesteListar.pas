unit RscPixRequesteListar;

interface

  uses
    RscPixTipos
    , RscPixUtils
    ;

type

  TRequesteListar = class
  private
    FData_Hora_Ini: TDateTime;
    FData_Hora_Fim: TDateTime;
    FIndex_Pag: integer;
    FPSP: TTipoPSP;
  function GetData_Hora_Fim_ToStr: String;
  function GetData_Hora_Ini_ToStr: String;
  public
    property Data_Hora_Ini        : TDateTime read FData_Hora_Ini write FData_Hora_Ini;
    property Data_Hora_Fim        : TDateTime read FData_Hora_Fim write FData_Hora_Fim;
    property Index_Pag            : integer   read FIndex_Pag     write FIndex_Pag;
    property Data_Hora_Ini_ToStr  : String    read GetData_Hora_Ini_ToStr;
    property Data_Hora_Fim_ToStr  : String    read GetData_Hora_Fim_ToStr;
    property PSP                  : TTipoPSP  read FPSP write FPSP;

 end;


implementation

{ TPix_ListPixsRecebPeriodo }

function TRequesteListar.GetData_Hora_Fim_ToStr: String;
begin
  case FPSP of
    pspSicredi:
      begin
        Result  :=  FormatDataPix(FData_Hora_Fim, True);
      end;

    pspBradesco, pspSicoob, pspBancoDoBrasil:
      begin
        Result  :=  FormatDataPix(FData_Hora_Fim);
      end;

    pspSantander:
      begin
        Result  :=  FormatDataPix(FData_Hora_Fim, False, True);
      end;

  else
    Result  :=  FormatDataPix(FData_Hora_Fim);
  end;

  case FPSP of
    pspSicredi: ;
    pspBancoDoBrasil: ;
    pspBradesco: ;
    pspSantander: ;
    pspSicoob: Result :=  codificaURL(Result);
//    pspEfi: ;
    pspPagSeguro: ;
  end;
end;

function TRequesteListar.GetData_Hora_Ini_ToStr: String;
begin
  case FPSP of
    pspSicredi:
      begin
        Result  :=  FormatDataPix(FData_Hora_Ini, True);
      end;

    pspBradesco, pspSicoob, pspBancoDoBrasil:
      begin
        Result  :=  FormatDataPix(FData_Hora_Ini);
      end;

    pspSantander:
      begin
        Result  :=  FormatDataPix(FData_Hora_Ini, False, True);
      end;

  else
    Result  :=  FormatDataPix(FData_Hora_Ini);
  end;

  case FPSP of
    pspSicredi: ;
    pspBancoDoBrasil: ;
    pspBradesco: ;
    pspSantander: ;
    pspSicoob: Result :=  codificaURL(Result);
//    pspEfi: ;
    pspPagSeguro: ;
  end;
end;

end.
