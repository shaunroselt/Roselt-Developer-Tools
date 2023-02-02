unit uFrame_ImageEffects;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,

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

  Skia,
  Skia.FMX, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, FMX.Colors;

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
    layShadowEnabled: TRectangle;
    imgShadowEnabled: TSkSvg;
    layShadowEnabledTitleDescription: TLayout;
    lblShadowEnabledTitle: TLabel;
    lblShadowEnabledDescription: TLabel;
    lblSwitchShadowEnabled: TLabel;
    ShadowEnabledSwitch: TSwitch;
    layShadowDistance: TRectangle;
    imgShadowDistance: TSkSvg;
    layShadowDistanceTitleDescription: TLayout;
    lblShadowDistanceTitle: TLabel;
    lblShadowDistanceDescription: TLabel;
    sbShadowDistance: TSpinBox;
    layShadowDirection: TRectangle;
    imgShadowDirection: TSkSvg;
    layShadowDirectionTitleDescription: TLayout;
    lblShadowDirectionTitle: TLabel;
    lblShadowDirectionDescription: TLabel;
    sbShadowDirection: TSpinBox;
    ShadowEffect: TShadowEffect;
    BindingsList: TBindingsList;
    LinkControlToPropertyDistance: TLinkControlToProperty;
    LinkControlToPropertyDirection: TLinkControlToProperty;
    LinkControlToPropertyEnabled: TLinkControlToProperty;
    layShadowSoftness: TRectangle;
    imgShadowSoftness: TSkSvg;
    layShadowSoftnessTitleDescription: TLayout;
    lblShadowSoftnessTitle: TLabel;
    lblShadowSoftnessDescription: TLabel;
    sbShadowSoftness: TSpinBox;
    layShadowOpacity: TRectangle;
    imgShadowOpacity: TSkSvg;
    layShadowOpacityTitleDescription: TLayout;
    lblShadowOpacityTitle: TLabel;
    lblShadowOpacityDescription: TLabel;
    sbShadowOpacity: TSpinBox;
    TabBlur: TTabItem;
    LinkControlToPropertySoftness: TLinkControlToProperty;
    LinkControlToPropertyOpacity: TLinkControlToProperty;
    imgBlur: TImage;
    BlurEffect: TBlurEffect;
    layTopBlur: TLayout;
    lblConfigurationBlurSoftness: TLabel;
    layBlurSoftness: TRectangle;
    imgBlurSoftness: TSkSvg;
    layTitleDescriptionBlurSoftness: TLayout;
    lblTitleBlurSoftness: TLabel;
    lblDescriptionBlurSoftness: TLabel;
    sbBlurSoftness: TSpinBox;
    LinkControlToPropertySoftness2: TLinkControlToProperty;
    layBlurEnabled: TRectangle;
    imgBlurEnabled: TSkSvg;
    layTitleDescriptionBlurEnabled: TLayout;
    lblTitleBlurEnabled: TLabel;
    lblDescriptionBlurEnabled: TLabel;
    SwitchBlurEnabled: TSwitch;
    lblSwitchBlurEnabled: TLabel;
    LinkControlToPropertyEnabled2: TLinkControlToProperty;
    TabGlow: TTabItem;
    imgGlow: TImage;
    GlowEffect: TGlowEffect;
    TabInnerGlow: TTabItem;
    imgInnerGlow: TImage;
    InnerGlowEffect: TInnerGlowEffect;
    layTopGlow: TLayout;
    lblConfigurationGlow: TLabel;
    layGlowEnabled: TRectangle;
    imgGlowEnabled: TSkSvg;
    layTitleDescriptionGlowEnabled: TLayout;
    lblTitleGlowEnabled: TLabel;
    lblDescriptionGlowEnabled: TLabel;
    lblSwitchGlowEnabled: TLabel;
    SwitchGlowEnabled: TSwitch;
    layGlowColor: TRectangle;
    imgGlowColor: TSkSvg;
    layTitleDescriptionGlowColor: TLayout;
    lblTitleGlowColor: TLabel;
    lblDescriptionGlowColor: TLabel;
    cbGlowColor: TColorComboBox;
    layGlowSoftness: TRectangle;
    imgGlowSoftness: TSkSvg;
    layTitleDescriptionGlowSoftness: TLayout;
    lblTitleGlowSoftness: TLabel;
    lblDescriptionGlowSoftness: TLabel;
    sbGlowSoftness: TSpinBox;
    layGlowOpacity: TRectangle;
    imgGlowOpacity: TSkSvg;
    layTitleDescriptionGlowOpacity: TLayout;
    lblTitleGlowOpacity: TLabel;
    lblDescriptionGlowOpacity: TLabel;
    sbGlowOpacity: TSpinBox;
    LinkControlToPropertyEnabled3: TLinkControlToProperty;
    LinkControlToPropertyOpacity2: TLinkControlToProperty;
    LinkControlToPropertySoftness3: TLinkControlToProperty;
    layTopInnerGlow: TLayout;
    lblConfigurationInnerGlow: TLabel;
    layInnerGlowEnabled: TRectangle;
    imgInnerGlowEnabled: TSkSvg;
    layTitleDescriptionInnerGlowEnabled: TLayout;
    lblTitleInnerGlowEnabled: TLabel;
    lblDescriptionInnerGlowEnabled: TLabel;
    lblSwitchInnerGlowEnabled: TLabel;
    SwitchInnerGlowEnabled: TSwitch;
    layInnerGlowColor: TRectangle;
    imgInnerGlowColor: TSkSvg;
    layTitleDescriptionInnerGlowColor: TLayout;
    lblTitleInnerGlowColor: TLabel;
    lblDescriptionInnerGlowColor: TLabel;
    cbInnerGlowColor: TColorComboBox;
    layInnerGlowSoftness: TRectangle;
    imgInnerGlowSoftness: TSkSvg;
    layTitleDescriptionInnerGlowSoftness: TLayout;
    lblTitleInnerGlowSoftness: TLabel;
    lblDescriptionInnerGlowSoftness: TLabel;
    sbInnerGlowSoftness: TSpinBox;
    layInnerGlowOpacity: TRectangle;
    imgInnerGlowOpacity: TSkSvg;
    layTitleDescriptionInnerGlowOpacity: TLayout;
    lblTitleInnerGlowOpacity: TLabel;
    lblDescriptionInnerGlowOpacity: TLabel;
    sbInnerGlowOpacity: TSpinBox;
    LinkControlToPropertyEnabled4: TLinkControlToProperty;
    LinkControlToPropertyOpacity3: TLinkControlToProperty;
    LinkControlToPropertySoftness4: TLinkControlToProperty;
    procedure ShadowEnabledSwitchSwitch(Sender: TObject);
    procedure cbGlowColorChange(Sender: TObject);
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

procedure TFrame_ImageEffects.cbGlowColorChange(Sender: TObject);
begin
  GlowEffect.GlowColor := cbGlowColor.Color;
end;

procedure TFrame_ImageEffects.ShadowEnabledSwitchSwitch(Sender: TObject);
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
