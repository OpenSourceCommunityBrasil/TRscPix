unit RscPixUtils;

interface

{$IF CompilerVersion >= 20} // Delphi 2009 and newer
  {$LEGACYIFEND ON}
{$IFEND}

  uses
    SysUtils
    , Math
    , Classes
    , IdHashMessageDigest
    {$IF CompilerVersion < 20} // Delphi 2009 and newer
    , ExtCtrls
    , Graphics
    {$ELSE}
    , System.TimeSpan
    {$IFEND}
    , DateUtils
    , Windows
    ;

  function TirarAcentoE(Texto: string): widestring;

  function StrZero(Numero: string; Quant: integer): String;

  function GetStrNumber(const S: string): string;

  function FormatDataPix(const ADate: TDateTime; AInputIsUTC: Boolean = False; AZzz: Boolean = False) : string ;

  function codificaURL(Const Url: string): string;

  function IsCNPJ(CNPJ: string): boolean;

  function IsCPF(CPF: string): boolean;

  function IsEMail(aStr: string): boolean;

  function IsCelular(aCelNumber: string): boolean;

{$IF CompilerVersion < 20} // Delphi 2009 and newer
const
  HoursPerDay   = 24;
  MinsPerHour   = 60;
  SecsPerMin    = 60;
  MSecsPerSec   = 1000;
  MinsPerDay    = HoursPerDay * MinsPerHour;
  SecsPerDay    = MinsPerDay * SecsPerMin;
  SecsPerHour   = SecsPerMin * MinsPerHour;
  MSecsPerDay   = SecsPerDay * MSecsPerSec;
{$IFEND}



implementation

function IsCharInSet(C: Char; const CharSet: TSysCharSet): Boolean;
begin
  {$IF CompilerVersion >= 20} // Delphi 2009 and newer
    Result := CharInSet(C, CharSet);
  {$ELSE}
    Result := C in CharSet;
  {$IFEND}
end;

function codificaURL(Const Url: string): string;
var
  aux : string;
begin

  aux :=  Url;

  {:}
  aux :=  StringReplace(aux, ':', '%3A', [rfReplaceAll]);
  {-}
  aux :=  StringReplace(aux, '-', '%2D', [rfReplaceAll]);

  Result  :=  aux;

end;

function FormatDataPix(const ADate: TDateTime; AInputIsUTC: Boolean = False; AZzz: Boolean = False): string;
const
  SDateFormat   : string = 'yyyy"-"mm"-"dd"T"hh":"nn":"ss"."zzz';
  SOffsetFormat : string = '%s%s%.02d:%.02d';
  Neg           : array[Boolean] of string = ('+', '-');
var
  Bias: Integer;
  {$IF CompilerVersion >= 20} // Delphi 2009 and newer
  TimeZone: TTimeZone;
  {$ELSE}
  LocalTime: TDateTime;
  TimeZoneInformation: TTimeZoneInformation;
  {$IFEND}
  OffsetHours, OffsetMinutes: Integer;
begin
  Result := FormatDateTime(SDateFormat, ADate);

  if AInputIsUTC then
  begin
    {$IF CompilerVersion >= 20} // Delphi 2009 and newer
    TimeZone := TTimeZone.Local;
    Bias := Trunc(TimeZone.GetUTCOffset(ADate).Negate.TotalMinutes);
    {$ELSE}
    GetTimeZoneInformation(TimeZoneInformation);
    Bias := -TimeZoneInformation.Bias; // Bias is in minutes and negated to get the offset

    if TimeZoneInformation.StandardDate.wMonth <> 0 then
    begin
      LocalTime :=  Now;
      if SystemTimeToDateTime(TimeZoneInformation.DaylightDate) < LocalTime then
        Inc(Bias, TimeZoneInformation.DaylightBias);
    end;
    {$IFEND}

    OffsetHours := Abs(Bias) div MinsPerHour;
    OffsetMinutes := Abs(Bias) mod MinsPerHour;
    Result := Format(SOffsetFormat, [Result, Neg[Bias < 0], OffsetHours, OffsetMinutes]);
  end
  else
  begin
    if AZzz then
      Result := Copy(Result, 1, Length(Result) - 4) + 'Z'
    else
      Result := Result + 'Z';
  end;
end;


function GetStrNumber(const S: string): string;
var
  vText : PChar;
