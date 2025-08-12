unit uFrame_ImageEffects;

interface

uses
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
  FMX.Platform,
  FMX.Menus,
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

  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Rtti,
  System.Bindings.Outputs,
  System.IOUtils,

  Data.Bind.EngExt,
  Data.Bind.Components,

  System.Skia,
  FMX.Skia,

  Roselt.Clipboard;

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
    imgShadowEffect: TShadowEffect;
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
    imgBlurEffect: TBlurEffect;
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
    imgGlowEffect: TGlowEffect;
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
    imgBevelEffect: TBevelEffect;
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
    imgRippleEffect: TRippleEffect;
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
    imgSwirlEffect: TSwirlEffect;
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
    imgBandsEffect: TBandsEffect;
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
    PopupMenu: TPopupMenu;
    btnCopyImageToClipboard: TMenuItem;
    btnSaveImageToFile: TMenuItem;
    SaveDialog: TSaveDialog;
    LinkControlToPropertyGlowColor: TLinkControlToProperty;
    svgOriginal: TSkSvg;
    svgShadow: TSkSvg;
    svgShadowEffect: TShadowEffect;
    LinkControlToPropertyEnabled9: TLinkControlToProperty;
    LinkControlToPropertyDirection3: TLinkControlToProperty;
    LinkControlToPropertyOpacity4: TLinkControlToProperty;
    LinkControlToPropertySoftness5: TLinkControlToProperty;
    LinkControlToPropertyDistance2: TLinkControlToProperty;
    svgBlur: TSkSvg;
    svgBlurEffect: TBlurEffect;
    LinkControlToPropertySoftness6: TLinkControlToProperty;
    LinkControlToPropertyEnabled10: TLinkControlToProperty;
    svgGlow: TSkSvg;
    svgInnerGlow: TSkSvg;
    svgBevel: TSkSvg;
    svgRipple: TSkSvg;
    svgSwirl: TSkSvg;
    svgBands: TSkSvg;
    svgGlowEffect: TGlowEffect;
    svgInnerGlowEffect: TInnerGlowEffect;
    svgBevelEffect: TBevelEffect;
    svgRippleEffect: TRippleEffect;
    svgSwirlEffect: TSwirlEffect;
    svgBandsEffect: TBandsEffect;
    LinkControlToPropertyGlowColor2: TLinkControlToProperty;
    LinkControlToPropertyEnabled11: TLinkControlToProperty;
    LinkControlToPropertyOpacity5: TLinkControlToProperty;
    LinkControlToPropertyGlowColor3: TLinkControlToProperty;
    LinkControlToPropertySoftness7: TLinkControlToProperty;
    LinkControlToPropertyEnabled12: TLinkControlToProperty;
    LinkControlToPropertySoftness8: TLinkControlToProperty;
    LinkControlToPropertyGlowColor4: TLinkControlToProperty;
    LinkControlToPropertyOpacity6: TLinkControlToProperty;
    LinkControlToPropertyEnabled13: TLinkControlToProperty;
    LinkControlToPropertyDirection4: TLinkControlToProperty;
    LinkControlToPropertySize2: TLinkControlToProperty;
    LinkControlToPropertyAspectRatio3: TLinkControlToProperty;
    LinkControlToPropertyPhase2: TLinkControlToProperty;
    LinkControlToPropertyEnabled14: TLinkControlToProperty;
    LinkControlToPropertyFrequency2: TLinkControlToProperty;
    LinkControlToPropertyAmplitude2: TLinkControlToProperty;
    LinkControlToPropertyEnabled15: TLinkControlToProperty;
    LinkControlToPropertySpiralStrength2: TLinkControlToProperty;
    LinkControlToPropertyAspectRatio4: TLinkControlToProperty;
    LinkControlToPropertyBandDensity2: TLinkControlToProperty;
    LinkControlToPropertyBandIntensity2: TLinkControlToProperty;
    LinkControlToPropertyEnabled16: TLinkControlToProperty;
    procedure EnabledSwitch(Sender: TObject);
    procedure btnDropImageClick(Sender: TObject);
    procedure btnSaveImageToFileClick(Sender: TObject);
    procedure btnCopyImageToClipboardClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_ImageEffects.btnCopyImageToClipboardClick(Sender: TObject);
