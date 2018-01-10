unit DPFPShrXLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 07/05/2017 09:34:26 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files (x86)\DigitalPersona\Bin\COM-ActiveX\DPFPShrX.dll (1)
// LIBID: {B8FAC44B-A9C5-478E-A9BF-566419996CAE}
// LCID: 0
// Helpfile: 
// HelpString: DigitalPersona One Touch for Windows Shared components 1.0
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// Errors:
//   Error creating palette bitmap of (TDPFPFeatureSet) : Server C:\Program Files (x86)\DigitalPersona\Bin\COM-ActiveX\DPFPShrX.dll contains no icons
//   Error creating palette bitmap of (TDPFPSample) : Server C:\Program Files (x86)\DigitalPersona\Bin\COM-ActiveX\DPFPShrX.dll contains no icons
//   Error creating palette bitmap of (TDPFPTemplate) : Server C:\Program Files (x86)\DigitalPersona\Bin\COM-ActiveX\DPFPShrX.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  DPFPShrXLibMajorVersion = 1;
  DPFPShrXLibMinorVersion = 0;

  LIBID_DPFPShrXLib: TGUID = '{B8FAC44B-A9C5-478E-A9BF-566419996CAE}';

  IID_IDPFPData: TGUID = '{518B0981-E805-4734-809C-D9F03637183A}';
  IID_IDPFPSample: TGUID = '{7E0097FF-7B58-46F9-BBD6-3F91C53757A0}';
  IID_IDPFPFeatureSet: TGUID = '{5929F2D9-8E34-4350-ADD7-F865ED9A19FD}';
  IID_IDPFPTemplate: TGUID = '{737FD7A9-75EF-4B22-9014-8F13A10C48F2}';
  CLASS_DPFPFeatureSet: TGUID = '{A93BFBD6-93A0-4DBD-92F8-0D2DD80F0824}';
  CLASS_DPFPSample: TGUID = '{D005543B-EA11-499D-B3EA-37266D74BE79}';
  CLASS_DPFPTemplate: TGUID = '{3926DADA-23CD-42BD-818E-2AAA37522307}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum DPFPCaptureFeedbackEnum
type
  DPFPCaptureFeedbackEnum = TOleEnum;
const
  CaptureFeedbackGood = $00000000;
  CaptureFeedbackNone = $00000001;
  CaptureFeedbackTooLight = $00000002;
  CaptureFeedbackTooDark = $00000003;
  CaptureFeedbackTooNoisy = $00000004;
  CaptureFeedbackLowContrast = $00000005;
  CaptureFeedbackNotEnoughFtrs = $00000006;
  CaptureFeedbackNoCentralRgn = $00000007;
  CaptureFeedbackNoFinger = $00000008;
  CaptureFeedbackTooHigh = $00000009;
  CaptureFeedbackTooLow = $0000000A;
  CaptureFeedbackTooLeft = $0000000B;
  CaptureFeedbackTooRight = $0000000C;
  CaptureFeedbackTooStrange = $0000000D;
  CaptureFeedbackTooFast = $0000000E;
  CaptureFeedbackTooSkewed = $0000000F;
  CaptureFeedbackTooShort = $00000010;
  CaptureFeedbackTooSlow = $00000011;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IDPFPData = interface;
  IDPFPDataDisp = dispinterface;
  IDPFPSample = interface;
  IDPFPSampleDisp = dispinterface;
  IDPFPFeatureSet = interface;
  IDPFPFeatureSetDisp = dispinterface;
  IDPFPTemplate = interface;
  IDPFPTemplateDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DPFPFeatureSet = IDPFPFeatureSet;
  DPFPSample = IDPFPSample;
  DPFPTemplate = IDPFPTemplate;


// *********************************************************************//
// Interface: IDPFPData
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {518B0981-E805-4734-809C-D9F03637183A}
// *********************************************************************//
  IDPFPData = interface(IDispatch)
    ['{518B0981-E805-4734-809C-D9F03637183A}']
    function Serialize: OleVariant; safecall;
    procedure Deserialize(RawData: OleVariant); safecall;
  end;

// *********************************************************************//
// DispIntf:  IDPFPDataDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {518B0981-E805-4734-809C-D9F03637183A}
// *********************************************************************//
  IDPFPDataDisp = dispinterface
    ['{518B0981-E805-4734-809C-D9F03637183A}']
    function Serialize: OleVariant; dispid 1;
    procedure Deserialize(RawData: OleVariant); dispid 2;
  end;

// *********************************************************************//
// Interface: IDPFPSample
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {7E0097FF-7B58-46F9-BBD6-3F91C53757A0}
// *********************************************************************//
  IDPFPSample = interface(IDPFPData)
    ['{7E0097FF-7B58-46F9-BBD6-3F91C53757A0}']
  end;