begin
  vText := PChar(S);
  Result := '';
  while (vText^ <> #0) do
  begin
    {$IFDEF UNICODE}
    if CharInSet(vText^, ['0'..'9']) then
    {$ELSE}
    if vText^ in ['0'..'9'] then
    {$ENDIF}
      Result := Result + vText^;
    Inc(vText);
  end;
end;

function StrZero(Numero: string; Quant: integer): String;
var
  I:integer;
  Retorno : String;
begin
  Retorno := '';
  for I:=1 to quant-Length(Numero) do
    Retorno := Retorno + '0';
  Retorno := Retorno + Numero;
  StrZero := Retorno;
end;

function TirarAcentoE(Texto: string): widestring;
const
  ComAcentuacao = ' &àáâãäèéêëìíîïòóôõöùúûüçÀÁÁÂÃÄÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÇÇ`´ª°ºªÇÚ,<>'+'''';
  SemAcentuacao = ' EaaaaaeeeeiiiiooooouuuucAAAAAAEEEEIIIIOOOOOUUUUCC  aooaCU               ';
var
  i : Integer;
begin
  for i :=  1 to Length(Texto) do
    if Pos(Texto[i],  ComAcentuacao) <> 0 then
      Texto[i]  :=  SemAcentuacao[Pos(Texto[i],ComAcentuacao)];
  Result  :=  Trim(Texto);
end;

function IsCelular(aCelNumber: string): boolean;
var
  i: Integer;
begin
  Result  :=  False;
  // Verifica se o número de celular tem o formato esperado
  if (Length(aCelNumber) <> 13) or (aCelNumber[1] <> '+') then
    Exit;

  // Verifica se todos os caracteres após o código de país são dígitos
  for i := 2 to Length(aCelNumber) do
  begin
    if not IsCharInSet(aCelNumber[i], ['0'..'9']) then
      Exit;
  end;

  // Verifica se o padrão específico para números de celular é atendido
  if (StrToInt(aCelNumber[3]) in [6..9]) and (StrToInt(aCelNumber[4]) in [1..9]) and
     (StrToInt(aCelNumber[5]) in [0..9]) and (StrToInt(aCelNumber[6]) in [0..9]) and
     (StrToInt(aCelNumber[7]) in [0..9]) and (StrToInt(aCelNumber[8]) in [0..9]) and
     (StrToInt(aCelNumber[9]) in [0..9]) and (StrToInt(aCelNumber[10]) in [0..9]) and
     (StrToInt(aCelNumber[11]) in [0..9]) and (StrToInt(aCelNumber[12]) in [0..9]) then
    Result := True;
end;

function isCNPJ(CNPJ: string): boolean;
var
  dig13, dig14: ShortString;
  sm, i, r, peso: integer;
begin
  CNPJ  :=  GetStrNumber(CNPJ);
  // length - retorna o tamanho da string do CNPJ (CNPJ é um número formado por 14 dígitos)
  if ((CNPJ = '00000000000000') or (CNPJ = '11111111111111') or
    (CNPJ = '22222222222222') or (CNPJ = '33333333333333') or
    (CNPJ = '44444444444444') or (CNPJ = '55555555555555') or
    (CNPJ = '66666666666666') or (CNPJ = '77777777777777') or
    (CNPJ = '88888888888888') or (CNPJ = '99999999999999') or
    (length(CNPJ) <> 14)) then
  begin
    Result := False;
    exit;
  end;

  // "try" - protege o código para eventuais erros de conversão de tipo através da função "StrToInt"
  try
    { *-- Cálculo do 1o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 12 downto 1 do
    begin
      // StrToInt converte o i-ésimo caractere do CNPJ em um número
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1)) then
      dig13 := '0'
    else
      str((11 - r): 1, dig13);
    // converte um número no respectivo caractere numérico

    { *-- Cálculo do 2o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 13 downto 1 do
    begin
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1)) then
      dig14 := '0'
    else
      str((11 - r): 1, dig14);

    { Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig13 = ShortString(CNPJ[13])) and (dig14 = ShortString(CNPJ[14]))) then
      Result := True
    else
      Result := False;
  except
      Result := False;
  end;
end;

function isCPF(CPF: string): boolean;
var
  dig10, dig11: ShortString;
  S, i, r, peso: integer;
begin
  CPF  :=  GetStrNumber(CPF);
  // length - retorna o tamanho da string (CPF é um número formado por 11 dígitos)
  if ((CPF = '00000000000') or (CPF = '11111111111') or (CPF = '22222222222') or
    (CPF = '33333333333') or (CPF = '44444444444') or (CPF = '55555555555') or
    (CPF = '66666666666') or (CPF = '77777777777') or (CPF = '88888888888') or
    (CPF = '99999999999') or (length(CPF) <> 11)) then
  begin
    Result := False;
    exit;
  end;

  // try - protege o código para eventuais erros de conversão de tipo na função StrToInt
  try
    { *-- Cálculo do 1o. Digito Verificador --* }
    S := 0;
    peso := 10;
    for i := 1 to 9 do
    begin
      // StrToInt converte o i-ésimo caractere do CPF em um número
      S := S + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (S mod 11);
    if ((r = 10) or (r = 11)) then
      dig10 := '0'
    else
      str(r: 1, dig10); // converte um número no respectivo caractere numérico

    { *-- Cálculo do 2o. Digito Verificador --* }
    S := 0;
    peso := 11;
    for i := 1 to 10 do
    begin
      S := S + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (S mod 11);
    if ((r = 10) or (r = 11)) then
      dig11 := '0'
    else
      str(r: 1, dig11);

    { Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig10 = ShortString(CPF[10])) and (dig11 = ShortString(CPF[11]))) then
      Result := True
    else
      Result := False;
  except
    Result := False;
  end;
end;

function isEMail(aStr: string): boolean;
begin
  aStr := trim(UpperCase(aStr));
  try
    if Pos('@', aStr) > 1 then
    begin
      Delete(aStr, 1, Pos('@', aStr));
      Result := (length(aStr) > 0) and (Pos('.', aStr) > 2);
    end
    else
      Result := False;
  except
      Result := False;
  end;
end;

end.
