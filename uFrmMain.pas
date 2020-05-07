unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    TreeView1: TTreeView;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FNumeric: Integer;
    FLastName: string;
    function foo: string;
  public
    { Public declarations }
    property LastName: string read FLastName write FLastName;
    procedure SetVal(aa: double);
  end;

var
  Form1: TForm1;

implementation

uses
  RTTI;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
//
end;

function TForm1.foo: string;
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
var
  LContext: TRttiContext;
  LType: TRttiType;
  LMethod: TRttiMethod;
  LProperty: TRttiProperty;
  LField: TRttiField;
  LTreeNode1, LTreeNode2: TTreeNode;
begin
  LContext := TRttiContext.Create;
  try
    LType := LContext.GetType(TForm1);
    LTreeNode1 := TreeView1.Items.AddChild(nil, LType.ToString);

    LTreeNode2 := TreeView1.Items.AddChild(LTreeNode1, 'Declared Methods');
    for LMethod in LType.GetDeclaredMethods do
    begin
      TreeView1.Items.AddChild(LTreeNode2, LMethod.ToString);
    end;

    LTreeNode2 := TreeView1.Items.AddChild(LTreeNode1, 'Methods');
    for LMethod in LType.GetMethods do
    begin
      TreeView1.Items.AddChild(LTreeNode2, LMethod.ToString);
    end;

    LTreeNode2 := TreeView1.Items.AddChild(LTreeNode1, 'Declared Properties');
    for LProperty in LType.GetDeclaredProperties do
    begin
      TreeView1.Items.AddChild(LTreeNode2, LProperty.ToString);
    end;

    LTreeNode2 := TreeView1.Items.AddChild(LTreeNode1, 'Properties');
    for LProperty in LType.GetProperties do
    begin
      TreeView1.Items.AddChild(LTreeNode2, LProperty.ToString);
    end;

    LTreeNode2 := TreeView1.Items.AddChild(LTreeNode1, 'Declared Fields');
    for LField in LType.GetDeclaredFields do
    begin
      TreeView1.Items.AddChild(LTreeNode2, LField.ToString);
    end;

    LTreeNode2 := TreeView1.Items.AddChild(LTreeNode1, 'Fields');
    for LField in LType.GetFields do
    begin
      TreeView1.Items.AddChild(LTreeNode2, LField.ToString);
    end;

    TreeView1.FullExpand;
  finally
    LContext.Free;
  end;
end;
procedure TForm1.SetVal(aa: double);
begin

end;

end.