// *********************************************************************//
// DispIntf:  IDPFPSampleDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {7E0097FF-7B58-46F9-BBD6-3F91C53757A0}
// *********************************************************************//
  IDPFPSampleDisp = dispinterface
    ['{7E0097FF-7B58-46F9-BBD6-3F91C53757A0}']
    function Serialize: OleVariant; dispid 1;
    procedure Deserialize(RawData: OleVariant); dispid 2;
  end;

// *********************************************************************//
// Interface: IDPFPFeatureSet
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {5929F2D9-8E34-4350-ADD7-F865ED9A19FD}
// *********************************************************************//
  IDPFPFeatureSet = interface(IDPFPData)
    ['{5929F2D9-8E34-4350-ADD7-F865ED9A19FD}']
  end;

// *********************************************************************//
// DispIntf:  IDPFPFeatureSetDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {5929F2D9-8E34-4350-ADD7-F865ED9A19FD}
// *********************************************************************//
  IDPFPFeatureSetDisp = dispinterface
    ['{5929F2D9-8E34-4350-ADD7-F865ED9A19FD}']
    function Serialize: OleVariant; dispid 1;
    procedure Deserialize(RawData: OleVariant); dispid 2;
  end;

// *********************************************************************//
// Interface: IDPFPTemplate
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {737FD7A9-75EF-4B22-9014-8F13A10C48F2}
// *********************************************************************//
  IDPFPTemplate = interface(IDPFPData)
    ['{737FD7A9-75EF-4B22-9014-8F13A10C48F2}']
  end;

// *********************************************************************//
// DispIntf:  IDPFPTemplateDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {737FD7A9-75EF-4B22-9014-8F13A10C48F2}
// *********************************************************************//
  IDPFPTemplateDisp = dispinterface
    ['{737FD7A9-75EF-4B22-9014-8F13A10C48F2}']
    function Serialize: OleVariant; dispid 1;
    procedure Deserialize(RawData: OleVariant); dispid 2;
  end;

// *********************************************************************//
// The Class CoDPFPFeatureSet provides a Create and CreateRemote method to          
// create instances of the default interface IDPFPFeatureSet exposed by              
// the CoClass DPFPFeatureSet. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDPFPFeatureSet = class
    class function Create: IDPFPFeatureSet;
    class function CreateRemote(const MachineName: string): IDPFPFeatureSet;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDPFPFeatureSet
// Help String      : Fingerprint Feature Set Class
// Default Interface: IDPFPFeatureSet
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDPFPFeatureSetProperties= class;
{$ENDIF}
  TDPFPFeatureSet = class(TOleServer)
  private
    FIntf:        IDPFPFeatureSet;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDPFPFeatureSetProperties;
    function      GetServerProperties: TDPFPFeatureSetProperties;
{$ENDIF}
    function      GetDefaultInterface: IDPFPFeatureSet;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDPFPFeatureSet);
    procedure Disconnect; override;
    property DefaultInterface: IDPFPFeatureSet read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDPFPFeatureSetProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDPFPFeatureSet
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDPFPFeatureSetProperties = class(TPersistent)
  private
    FServer:    TDPFPFeatureSet;
    function    GetDefaultInterface: IDPFPFeatureSet;
    constructor Create(AServer: TDPFPFeatureSet);
  protected
  public
    property DefaultInterface: IDPFPFeatureSet read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoDPFPSample provides a Create and CreateRemote method to          
// create instances of the default interface IDPFPSample exposed by              
// the CoClass DPFPSample. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDPFPSample = class
    class function Create: IDPFPSample;
    class function CreateRemote(const MachineName: string): IDPFPSample;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDPFPSample
// Help String      : Fingerprint Sample Class
// Default Interface: IDPFPSample
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDPFPSampleProperties= class;
{$ENDIF}
  TDPFPSample = class(TOleServer)
  private
    FIntf:        IDPFPSample;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDPFPSampleProperties;
    function      GetServerProperties: TDPFPSampleProperties;
{$ENDIF}
    function      GetDefaultInterface: IDPFPSample;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDPFPSample);
    procedure Disconnect; override;
    property DefaultInterface: IDPFPSample read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDPFPSampleProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDPFPSample
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDPFPSampleProperties = class(TPersistent)
  private
    FServer:    TDPFPSample;
    function    GetDefaultInterface: IDPFPSample;
    constructor Create(AServer: TDPFPSample);
  protected
  public
    property DefaultInterface: IDPFPSample read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoDPFPTemplate provides a Create and CreateRemote method to          
// create instances of the default interface IDPFPTemplate exposed by              
// the CoClass DPFPTemplate. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDPFPTemplate = class
    class function Create: IDPFPTemplate;
    class function CreateRemote(const MachineName: string): IDPFPTemplate;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDPFPTemplate
