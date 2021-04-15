program _SpectralAttributes;

uses
  Vcl.Forms,
  EvalTestGroupFrameUnit in 'EvalTestGroupFrameUnit.pas' {EvalTestGroupFrame: TFrame},
  SpectalAttributesForm in 'SpectalAttributesForm.pas' {_SpectralAttributesForm},
  ChromaDataModule in '..\ChromaData\ChromaDataModule.pas' {_ChromaDataModule: TDataModule},
  TEvalTestUnit in 'TEvalTestUnit.pas',
  TEvalTestGroupUnit in 'TEvalTestGroupUnit.pas',
  TEvalTestSetUnit in 'TEvalTestSetUnit.pas',
  EvalFrameUnit in 'EvalFrameUnit.pas' {EvalFrame: TFrame},
  Logic in 'Logic.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(T_ChromaDataModule, _ChromaDataModule);
  Application.CreateForm(T_SpectralAttributesForm, _SpectralAttributesForm);
  Application.Run;
end.
