program _SpectralAttributes;

uses
  Vcl.Forms,
  EvalTestGroupFrameUnit in 'EvalTestGroupFrameUnit.pas' {EvalTestGroupFrame: TFrame},
  FrameType0 in 'FrameType0.pas' {FrameType01: TFrame},
  FrameType1 in 'FrameType1.pas' {Type1: TFrame},
  FrameType2 in 'FrameType2.pas' {Type2: TFrame},
  EvalTestOjb6 in 'EvalTestOjb6.pas',
  SpectalAttributesForm in 'SpectalAttributesForm.pas' {_SpectralAttributesForm},
  ChromaDataModule in '..\ChromaData\ChromaDataModule.pas' {_ChromaDataModule: TDataModule},
  EvalFrameUnit in 'EvalFrameUnit.pas' {EvalFrame: TFrame};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(T_ChromaDataModule, _ChromaDataModule);
  Application.CreateForm(T_SpectralAttributesForm, _SpectralAttributesForm);
  Application.Run;
end.