// Help String      : Fingerprint Template Class
// Default Interface: IDPFPTemplate
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDPFPTemplateProperties= class;
{$ENDIF}
  TDPFPTemplate = class(TOleServer)
  private
    FIntf:        IDPFPTemplate;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDPFPTemplateProperties;
    function      GetServerProperties: TDPFPTemplateProperties;
{$ENDIF}
    function      GetDefaultInterface: IDPFPTemplate;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDPFPTemplate);
    procedure Disconnect; override;
    property DefaultInterface: IDPFPTemplate read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDPFPTemplateProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDPFPTemplate
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDPFPTemplateProperties = class(TPersistent)
  private
    FServer:    TDPFPTemplate;
    function    GetDefaultInterface: IDPFPTemplate;
    constructor Create(AServer: TDPFPTemplate);
  protected
  public
    property DefaultInterface: IDPFPTemplate read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoDPFPFeatureSet.Create: IDPFPFeatureSet;
begin
  Result := CreateComObject(CLASS_DPFPFeatureSet) as IDPFPFeatureSet;
end;

class function CoDPFPFeatureSet.CreateRemote(const MachineName: string): IDPFPFeatureSet;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DPFPFeatureSet) as IDPFPFeatureSet;
end;

procedure TDPFPFeatureSet.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{A93BFBD6-93A0-4DBD-92F8-0D2DD80F0824}';
    IntfIID:   '{5929F2D9-8E34-4350-ADD7-F865ED9A19FD}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDPFPFeatureSet.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDPFPFeatureSet;
  end;
end;

procedure TDPFPFeatureSet.ConnectTo(svrIntf: IDPFPFeatureSet);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDPFPFeatureSet.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDPFPFeatureSet.GetDefaultInterface: IDPFPFeatureSet;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDPFPFeatureSet.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDPFPFeatureSetProperties.Create(Self);
{$ENDIF}
end;

destructor TDPFPFeatureSet.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDPFPFeatureSet.GetServerProperties: TDPFPFeatureSetProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDPFPFeatureSetProperties.Create(AServer: TDPFPFeatureSet);
begin
  inherited Create;
  FServer := AServer;
end;

function TDPFPFeatureSetProperties.GetDefaultInterface: IDPFPFeatureSet;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoDPFPSample.Create: IDPFPSample;
begin
  Result := CreateComObject(CLASS_DPFPSample) as IDPFPSample;
end;

class function CoDPFPSample.CreateRemote(const MachineName: string): IDPFPSample;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DPFPSample) as IDPFPSample;
end;

procedure TDPFPSample.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{D005543B-EA11-499D-B3EA-37266D74BE79}';
    IntfIID:   '{7E0097FF-7B58-46F9-BBD6-3F91C53757A0}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDPFPSample.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDPFPSample;
  end;
end;

procedure TDPFPSample.ConnectTo(svrIntf: IDPFPSample);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDPFPSample.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDPFPSample.GetDefaultInterface: IDPFPSample;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDPFPSample.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDPFPSampleProperties.Create(Self);
{$ENDIF}
end;

destructor TDPFPSample.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDPFPSample.GetServerProperties: TDPFPSampleProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDPFPSampleProperties.Create(AServer: TDPFPSample);
begin
  inherited Create;
  FServer := AServer;
end;

function TDPFPSampleProperties.GetDefaultInterface: IDPFPSample;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoDPFPTemplate.Create: IDPFPTemplate;
begin
  Result := CreateComObject(CLASS_DPFPTemplate) as IDPFPTemplate;
end;

class function CoDPFPTemplate.CreateRemote(const MachineName: string): IDPFPTemplate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DPFPTemplate) as IDPFPTemplate;
end;

procedure TDPFPTemplate.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{3926DADA-23CD-42BD-818E-2AAA37522307}';
    IntfIID:   '{737FD7A9-75EF-4B22-9014-8F13A10C48F2}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDPFPTemplate.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDPFPTemplate;
  end;
end;

procedure TDPFPTemplate.ConnectTo(svrIntf: IDPFPTemplate);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDPFPTemplate.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDPFPTemplate.GetDefaultInterface: IDPFPTemplate;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDPFPTemplate.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDPFPTemplateProperties.Create(Self);
{$ENDIF}
end;

destructor TDPFPTemplate.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDPFPTemplate.GetServerProperties: TDPFPTemplateProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDPFPTemplateProperties.Create(AServer: TDPFPTemplate);
begin
  inherited Create;
  FServer := AServer;
end;

function TDPFPTemplateProperties.GetDefaultInterface: IDPFPTemplate;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TDPFPFeatureSet, TDPFPSample, TDPFPTemplate]);
end;

end.
