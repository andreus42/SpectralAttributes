unit TEvalTestSetUnit;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Data.DB,
  Data.Win.ADODB,
  Datasnap.DBClient,
  ActiveX,
  ChromaDataModule,
  TEvalTestUnit,
  TEvalTestGroupUnit;

type
  TEvalTestSet = class(TObject)
  public
    SetID: Integer;
    EvalTestGroupList: TObjectList<TEvalTestGroup>;
    constructor Create(ID: Integer);
    destructor destroy;
    procedure WalkTestSet;
  end;

implementation

end.
