unit UMain;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
    Vcl.ComCtrls,
    Data.Bind.Components, Data.Bind.ObjectScope, REST.Client, IPPeerClient,
    System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
    Vcl.Bind.DBEngExt, Vcl.Grids, Vcl.ValEdit, REST.Types, System.NetEncoding,
  System.Net.URLClient, System.Net.HttpClient, Vcl.ToolWin, Vcl.Buttons,
  System.Actions, Vcl.ActnList;

type
    TForm1 = class(TForm)
        Panel1: TPanel;
        edtResource: TEdit;
        btnSend: TButton;
        Panel2: TPanel;
        StatusBar1: TStatusBar;
        RadioGroup1: TRadioGroup;
        rbGet: TRadioButton;
        rbPut: TRadioButton;
        rbPost: TRadioButton;
        rbDelete: TRadioButton;
        RESTResponse: TRESTResponse;
        RESTRequest: TRESTRequest;
        RESTClient: TRESTClient;
        PageControl1: TPageControl;
        TabSheet1: TTabSheet;
        TabSheet2: TTabSheet;
        Authentication: TTabSheet;
        MemRequestBody: TMemo;
        chkBasicAuth: TCheckBox;
        edtUsername: TLabeledEdit;
        edtPassword: TLabeledEdit;
        BindingsList1: TBindingsList;
        LinkControlToPropertyEnabled: TLinkControlToProperty;
        LinkControlToPropertyEnabled2: TLinkControlToProperty;
    Splitter1: TSplitter;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    MemResponse: TMemo;
    TabSheet4: TTabSheet;
    VLResponseHeaders: TValueListEditor;
    VLRequestHeaders: TValueListEditor;
    Panel3: TPanel;
    btnAddHeader: TBitBtn;
    btnRemoveHeader: TBitBtn;
    Splitter2: TSplitter;
    Panel4: TPanel;
    edtBaseUrl: TEdit;
    Panel5: TPanel;
    ActionList1: TActionList;
    actSend: TAction;
        function GetMethod: TRESTRequestMethod;
    procedure btnAddHeaderClick(Sender: TObject);
    procedure btnRemoveHeaderClick(Sender: TObject);
    procedure edtResourceKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actSendExecute(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.edtResourceKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = 13 then
    begin
        actSend.Execute;
    end;
end;

function TForm1.GetMethod: TRESTRequestMethod;
begin
    if rbGet.Checked then
        Result := TRESTRequestMethod.rmGET
    else if rbPost.Checked then
        Result := TRESTRequestMethod.rmPOST
    else if rbPut.Checked then
        Result := TRESTRequestMethod.rmPUT
    else if rbDelete.Checked then
        Result := TRESTRequestMethod.rmDELETE;
end;



procedure TForm1.actSendExecute(Sender: TObject);
var
    I: Integer;
    h: Array of String;
    key: String;
    basicAuthHeader: String;
    authHeaderIndex: Integer;
    bytes: TBytes;
    rp: TRESTRequestParameter;
begin
    MemResponse.Lines.Clear;
    VLResponseHeaders.Strings.Clear;
    StatusBar1.Panels[0].Text := '';
    StatusBar1.Panels[1].Text := 'Sending...';
    StatusBar1.Panels[2].Text := '';
    StatusBar1.Refresh;
    actSend.Enabled := false;

    RESTClient.BaseURL := edtBaseUrl.Text;
    RESTRequest.Resource := edtResource.Text;
    RESTRequest.Method := self.GetMethod;

    if chkBasicAuth.Checked then
    begin
        bytes := TEncoding.UTF8.GetBytes(edtUsername.Text + ':' + edtPassword.Text);
        basicAuthHeader := 'Basic ' + TNetEncoding.Base64.EncodeBytesToString(bytes);
        authHeaderIndex := VLRequestHeaders.Strings.IndexOfName('Authorization');
        if authHeaderIndex <> -1 then
        begin
            VLRequestHeaders.DeleteRow(authHeaderIndex + 1);
        end;
        VLRequestHeaders.InsertRow('Authorization', basicAuthHeader, True);
    end
    else
    begin
       authHeaderIndex := VLRequestHeaders.Strings.IndexOfName('Authorization');
       if authHeaderIndex <> -1 then
        begin
            VLRequestHeaders.DeleteRow(authHeaderIndex + 1);
        end;
    end;

    RESTRequest.Params.Clear;
    for I := 1 to VLRequestHeaders.RowCount - 1 do
    begin
        key := VLRequestHeaders.Keys[I];
        if key.Length > 0 then
        begin
            rp := RESTRequest.Params.AddItem;
            rp.name := key;
            rp.Value := VLRequestHeaders.Values[key];
            rp.Kind := TRESTRequestParameterKind.pkHTTPHEADER;
            rp.Options := [TRESTRequestParameterOption.poDoNotEncode];
            //ShowMessage('Added: ' + key + '=' +  VLRequestHeaders.Values[key]);
        end;
    end;

    if (self.GetMethod = TRESTRequestMethod.rmPOST) or (self.GetMethod = TRESTRequestMethod.rmPUT) then
    begin
       RESTRequest.AddBody(MemRequestBody.Text, TRESTContentType.ctAPPLICATION_JSON);
    end;

    {
    for I := 0 to RESTRequest.Params.Count - 1 do
    begin
       ShowMessage(RESTRequest.Params[I].ToString);
    end;
    }

    RESTRequest.Execute;
    StatusBar1.Panels[0].Text := RESTResponse.StatusCode.ToString;
    StatusBar1.Panels[1].Text := RESTResponse.StatusText;
    StatusBar1.Panels[2].Text := RESTResponse.ContentLength.ToString + ' Bytes';
    MemResponse.Text := RESTResponse.JSONText;
    actSend.Enabled := true;

    for I := 0 to RESTResponse.Headers.Count - 1 do
    begin
        VLResponseHeaders.InsertRow(RESTResponse.Headers[I].Split(['='])[0],
          RESTResponse.Headers[I].Split(['='])[1], True);
    end;

end;

procedure TForm1.btnAddHeaderClick(Sender: TObject);
begin
   VLRequestHeaders.InsertRow(' ', ' ', True);
end;

procedure TForm1.btnRemoveHeaderClick(Sender: TObject);
begin
    VLRequestHeaders.DeleteRow(VLRequestHeaders.Selection.Top);
end;

end.
