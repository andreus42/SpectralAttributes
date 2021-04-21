unit SpectralAttributes.EvalSet;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  // Database
  Data.DB,
  Data.Win.ADODB,
  Datasnap.DBClient,
  ActiveX,
  ChromaDataModule,

  // Project
  SpectralAttributes.EvalTest,
  SpectralAttributes.EvalGroup;

type
  TEvalSet = class(TObject)
  public
    SetID: Integer;
    EvalTestGroupList: TObjectList<TEvalGroup>;
    EvalTestGroupIDList: TList<Integer>;
    constructor Create(ID: Integer);
    destructor Destroy;
  end;

var
  EvalTestGroup: TEvalGroup;

implementation

{ TEvalTestSet }

constructor TEvalSet.Create(ID: Integer);
var
  Query : TADOQuery;
  GroupID: Integer;
//  GroupNum: Integer; For future ordering of sets
begin
  SetID := ID;
  EvalTestGroupList := TObjectList<TEvalGroup>.Create;
  EvalTestGroupIDList := TList<Integer>.Create;
  Query := TADOQuery.Create(Nil);
  with Query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('SELECT GroupID, GroupNum');
    SQL.Add('FROM EvalTestGroups WHERE SetID = ' + SetID.ToString);  // change to order by GroupNum for future revs
    SQL.Add('ORDER BY GroupID');
    Open;
    while not eof do
    begin
        GroupID := Query.FieldByName('GroupID').Value;
//        GroupNum := Query.FieldByName('GroupNum').Value; // Eventually need this as In-Process#1,#2,etc.
        EvalTestGroup := TEvalGroup.Create(GroupID);
        EvalTestGroupList.Add(EvalTestGroup);
        EvalTestGroupIDList.Add(GroupID);
        Next;
    end;
    Close;
    Free;
  end;
end;

destructor TEvalSet.Destroy;
begin
  EvalTestGroupIDList.Destroy;
  EvalTestGroupList.Destroy;
end;

end.
