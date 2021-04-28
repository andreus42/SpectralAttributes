program _SpectralAttributes;

uses
  Vcl.Forms,
  SpectralAttributes.EvalGroupFrame in 'SpectralAttributes.EvalGroupFrame.pas' {EvalTestGroupFrame: TFrame},
  SpectalAttributes.MainForm in 'SpectalAttributes.MainForm.pas' {_SpectralAttributesForm},
  ChromaDataModule in '..\ChromaData\ChromaDataModule.pas' {_ChromaDataModule: TDataModule},
  SpectralAttributes.EvalGroup in 'SpectralAttributes.EvalGroup.pas',
  SpectralAttributes.EvalSet in 'SpectralAttributes.EvalSet.pas',
  SpectralAttributes.EvalTestFrame in 'SpectralAttributes.EvalTestFrame.pas' {EvalFrame: TFrame},
  SpectralAttributes.ParsingLogic in 'SpectralAttributes.ParsingLogic.pas',
  SpectralAttributes.EvalTest in 'SpectralAttributes.EvalTest.pas',
  ChromaPackageLite in '..\MyUses\ChromaPackageLite.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(T_ChromaDataModule, _ChromaDataModule);
  Application.CreateForm(T_SpectralAttributesForm, _SpectralAttributesForm);
  Application.Run;
end.


