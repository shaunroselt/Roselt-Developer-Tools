unit uFrame_ImageEffects;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Rtti,
  System.Bindings.Outputs,

  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.ExtCtrls,
  FMX.Effects,
  FMX.ListBox,
  FMX.Edit,
  FMX.EditBox,
  FMX.SpinBox,
  FMX.Layouts,
  FMX.Colors,
  FMX.Filter.Effects,
  FMX.Bind.DBEngExt,
  FMX.Bind.Editors,

  Data.Bind.EngExt,
  Data.Bind.Components,

  Skia,
  Skia.FMX;

type
  TFrame_ImageEffects = class(TFrame)
    TabControlImages: TTabControl;
    TabOriginal: TTabItem;
    DropImage: TDropTarget;
    btnDropImage: TButton;
    imgOriginal: TImage;
    OpenDialog: TOpenDialog;
    TabShadow: TTabItem;
    imgShadow: TImage;
    layTopShadow: TLayout;
    lblConfigurationShadow: TLabel;
    layEnabledShadow: TRectangle;
    imgEnabledShadow: TSkSvg;
    layTitleDescriptionEnabledShadow: TLayout;
    lblTitleEnabledShadow: TLabel;
    lblDescriptionEnabledShadow: TLabel;
    lblSwitchEnabledShadow: TLabel;
    EnabledSwitchShadow: TSwitch;
    layDistanceShadow: TRectangle;
    imgDistanceShadow: TSkSvg;
    layTitleDescriptionDistanceShadow: TLayout;
    lblTitleDistanceShadow: TLabel;
    lblDescriptionDistanceShadow: TLabel;
    sbDistanceShadow: TSpinBox;
    layDirectionShadow: TRectangle;
    imgDirectionShadow: TSkSvg;
    layTitleDescriptionDirectionShadow: TLayout;
    lblTitleDirectionShadow: TLabel;
    lblDescriptionDirectionShadow: TLabel;
    sbDirectionShadow: TSpinBox;
    ShadowEffect: TShadowEffect;
    BindingsList: TBindingsList;
    LinkControlToPropertyDistance: TLinkControlToProperty;
    LinkControlToPropertyDirection: TLinkControlToProperty;
    LinkControlToPropertyEnabled: TLinkControlToProperty;
    laySoftnessShadow: TRectangle;
    imgSoftnessShadow: TSkSvg;
    layTitleDescriptionSoftnessShadow: TLayout;
    lblTitleSoftnessShadow: TLabel;
    lblDescriptionSoftnessShadow: TLabel;
    sbSoftnessShadow: TSpinBox;
    layOpacityShadow: TRectangle;
    imgOpacityShadow: TSkSvg;
    layTitleDescriptionOpacityShadow: TLayout;
    lblTitleOpacityShadow: TLabel;
    lblDescriptionOpacityShadow: TLabel;
    sbOpacityShadow: TSpinBox;
    TabBlur: TTabItem;
    LinkControlToPropertySoftness: TLinkControlToProperty;
    LinkControlToPropertyOpacity: TLinkControlToProperty;
    imgBlur: TImage;
    BlurEffect: TBlurEffect;
    layTopBlur: TLayout;
    lblConfigurationSoftnessBlur: TLabel;
    laySoftnessBlur: TRectangle;
    imgSoftnessBlur: TSkSvg;
    layTitleDescriptionSoftnessBlur: TLayout;
    lblTitleSoftnessBlur: TLabel;
    lblDescriptionSoftnessBlur: TLabel;
    sbSoftnessBlur: TSpinBox;
    LinkControlToPropertySoftness2: TLinkControlToProperty;
    layEnabledBlur: TRectangle;
    imgEnabledBlur: TSkSvg;
    layTitleDescriptionEnabledBlur: TLayout;
    lblTitleEnabledBlur: TLabel;
    lblDescriptionEnabledBlur: TLabel;
    SwitchEnabledBlur: TSwitch;
    lblSwitchEnabledBlur: TLabel;
    LinkControlToPropertyEnabled2: TLinkControlToProperty;
    TabGlow: TTabItem;
    imgGlow: TImage;
    GlowEffect: TGlowEffect;
    TabInnerGlow: TTabItem;
    imgInnerGlow: TImage;
    InnerGlowEffect: TInnerGlowEffect;
    layTopGlow: TLayout;
    lblConfigurationGlow: TLabel;
    layEnabledGlow: TRectangle;
    imgEnabledGlow: TSkSvg;
    layTitleDescriptionEnabledGlow: TLayout;
    lblTitleEnabledGlow: TLabel;
    lblDescriptionEnabledGlow: TLabel;
    lblSwitchEnabledGlow: TLabel;
    SwitchEnabledGlow: TSwitch;
    layColorGlow: TRectangle;
    imgColorGlow: TSkSvg;
    layTitleDescriptionColorGlow: TLayout;
    lblTitleColorGlow: TLabel;
    lblDescriptionColorGlow: TLabel;
    cbColorGlow: TColorComboBox;
    laySoftnessGlow: TRectangle;
    imgSoftnessGlow: TSkSvg;
    layTitleDescriptionSoftnessGlow: TLayout;
    lblTitleSoftnessGlow: TLabel;
    lblDescriptionSoftnessGlow: TLabel;
    sbSoftnessGlow: TSpinBox;
    layOpacityGlow: TRectangle;
    imgOpacityGlow: TSkSvg;
    layTitleDescriptionOpacityGlow: TLayout;
    lblTitleOpacityGlow: TLabel;
    lblDescriptionOpacityGlow: TLabel;
    sbOpacityGlow: TSpinBox;
    LinkControlToPropertyEnabled3: TLinkControlToProperty;
    LinkControlToPropertyOpacity2: TLinkControlToProperty;
    LinkControlToPropertySoftness3: TLinkControlToProperty;
    layTopInnerGlow: TLayout;
    lblConfigurationInnerGlow: TLabel;
    layEnabledInnerGlow: TRectangle;
    imgEnabledInnerGlow: TSkSvg;
    layTitleDescriptionEnabledInnerGlow: TLayout;
    lblTitleEnabledInnerGlow: TLabel;
    lblDescriptionEnabledInnerGlow: TLabel;
    lblSwitchEnabledInnerGlow: TLabel;
    SwitchEnabledInnerGlow: TSwitch;
    layColorInnerGlow: TRectangle;
    imgColorInnerGlow: TSkSvg;
    layTitleDescriptionColorInnerGlow: TLayout;
    lblTitleColorInnerGlow: TLabel;
    lblDescriptionColorInnerGlow: TLabel;
    cbColorInnerGlow: TColorComboBox;
    laySoftnessInnerGlow: TRectangle;
    imgSoftnessInnerGlow: TSkSvg;
    layTitleDescriptionSoftnessInnerGlow: TLayout;
    lblTitleSoftnessInnerGlow: TLabel;
    lblDescriptionSoftnessInnerGlow: TLabel;
    sbSoftnessInnerGlow: TSpinBox;
    layOpacityInnerGlow: TRectangle;
    imgOpacityInnerGlow: TSkSvg;
    layTitleDescriptionOpacityInnerGlow: TLayout;
    lblTitleOpacityInnerGlow: TLabel;
    lblDescriptionOpacityInnerGlow: TLabel;
    sbOpacityInnerGlow: TSpinBox;
    LinkControlToPropertyEnabled4: TLinkControlToProperty;
    LinkControlToPropertyOpacity3: TLinkControlToProperty;
    LinkControlToPropertySoftness4: TLinkControlToProperty;
    TabBevelEffect: TTabItem;
    imgBevel: TImage;
    BevelEffect: TBevelEffect;
    layTopBevel: TLayout;
    lblConfigurationBevel: TLabel;
    layEnabledBevel: TRectangle;
    imgEnabledBevel: TSkSvg;
    layTitleDescriptionEnabledBevel: TLayout;
    lblTitleEnabledBevel: TLabel;
    lblDescriptionEnabledBevel: TLabel;
    lblSwitchEnabledBevel: TLabel;
    SwitchEnabledBevel: TSwitch;
    laySizeBevel: TRectangle;
    imgSizeBevel: TSkSvg;
    layTitleDescriptionSizeBevel: TLayout;
    lblTitleSizeBevel: TLabel;
    lblDescriptionSizeBevel: TLabel;
    sbSizeBevel: TSpinBox;
    layDirectionBevel: TRectangle;
    imgDirectionBevel: TSkSvg;
    layTitleDescriptionDirectionBevel: TLayout;
    lblTitleDirectionBevel: TLabel;
    lblDescriptionDirectionBevel: TLabel;
    sbDirectionBevel: TSpinBox;
    LinkControlToPropertyDirection2: TLinkControlToProperty;
    LinkControlToPropertyEnabled5: TLinkControlToProperty;
    LinkControlToPropertySize: TLinkControlToProperty;
    TabRipple: TTabItem;
    imgRipple: TImage;
    RippleEffect: TRippleEffect;
    layTopRipple: TLayout;
    lblConfigurationRipple: TLabel;
    layEnabledRipple: TRectangle;
    imgEnabledRipple: TSkSvg;
    layTitleDescriptionEnabledRipple: TLayout;
    lblTitleEnabledRipple: TLabel;
    lblDescriptionEnabledRipple: TLabel;
    lblSwitchEnabledRipple: TLabel;
    EnabledSwitchRipple: TSwitch;
    layAspectRatioRipple: TRectangle;
    imgAspectRatioRipple: TSkSvg;
    layAspectRatioTitleDescriptionRipple: TLayout;
    lblAspectRatioTitleRipple: TLabel;
    lblAspectRatioDescriptionRipple: TLabel;
    sbAspectRatioRipple: TSpinBox;
    layAmplitudeRipple: TRectangle;
    imgAmplitudeRipple: TSkSvg;
    layAmplitudeTitleDescriptionRipple: TLayout;
    lblAmplitudeTitleRipple: TLabel;
    lblAmplitudeDescriptionRipple: TLabel;
    sbAmplitudeRipple: TSpinBox;
    layFrequencyRipple: TRectangle;
    imgFrequencyRipple: TSkSvg;
    layFrequencyTitleDescriptionRipple: TLayout;
    lblFrequencyTitleRipple: TLabel;
    lblFrequencyDescriptionRipple: TLabel;
    sbFrequencyRipple: TSpinBox;
    layPhaseRipple: TRectangle;
    imgPhaseRipple: TSkSvg;
    layPhaseTitleDescriptionRipple: TLayout;
    lblPhaseTitleRipple: TLabel;
    lblPhaseDescriptionRipple: TLabel;
    sbPhaseRipple: TSpinBox;
    LinkControlToPropertyAmplitude: TLinkControlToProperty;
    LinkControlToPropertyAspectRatio: TLinkControlToProperty;
    LinkControlToPropertyFrequency: TLinkControlToProperty;
    LinkControlToPropertyPhase: TLinkControlToProperty;
    LinkControlToPropertyEnabled6: TLinkControlToProperty;
    TabSwirl: TTabItem;
    imgSwirl: TImage;
    SwirlEffect: TSwirlEffect;
    layTopSwirl: TLayout;
    lblConfigurationSwirl: TLabel;
    layEnabledSwirl: TRectangle;
    imgEnabledSwirl: TSkSvg;
    layTitleDescriptionEnabledSwirl: TLayout;
    lblTitleEnabledSwirl: TLabel;
    lblDescriptionEnabledSwirl: TLabel;
    lblSwitchEnabledSwirl: TLabel;
    SwitchEnabledSwirl: TSwitch;
    laySpiralStrengthSwirl: TRectangle;
    imgSpiralStrengthSwirl: TSkSvg;
    layTitleDescriptionSpiralStrengthSwirl: TLayout;
    lblTitleSpiralStrengthSwirl: TLabel;
    lblDescriptionSpiralStrengthSwirl: TLabel;
    sbSpiralStrengthSwirl: TSpinBox;
    layAspectRatioSwirl: TRectangle;
    imgAspectRatioSwirl: TSkSvg;
    layTitleDescriptionAspectRatioSwirl: TLayout;
    lblTitleAspectRatioSwirl: TLabel;
    lblDescriptionAspectRatioSwirl: TLabel;
    sbAspectRatioSwirl: TSpinBox;
    LinkControlToPropertyAspectRatio2: TLinkControlToProperty;
    LinkControlToPropertyEnabled7: TLinkControlToProperty;
    LinkControlToPropertySpiralStrength: TLinkControlToProperty;
    TabBands: TTabItem;
    imgBands: TImage;
    BandsEffect: TBandsEffect;
    layTopBands: TLayout;
    lblConfigurationBands: TLabel;
    layEnabledBands: TRectangle;
    imgEnabledBands: TSkSvg;
    layTitleDescriptionEnabledBands: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    lblSwitchEnabledBands: TLabel;
    SwitchEnabledBands: TSwitch;
    layIntensityBands: TRectangle;
    imgIntensityBands: TSkSvg;
    layTitleDescriptionIntensityBands: TLayout;
    lblTitleIntensityBands: TLabel;
    lblDescriptionIntensityBands: TLabel;
    sbIntensityBands: TSpinBox;
    layDensityBands: TRectangle;
    imgDensityBands: TSkSvg;
    layTitleDescriptionDensityBands: TLayout;
    lblTitleDensityBands: TLabel;
    lblDescriptionDensityBands: TLabel;
    sbDensityBands: TSpinBox;
    LinkControlToPropertyBandDensity: TLinkControlToProperty;
    LinkControlToPropertyBandIntensity: TLinkControlToProperty;
    LinkControlToPropertyEnabled8: TLinkControlToProperty;
    procedure EnabledSwitch(Sender: TObject);
    procedure cbColorGlowChange(Sender: TObject);
    procedure btnDropImageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_ImageEffects.btnDropImageClick(Sender: TObject);
begin
  if (OpenDialog.Execute) then
  begin
    imgOriginal.Bitmap.LoadFromFile(OpenDialog.FileName);
    imgShadow.Bitmap.LoadFromFile(OpenDialog.FileName);
    imgBlur.Bitmap.LoadFromFile(OpenDialog.FileName);
    imgGlow.Bitmap.LoadFromFile(OpenDialog.FileName);
    imgInnerGlow.Bitmap.LoadFromFile(OpenDialog.FileName);
  end;
end;

procedure TFrame_ImageEffects.cbColorGlowChange(Sender: TObject);
begin
  GlowEffect.GlowColor := cbColorGlow.Color;
end;

procedure TFrame_ImageEffects.EnabledSwitch(Sender: TObject);
var
  FindLabel: TLabel;
begin
  for var I in TSwitch(Sender).Parent.Children do
    if (I is TLabel) then FindLabel := TLabel(I);


  if (FindLabel <> nil) then
    if (FindLabel.Text = 'On') then
    begin
      FindLabel.Text := 'Off';
      TSwitch(Sender).IsChecked := False;
    end else
    begin
      FindLabel.Text := 'On';
      TSwitch(Sender).IsChecked := True;
    end;
end;

end.
