unit PIX_Tela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.CheckLst,
  Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ComCtrls, ACBrGIF, Data.FMTBcd,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, ACBrBase,
  ACBrPosPrinter, uDWResponseTranslator, uDWAbout, RLPrinters,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, System.DateUtils,

  RscPix, uRscPix.Variaveis, uRscPix.funcoes,
  uRscPix.Tipos, uRscPix.Classes;

type
  TfrmPIX_Tela = class(TForm)
    Panel1: TPanel;
    imgLogo: TImage;
    imgQRCODE: TImage;
    btnImprQrCode: TBitBtn;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    pbProgress: TProgressBar;
    TimerConsultar: TTimer;
    lblValor: TLabel;
    lblStatus: TLabel;
    ACBrPosPrinterPIX: TACBrPosPrinter;
    Memo1: TMemo;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    FDMemTable1pagador: TStringField;
    FDMemTable1inforpagador: TStringField;
    FDMemTable1endtoebdid: TStringField;
    FDMemTable1txid: TStringField;
    FDMemTable1valor: TCurrencyField;
    FDMemTable1horario: TStringField;
    RscPix1: TRscPix;
    DWClientREST1: TDWClientREST;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprQrCodeClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TimerConsultarTimer(Sender: TObject);
    procedure RscPix1OnGetStatusCobranca(Sender: TObject;
      const sStatus: string);
  private
    { Private declarations }
    bRecebido  : Boolean;
    cQrCode,
    cFantasia  : String;



  public
    { Public declarations }
    procedure GerarPix;
    procedure AtualizarPix(cStatus : String);
    procedure ConsultaPixPorTXID(dMostraMensagem : Boolean);
    procedure ConsultaListaPixPorPeriodo(dMostraMensagem : Boolean);
    procedure ConsultarPixRecebido(dMostraMensagem : Boolean);
    procedure SolicitarDevolucaoPixRecebido(dMostraMensagem : Boolean);
    procedure ConsultarDevolucaoPixRecebido(dMostraMensagem : Boolean);


  end;

var
  frmPIX_Tela: TfrmPIX_Tela;

implementation

{$R *.dfm}

Function Limpalixo(Value : String) : String;
Begin
 Result := StringReplace(StringReplace(StringReplace(Value, '-', '', [rfReplaceAll]),
                                                            '.', '', [rfReplaceAll]),
                                                            '/', '', [rfReplaceAll]);
End;

procedure TfrmPIX_Tela.btnCancelarClick(Sender: TObject);
begin
  //verificar aqui se foi gerado o PIX
  AtualizarPix('REMOVIDA_PELO_USUARIO_RECEBEDOR');

  if RscPix1.Resultado_Cod <> 0 then
    Close;
end;

procedure TfrmPIX_Tela.btnConfirmarClick(Sender: TObject);
begin
    //aqui vou confirmar o recebimento
    ConsultaPixPorTXID(True);
    if bRecebido = True then
    begin
        RscPix1.RecebidoTagPIX := True;
        Close;
    end
    else
     MessageBox(0, 'Recebimento de PIX não confirmado!', 'Atenção', mb_IconInformation + mb_ok);
end;

procedure TfrmPIX_Tela.ConsultaListaPixPorPeriodo(dMostraMensagem: Boolean);
var
  i:  Integer;
