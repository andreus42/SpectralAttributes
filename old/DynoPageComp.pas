unit DynoPageComp;

interface

uses
  Winapi.Windows, Winapi.Messages,                                    // WinAPI
  System.SysUtils, System.Variants, System.Classes,                   // System
  System.Generics.Collections,
  Vcl.StdCtrls, Vcl.Controls, Vcl.ComCtrls, Vcl.Graphics, Vcl.Forms,  // VCL
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus,
  Vcl.ExtCtrls, Dialogs,

  //Hefferman
  TMyList,

  // DB
  Data.DB, Data.Win.ADODB,

  // Proj
//  _AttributesFrame,
  TEvalTestGroupObject,
  EvalTestGroupFrameUnit,
  ConnectionUnit;

  type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    Button2: TButton;
    Button3: TButton;
    SummaryTab: TTabSheet;
    SummaryPanel: TPanel;
    Memo1: TMemo;
    SummaryLabel: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure MakePage(K: Integer);
    procedure UpdateButtonClick(Sender: TObject);

  type
    TMyTabSheet = class(TTabSheet)
      EditBox: TEdit;
      MemoBox: TMemo;
      MyFrame: TFrame;
      ActiveButton: TButton;
      MySpecSheet: TEvalTestGroupFrame;
    end;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  i: integer;
  MyIntList: TMyList<Integer>;
  Query: TADOQuery;

implementation

{$R *.dfm}

{ Form 1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  j: Integer;
  myInt: Integer;
begin
  for myInt in MyIntList do
  begin
    MakePage(myInt);
  end;
  Memo1.Text := '';
  for j := 1 to PageControl1.PageCount-1 do
  begin
    Memo1.Text := Memo1.Text + PageControl1.Pages[j].Name + slinebreak;
  end;
end;


// CREATE TAB ///////////////////////
// Create a new tab through page control and immediately add EvalTestFrame
// to that new tab
procedure TForm1.MakePage(K: Integer);
var
  ATabSheet: TMyTabSheet;
begin
  ATabSheet := TMyTabSheet.Create(PageControl1);
  with ATabSheet do
  begin
    Caption := 'Test #' + K.ToString;
    Name := 'TabSheet' + K.ToString;
    PageControl := PageControl1;
    MySpecSheet := TEvalTestGroupFrame.CreateWithID(ATabSheet, K);
    with MySpecSheet do
    begin
      Parent := ATabSheet;
      Align := alClient;
      // Pass TestGroup Number, get from revlog

    end;
  end;
end;

////DESTROY TAB////////////////////
procedure TForm1.Button2Click(Sender: TObject);
// Remove active page,
// TODO:
// 1. Remove page from IntList
// 2. Reorder IntList
// 3. Reassign pages
var
  ActivePageName: String;
begin
  ActivePageName := PageControl1.ActivePage.Name;
// ShowMessage(ActivePageName);
  If (PageControl1.ActivePage <> SummaryTab) then PageControl1.ActivePage.Destroy;
end;


procedure TForm1.UpdateButtonClick(Sender: TObject);
var
  j: Integer;
begin
  for j := 1 to (PageControl1.PageCount-1) do
  begin
//    Application.MessageBox('Hello, World', 0, 0);
//    Memo1.Text := Memo1.Text + ATabSheet.Name
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  NextPageNum: Integer;
begin
  NextPageNum := MyIntList.MaxValue + 1;
  MyIntList.Add(NextPageNum);
  MakePage(NextPageNum);
end;


initialization
  SetupConnection('Mydb');
  MyIntList := TMylist<Integer>.Create;
  AdoQuery := TADOQuery.Create(nil);
  AdoQuery.Connection := AdoConnection;
  AdoQuery.SQL.Add('select id from names');
  AdoQuery.Open;
  // get all ids from name records
  while not AdoQuery.eof do
  begin
    MyIntList.Add(AdoQuery.FieldByName('id').Value);
    AdoQuery.Next;
  end;
  AdoQuery.Free;

Finalization
  MyIntList.Free;
  CloseConnection; // close the connection

end.