begin
  CopyToClipboard(TImage(Sender).MakeScreenshot);
end;

procedure TFrame_ImageEffects.btnDropImageClick(Sender: TObject);
begin
  if (OpenDialog.Execute) then
  begin
    var ImageFileExtension := TPath.GetExtension(OpenDialog.FileName);
    imgOriginal.Visible := (ImageFileExtension <> '.svg');
    imgShadow.Visible := (ImageFileExtension <> '.svg');
    imgBlur.Visible := (ImageFileExtension <> '.svg');
    imgGlow.Visible := (ImageFileExtension <> '.svg');
    imgInnerGlow.Visible := (ImageFileExtension <> '.svg');
    imgBevel.Visible := (ImageFileExtension <> '.svg');
    imgRipple.Visible := (ImageFileExtension <> '.svg');
    imgSwirl.Visible := (ImageFileExtension <> '.svg');
    imgBands.Visible := (ImageFileExtension <> '.svg');
    svgOriginal.Visible := (ImageFileExtension = '.svg');
    svgShadow.Visible := (ImageFileExtension = '.svg');
    svgBlur.Visible := (ImageFileExtension = '.svg');
    svgGlow.Visible := (ImageFileExtension = '.svg');
    svgInnerGlow.Visible := (ImageFileExtension = '.svg');
    svgBevel.Visible := (ImageFileExtension = '.svg');
    svgRipple.Visible := (ImageFileExtension = '.svg');
    svgSwirl.Visible := (ImageFileExtension = '.svg');
    svgBands.Visible := (ImageFileExtension = '.svg');
    if (ImageFileExtension = '.svg') then
    begin
      svgOriginal.Svg.Source := TFile.ReadAllText(OpenDialog.FileName);
      svgShadow.Svg.Source := TFile.ReadAllText(OpenDialog.FileName);
      svgBlur.Svg.Source := TFile.ReadAllText(OpenDialog.FileName);
      svgGlow.Svg.Source := TFile.ReadAllText(OpenDialog.FileName);
      svgInnerGlow.Svg.Source := TFile.ReadAllText(OpenDialog.FileName);
      svgBevel.Svg.Source := TFile.ReadAllText(OpenDialog.FileName);
      svgRipple.Svg.Source := TFile.ReadAllText(OpenDialog.FileName);
      svgSwirl.Svg.Source := TFile.ReadAllText(OpenDialog.FileName);
      svgBands.Svg.Source := TFile.ReadAllText(OpenDialog.FileName);
    end else
    begin
      imgOriginal.Bitmap.LoadFromFile(OpenDialog.FileName);
      imgShadow.Bitmap.LoadFromFile(OpenDialog.FileName);
      imgBlur.Bitmap.LoadFromFile(OpenDialog.FileName);
      imgGlow.Bitmap.LoadFromFile(OpenDialog.FileName);
      imgInnerGlow.Bitmap.LoadFromFile(OpenDialog.FileName);
      imgBevel.Bitmap.LoadFromFile(OpenDialog.FileName);
      imgRipple.Bitmap.LoadFromFile(OpenDialog.FileName);
      imgSwirl.Bitmap.LoadFromFile(OpenDialog.FileName);
      imgBands.Bitmap.LoadFromFile(OpenDialog.FileName);
    end;
  end;
end;

procedure TFrame_ImageEffects.btnSaveImageToFileClick(Sender: TObject);
begin
  if SaveDialog.Execute then
    TImage(Sender).MakeScreenshot.SaveToFile(SaveDialog.FileName);
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