begin

  RscPix1.DateConsutInicial :=  IncDay(Now, -30);
  RscPix1.DateConsutFinal :=  Now;

  RscPix1.ConsultarListaPixsRecebidos;

  if RscPix1.Resultado_Cod = 200 then
  begin

    DBGrid1.Visible :=  True;
    DBGrid1.Align :=  TAlign.alClient;

      lblStatus.Caption := 'Situação: ' +  RscPix1.Resultado.status;

      FDMemTable1.Open;
      for i := Low(RscPix1.Resultado.pix) to High(RscPix1.Resultado.pix) do
      begin
        FDMemTable1.Append;

        if RscPix1.Resultado.pix[i].pagador.cpf = EmptyStr then
          FDMemTable1pagador.Value  :=  RscPix1.Resultado.pix[i].pagador.cnpj
        else
          FDMemTable1pagador.Value  :=  RscPix1.Resultado.pix[i].pagador.cpf;

        FDMemTable1inforpagador.Value   :=  RscPix1.Resultado.pix[i].infoPagador;
        FDMemTable1endtoebdid.Value     :=  RscPix1.Resultado.pix[i].endToEndId;
        FDMemTable1txid.Value           :=  RscPix1.Resultado.pix[i].txid;
        FDMemTable1valor.Value          :=  RscPix1.Resultado.pix[i].valor;
        FDMemTable1horario.Value        :=  RscPix1.Resultado.pix[i].horario;

        FDMemTable1.Post;
      end;
  end
  else
  begin
    DBGrid1.Visible :=  False;
    DBGrid1.Align :=  TAlign.alNone;

      if dMostraMensagem = True then
        MessageBox(0,PChar('Erro ao Consultar o PIX, tente novamente!'  + #13#10  + RscPix1.Retorno), 'Atenção', mb_IconInformation + mb_ok);
  end;
end;

procedure TfrmPIX_Tela.ConsultaPixPorTXID(dMostraMensagem : Boolean);
begin
  RscPix1.ConsultarCobranca;
end;

procedure TfrmPIX_Tela.ConsultarDevolucaoPixRecebido(dMostraMensagem: Boolean);
var
  cValor: string;
begin
  RscPix1.ConsultarDevolucaoPix;

  if RscPix1.Resultado_Cod = 200 then
  begin
    cValor := StringReplace(FloatToStr(RscPix1.Resultado.valor), '.', ',', [rfReplaceAll]);
    lblValor.Caption := 'R$ '+FormatFLoat('###,###,##0.00',StrToCurr(cValor));

      lblStatus.Caption := 'Nome Pagador: ' +  RscPix1.Resultado.Pagador.nome;

      memo1.Text  :=  RscPix1.Retorno;

  end
  else
  begin
    DBGrid1.Visible :=  False;
    DBGrid1.Align :=  TAlign.alNone;

    if RscPix1.Resultado.status = '404' then
      begin
        if dMostraMensagem = True then
          MessageBox(0,PChar('Solicitação de devolução não encontrada, verifique se passou as informações corretas.'), 'Atenção', mb_IconInformation + mb_ok);
      end
    else
      begin
        if dMostraMensagem = True then
          MessageBox(0,PChar('Erro ao Consultar o PIX, tente novamente!'  + #13#10  + RscPix1.Retorno), 'Atenção', mb_IconInformation + mb_ok);
      end;
  end;
end;

procedure TfrmPIX_Tela.ConsultarPixRecebido(dMostraMensagem: Boolean);
var
  cValor: string;
begin
  RscPix1.ConsultarPixRecebido;

  if RscPix1.Resultado_Cod = 200 then
  begin
    cValor := StringReplace(FloatToStr(RscPix1.Resultado.valor), '.', ',', [rfReplaceAll]);
    lblValor.Caption := 'R$ '+FormatFLoat('###,###,##0.00',StrToCurr(cValor));

      lblStatus.Caption := 'Nome Pagador: ' +  RscPix1.Resultado.Pagador.nome;

      memo1.Text  :=  RscPix1.Retorno;

  end
  else
  begin
    DBGrid1.Visible :=  False;
    DBGrid1.Align :=  TAlign.alNone;

      if dMostraMensagem = True then
        MessageBox(0,PChar('Erro ao Consultar o PIX, tente novamente!'  + #13#10  + RscPix1.Retorno), 'Atenção', mb_IconInformation + mb_ok);
  end;
end;

procedure TfrmPIX_Tela.btnImprQrCodeClick(Sender: TObject);
var
  mImp  : TStringList;
begin
  try
    if (ACBrPosPrinterPIX.Porta <> '') then
      ACBrPosPrinterPIX.Ativar
    else
      raise Exception.Create('Porta não definida');

    ACBrPosPrinterPIX.CortaPapel    := True;
    ACBrPosPrinterPIX.TraduzirTags  := True;

    //Configurando o QrCOde
    ACBrPosPrinterPIX.configqrcode.Tipo               := 2;
    ACBrPosPrinterPIX.configqrcode.LarguraModulo      := 6;//4;
    ACBrPosPrinterPIX.configqrcode.ErrorLevel         := 0;

    //aplicando
    mImp  := TStringList.Create;
    mImp.Clear;
    mImp.Add('</zera>');
    mImp.Add('</ce>');
    mImp.Add('<a><n>'+cFantasia+'</n></a>');
    mImp.Add('</ce>');
    mImp.Add('<qrcode>'+cQrCode+'</qrcode>');
    mImp.Add('</ce>');
    mImp.Add('<n><e><a>'+lblValor.Caption+'</a></e></n>');
    mImp.Add('</fn>');
    mImp.Add('</ce>');
    mImp.Add('</corte_total>');
    ACBrPosPrinterPIX.Ativar;
    ACBrPosPrinterPIX.Buffer.Text := mImp.Text;
    ACBrPosPrinterPIX.Imprimir;

  finally
    ACBrPosPrinterPIX.Desativar;
    mImp.Free;
  end;
end;

procedure TfrmPIX_Tela.FormCreate(Sender: TObject);
begin
  bRecebido     := False;
  cQrCode   := '';
  cFantasia := '';
end;

procedure TfrmPIX_Tela.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_Escape then
  begin
    Key := 0;
    btnCancelar.SetFocus;
    btnCancelar.Click;
  end;
end;

procedure TfrmPIX_Tela.GerarPix;
var
    cValor : String;
begin

  RscPix1.CriarCobranca;

  if RscPix1.Resultado_Cod = 200 then
  begin
    case RscPix1.PixCobranca.TipoQRCode of
      tqDinamico:
        begin
          TimerConsultar.enabled := True; {criar uma função interna para fazer essa consulta}
        end;
      tqEstatico:
        begin
          TimerConsultar.enabled := False;
        end;
    end;

      lblStatus.Caption := 'Situação: '+RscPix1.Resultado.status;

      if RscPix1.Resultado.textoImagemQRcode <> '' then
      begin
        Memo1.Text  :=  RscPix1.Resultado.textoImagemQRcode;
        QRCodeWin(imgQRCODE, RscPix1.Resultado.textoImagemQRcode);
        cQrCode := RscPix1.Resultado.textoImagemQRcode;
      end
      else
      begin
        Memo1.Text  :=  RscPix1.Resultado.location;
        QRCodeWin(imgQRCODE, RscPix1.Resultado.location);
        cQrCode := RscPix1.Resultado.location;
      end;

      cValor := StringReplace(FloatToStr(RscPix1.Resultado.valor), '.', ',', [rfReplaceAll]);
      lblValor.Caption := 'R$ '+FormatFLoat('###,###,##0.00',StrToCurr(cValor));
  end
  else
  begin
      lblStatus.Caption  := 'Situação: Erro ao Gerar';
      MessageBox(0, PChar(RscPix1.Retorno), PChar('Erro'), MB_ICONERROR + mb_ok);
//      MessageBox(0, PChar(RscPix1.ResultadoErro.message  + #13#10  + 'Código Erro: ' + RscPix1.ResultadoErro.statusCode.ToString), PChar(RscPix1.ResultadoErro.error), MB_ICONERROR + mb_ok);
  end;
end;



procedure TfrmPIX_Tela.RscPix1OnGetStatusCobranca(Sender: TObject;
  const sStatus: string);
var
  cValor: string;
begin
  if RscPix1.Resultado_Cod = 200 then
  begin
      lblStatus.Caption := 'Situação: ' +  RscPix1.Resultado.status;

      if sStatus = 'CONCLUIDA' then
      begin
          //Verificar se Foi Recebido aqui e Ja alterar para Recebido
          if RscPix1.RecebidoTagPIX = True then
          begin
              if Assigned(RscPix1.Resultado.pix) then
              begin
                  bRecebido := True;
              end
              else
               MessageBox(0,'Expirado ou Cancelado!', 'Atenção', mb_IconInformation + mb_ok);
          end
          else
          begin
                bRecebido := True;
          end;
      end;

      if sStatus = 'ATIVA' then
      begin
        if RscPix1.Resultado.textoImagemQRcode <> '' then
          begin
            Memo1.Text  :=  RscPix1.Resultado.textoImagemQRcode;
            QRCodeWin(imgQRCODE, RscPix1.Resultado.textoImagemQRcode);
            cQrCode := RscPix1.Resultado.textoImagemQRcode;
          end
        else
          begin
            Memo1.Text  :=  RscPix1.Resultado.location;
            QRCodeWin(imgQRCODE, RscPix1.Resultado.location);
            cQrCode := RscPix1.Resultado.location;
          end;
      end;

    cValor := StringReplace(FloatToStr(RscPix1.Resultado.valor), '.', ',', [rfReplaceAll]);
    lblValor.Caption := 'R$ '+FormatFLoat('###,###,##0.00',StrToCurr(cValor));
  end
  else
  begin
        MessageBox(0,PChar(RscPix1.Retorno),
                  PChar('erro'), mb_IconInformation + mb_ok);
  end;
end;

procedure TfrmPIX_Tela.SolicitarDevolucaoPixRecebido(dMostraMensagem: Boolean);
var
  cValor: string;
begin
  RscPix1.SolicitarDevolucaoPix;

  if RscPix1.Resultado_Cod = 200 then
  begin
    cValor := StringReplace(FloatToStr(RscPix1.Resultado.valor), '.', ',', [rfReplaceAll]);
    lblValor.Caption := 'R$ '+FormatFLoat('###,###,##0.00',StrToCurr(cValor));

      lblStatus.Caption := 'Nome Pagador: ' +  RscPix1.Resultado.Pagador.nome;

      memo1.Text  :=  RscPix1.Retorno;

  end
  else
  begin
    DBGrid1.Visible :=  False;
    DBGrid1.Align :=  TAlign.alNone;

      if dMostraMensagem = True then
        MessageBox(0,PChar('Erro ao Consultar o PIX, tente novamente!'  + #13#10  + RscPix1.Retorno), 'Atenção', mb_IconInformation + mb_ok);
  end;
end;

procedure TfrmPIX_Tela.TimerConsultarTimer(Sender: TObject);
begin
    TimerConsultar.enabled := False;
    ConsultaPixPorTXID(True);
    if bRecebido = True then
      begin
        Close;
      end
    else
        TimerConsultar.enabled := True;
end;

procedure TfrmPIX_Tela.AtualizarPix(cStatus:String);
var
    cValor : String;
begin

        RscPix1.RevisarCobranca(cStatus);//Gerando uma Cobrança

        if RscPix1.Resultado_Cod = 200 then
        begin
            if RscPix1.Resultado.textoImagemQRcode <> '' then
            begin
              QRCodeWin(imgQRCODE, RscPix1.Resultado.textoImagemQRcode);
                cQrCode := RscPix1.Resultado.textoImagemQRcode;
            end
            else
            begin
              QRCodeWin(imgQRCODE, RscPix1.Resultado.textoImagemQRcode);
                cQrCode := RscPix1.Resultado.location;
            end;

            lblStatus.Caption := 'Situação: '+RscPix1.Resultado.status;

            cValor := StringReplace(FloatToStr(RscPix1.Resultado.valor), '.', ',', [rfReplaceAll]);
            lblValor.Caption := 'R$ '+FormatFLoat('###,###,##0.00',StrToCurr(cValor));
        end
        else
        begin
            if RscPix1.Resultado_Cod = 0 then//Esse banco não faz cancelamento ou Alteracao
            begin
              MessageBox(0, PChar('Instituição não faz alteração de PIX!'#13#10+RscPix1.Retorno), 'Atenção', mb_IconInformation + mb_ok);
            end
            else
             MessageBox(0, PChar('Erro ao Atualizar PIX, tente novamente!'#13#10+RscPix1.Retorno), 'Atenção', mb_IconInformation + mb_ok);
        end;
end;

end.
