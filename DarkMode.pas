unit DarkMode;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  System.Skia, FMX.Skia, FMX.Layouts, FMX.Effects, FMX.Ani;

type
  TFormMain = class(TForm)
    RectBackground: TRectangle;
    Layout1: TLayout;
    SkLabel1: TSkLabel;
    SkLabel2: TSkLabel;
    Layout2: TLayout;
    RectHeader: TRectangle;
    ShadowEffect1: TShadowEffect;
    SkSvg1: TSkSvg;
    Layout3: TLayout;
    SkLabel3: TSkLabel;
    SkLabel4: TSkLabel;
    SkLabel5: TSkLabel;
    SkSvg2: TSkSvg;
    SkLabel6: TSkLabel;
    SkAniSwitch: TSkAnimatedImage;
    procedure SkAniSwitchClick(Sender: TObject);
  private
    procedure SetThemeMode(AMode: Boolean);
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

Const
  ColorWhite = $FFF1F5F8;
  ColorBlack = $FF2F3543;

implementation

{$R *.fmx}

procedure TFormMain.SetThemeMode(AMode: Boolean);
begin
  if AMode then
  begin
    TAnimator.AnimateColor(RectBackground, 'Fill.Color', ColorWhite);
    TAnimator.AnimateColor(RectHeader, 'Fill.Color', ColorWhite);
    SkLabel1.TextSettings.FontColor := ColorBlack;
    SkLabel2.TextSettings.FontColor := ColorBlack;
    SkLabel3.TextSettings.FontColor := ColorBlack;
    SkLabel4.TextSettings.FontColor := ColorBlack;
    SkLabel5.TextSettings.FontColor := ColorBlack;
    SkLabel6.TextSettings.FontColor := ColorBlack;
    SkSvg1.Svg.OverrideColor := ColorBlack;
    SkSvg2.Svg.OverrideColor := ColorBlack;
  end
  else
  begin
    TAnimator.AnimateColor(RectBackground, 'Fill.Color', ColorBlack);
    TAnimator.AnimateColor(RectHeader, 'Fill.Color', ColorBlack);
    SkLabel1.TextSettings.FontColor := ColorWhite;
    SkLabel2.TextSettings.FontColor := ColorWhite;
    SkLabel3.TextSettings.FontColor := ColorWhite;
    SkLabel4.TextSettings.FontColor := ColorWhite;
    SkLabel5.TextSettings.FontColor := ColorWhite;
    SkLabel6.TextSettings.FontColor := ColorWhite;
    SkSvg1.Svg.OverrideColor := ColorWhite;
    SkSvg2.Svg.OverrideColor := ColorWhite;
  end;
end;

procedure TFormMain.SkAniSwitchClick(Sender: TObject);
begin
  if SkAniSwitch.Tag = 0 then //White
  begin
    SkAniSwitch.Tag := 1;
    SkAniSwitch.Animation.Inverse := False;
    SkAniSwitch.Animation.Start;
    SetThemeMode(False);
  end
  else if SkAniSwitch.Tag = 1 then // Dark
  begin
    SkAniSwitch.Tag := 0;
    SkAniSwitch.Animation.Inverse := True;
    SkAniSwitch.Animation.Start;
    SetThemeMode(True);
  end;
end;

end.
