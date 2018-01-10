unit DPFPEngXLib_TLB;

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
// File generated on 07/05/2017 11:34:04 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files (x86)\DigitalPersona\Bin\COM-ActiveX\DPFPEngX.dll (1)
// LIBID: {A9EFB3F6-A8C8-4684-841E-4330973057C6}
// LCID: 0
// Helpfile: 
// HelpString: DigitalPersona One Touch for Windows Engine components 1.0
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// Errors:
//   Error creating palette bitmap of (TDPFPFeatureExtraction) : Server C:\Program Files (x86)\DigitalPersona\Bin\COM-ActiveX\DPFPEngX.dll contains no icons
//   Error creating palette bitmap of (TDPFPEnrollment) : Server C:\Program Files (x86)\DigitalPersona\Bin\COM-ActiveX\DPFPEngX.dll contains no icons
//   Error creating palette bitmap of (TDPFPVerification) : Server C:\Program Files (x86)\DigitalPersona\Bin\COM-ActiveX\DPFPEngX.dll contains no icons
//   Error creating palette bitmap of (TDPFPVerificationResult) : Server C:\Program Files (x86)\DigitalPersona\Bin\COM-ActiveX\DPFPEngX.dll contains no icons
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
  DPFPEngXLibMajorVersion = 1;
  DPFPEngXLibMinorVersion = 0;

  LIBID_DPFPEngXLib: TGUID = '{A9EFB3F6-A8C8-4684-841E-4330973057C6}';

  IID_IDPFPFeatureExtraction: TGUID = '{780AAF49-C395-4AD5-8E87-1A5ABE59E1EA}';
  IID_IDPFPEnrollment: TGUID = '{0C1E3E79-C57F-4DC5-BC3C-69C920EA94F9}';
  IID_IDPFPVerificationResult: TGUID = '{B05FBE8F-1014-4DDB-8E43-2C86BAAC7909}';
  IID_IDPFPVerification: TGUID = '{7BC9C18B-D192-488D-BAB6-D43C963B2B3D}';
  CLASS_DPFPFeatureExtraction: TGUID = '{C64055AD-8960-4429-BDB4-2E102F47BD9A}';
  CLASS_DPFPEnrollment: TGUID = '{1E1020EF-4A4F-430D-A351-427821B177B2}';
  CLASS_DPFPVerification: TGUID = '{8B7A9D29-5C11-464F-A058-BFA8024805CE}';
  CLASS_DPFPVerificationResult: TGUID = '{B2D559AE-F070-4C2A-9D99-6E68DA0B1E8E}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum DPFPTemplateStatusEnum
type
  DPFPTemplateStatusEnum = TOleEnum;
const
  TemplateStatusUnknown = $00000000;
  TemplateStatusInsufficient = $00000001;
  TemplateStatusCreationFailed = $00000002;
  TemplateStatusTemplateReady = $00000003;

// Constants for enum DPFPDataPurposeEnum
type
  DPFPDataPurposeEnum = TOleEnum;
const
  DataPurposeUnknown = $00000000;
  DataPurposeVerification = $00000001;
  DataPurposeEnrollment = $00000002;

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
  IDPFPFeatureExtraction = interface;
  IDPFPFeatureExtractionDisp = dispinterface;
  IDPFPEnrollment = interface;
  IDPFPEnrollmentDisp = dispinterface;
  IDPFPVerificationResult = interface;
  IDPFPVerificationResultDisp = dispinterface;
  IDPFPVerification = interface;
  IDPFPVerificationDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DPFPFeatureExtraction = IDPFPFeatureExtraction;
  DPFPEnrollment = IDPFPEnrollment;
  DPFPVerification = IDPFPVerification;
  DPFPVerificationResult = IDPFPVerificationResult;


// *********************************************************************//
// Interface: IDPFPFeatureExtraction
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {780AAF49-C395-4AD5-8E87-1A5ABE59E1EA}
// *********************************************************************//
  IDPFPFeatureExtraction = interface(IDispatch)
    ['{780AAF49-C395-4AD5-8E87-1A5ABE59E1EA}']
    function CreateFeatureSet(const pSample: IDispatch; Purpose: DPFPDataPurposeEnum): DPFPCaptureFeedbackEnum; safecall;
    function Get_FeatureSet: IDispatch; safecall;
    property FeatureSet: IDispatch read Get_FeatureSet;
  end;

// *********************************************************************//
// DispIntf:  IDPFPFeatureExtractionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {780AAF49-C395-4AD5-8E87-1A5ABE59E1EA}
// *********************************************************************//
  IDPFPFeatureExtractionDisp = dispinterface
    ['{780AAF49-C395-4AD5-8E87-1A5ABE59E1EA}']
    function CreateFeatureSet(const pSample: IDispatch; Purpose: DPFPDataPurposeEnum): DPFPCaptureFeedbackEnum; dispid 1;
    property FeatureSet: IDispatch readonly dispid 2;
  end;

// *********************************************************************//
// Interface: IDPFPEnrollment
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0C1E3E79-C57F-4DC5-BC3C-69C920EA94F9}
// *********************************************************************//
  IDPFPEnrollment = interface(IDispatch)
    ['{0C1E3E79-C57F-4DC5-BC3C-69C920EA94F9}']
    function Get_FeaturesNeeded: Integer; safecall;
    function Get_TemplateStatus: DPFPTemplateStatusEnum; safecall;
    function Get_Template: IDispatch; safecall;
    procedure AddFeatures(const pFeatures: IDispatch); safecall;
    procedure Clear; safecall;
    property FeaturesNeeded: Integer read Get_FeaturesNeeded;
    property TemplateStatus: DPFPTemplateStatusEnum read Get_TemplateStatus;
    property Template: IDispatch read Get_Template;
  end;

// *********************************************************************//
// DispIntf:  IDPFPEnrollmentDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0C1E3E79-C57F-4DC5-BC3C-69C920EA94F9}
// *********************************************************************//
  IDPFPEnrollmentDisp = dispinterface
    ['{0C1E3E79-C57F-4DC5-BC3C-69C920EA94F9}']
    property FeaturesNeeded: Integer readonly dispid 1;
    property TemplateStatus: DPFPTemplateStatusEnum readonly dispid 2;
    property Template: IDispatch readonly dispid 3;
    procedure AddFeatures(const pFeatures: IDispatch); dispid 4;
    procedure Clear; dispid 5;
  end;

// *********************************************************************//
// Interface: IDPFPVerificationResult
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {B05FBE8F-1014-4DDB-8E43-2C86BAAC7909}
// *********************************************************************//
  IDPFPVerificationResult = interface(IDispatch)
    ['{B05FBE8F-1014-4DDB-8E43-2C86BAAC7909}']
    function Get_Verified: WordBool; safecall;
    function Get_FARAchieved: Integer; safecall;
    property Verified: WordBool read Get_Verified;
    property FARAchieved: Integer read Get_FARAchieved;
  end;

// *********************************************************************//
// DispIntf:  IDPFPVerificationResultDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {B05FBE8F-1014-4DDB-8E43-2C86BAAC7909}
// *********************************************************************//
  IDPFPVerificationResultDisp = dispinterface
    ['{B05FBE8F-1014-4DDB-8E43-2C86BAAC7909}']
    property Verified: WordBool readonly dispid 1;
    property FARAchieved: Integer readonly dispid 2;
  end;

// *********************************************************************//
// Interface: IDPFPVerification
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {7BC9C18B-D192-488D-BAB6-D43C963B2B3D}
// *********************************************************************//
  IDPFPVerification = interface(IDispatch)
    ['{7BC9C18B-D192-488D-BAB6-D43C963B2B3D}']
    function Get_FARRequested: Integer; safecall;
    procedure Set_FARRequested(pVal: Integer); safecall;
    function Verify(const pFeatureSet: IDispatch; const pTemplate: IDispatch): IDispatch; safecall;
    property FARRequested: Integer read Get_FARRequested write Set_FARRequested;
  end;

// *********************************************************************//
// DispIntf:  IDPFPVerificationDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {7BC9C18B-D192-488D-BAB6-D43C963B2B3D}
// *********************************************************************//
  IDPFPVerificationDisp = dispinterface
    ['{7BC9C18B-D192-488D-BAB6-D43C963B2B3D}']
    property FARRequested: Integer dispid 1;
    function Verify(const pFeatureSet: IDispatch; const pTemplate: IDispatch): IDispatch; dispid 2;
  end;

// *********************************************************************//
// The Class CoDPFPFeatureExtraction provides a Create and CreateRemote method to          
// create instances of the default interface IDPFPFeatureExtraction exposed by              
// the CoClass DPFPFeatureExtraction. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDPFPFeatureExtraction = class
    class function Create: IDPFPFeatureExtraction;
    class function CreateRemote(const MachineName: string): IDPFPFeatureExtraction;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDPFPFeatureExtraction
// Help String      : Fingerprint Feature Set Creator Class
// Default Interface: IDPFPFeatureExtraction
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDPFPFeatureExtractionProperties= class;
{$ENDIF}
  TDPFPFeatureExtraction = class(TOleServer)
  private
    FIntf:        IDPFPFeatureExtraction;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDPFPFeatureExtractionProperties;
    function      GetServerProperties: TDPFPFeatureExtractionProperties;
{$ENDIF}
    function      GetDefaultInterface: IDPFPFeatureExtraction;
  protected
    procedure InitServerData; override;
    function Get_FeatureSet: IDispatch;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDPFPFeatureExtraction);
    procedure Disconnect; override;
    function CreateFeatureSet(const pSample: IDispatch; Purpose: DPFPDataPurposeEnum): DPFPCaptureFeedbackEnum;
    property DefaultInterface: IDPFPFeatureExtraction read GetDefaultInterface;
    property FeatureSet: IDispatch read Get_FeatureSet;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDPFPFeatureExtractionProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDPFPFeatureExtraction
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDPFPFeatureExtractionProperties = class(TPersistent)
  private
    FServer:    TDPFPFeatureExtraction;
    function    GetDefaultInterface: IDPFPFeatureExtraction;
    constructor Create(AServer: TDPFPFeatureExtraction);
  protected
    function Get_FeatureSet: IDispatch;
  public
    property DefaultInterface: IDPFPFeatureExtraction read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoDPFPEnrollment provides a Create and CreateRemote method to          
// create instances of the default interface IDPFPEnrollment exposed by              
// the CoClass DPFPEnrollment. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDPFPEnrollment = class
    class function Create: IDPFPEnrollment;
    class function CreateRemote(const MachineName: string): IDPFPEnrollment;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDPFPEnrollment
// Help String      : Fingerprint Template Creator Class
// Default Interface: IDPFPEnrollment
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDPFPEnrollmentProperties= class;
{$ENDIF}
  TDPFPEnrollment = class(TOleServer)
  private
    FIntf:        IDPFPEnrollment;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDPFPEnrollmentProperties;
    function      GetServerProperties: TDPFPEnrollmentProperties;
{$ENDIF}
    function      GetDefaultInterface: IDPFPEnrollment;
  protected
    procedure InitServerData; override;
    function Get_FeaturesNeeded: Integer;
    function Get_TemplateStatus: DPFPTemplateStatusEnum;
    function Get_Template: IDispatch;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDPFPEnrollment);
    procedure Disconnect; override;
    procedure AddFeatures(const pFeatures: IDispatch);
    procedure Clear;
    property DefaultInterface: IDPFPEnrollment read GetDefaultInterface;
    property FeaturesNeeded: Integer read Get_FeaturesNeeded;
    property TemplateStatus: DPFPTemplateStatusEnum read Get_TemplateStatus;
    property Template: IDispatch read Get_Template;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDPFPEnrollmentProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDPFPEnrollment
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDPFPEnrollmentProperties = class(TPersistent)
  private
    FServer:    TDPFPEnrollment;
    function    GetDefaultInterface: IDPFPEnrollment;
    constructor Create(AServer: TDPFPEnrollment);
  protected
    function Get_FeaturesNeeded: Integer;
    function Get_TemplateStatus: DPFPTemplateStatusEnum;
    function Get_Template: IDispatch;
  public
    property DefaultInterface: IDPFPEnrollment read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoDPFPVerification provides a Create and CreateRemote method to          
// create instances of the default interface IDPFPVerification exposed by              
// the CoClass DPFPVerification. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDPFPVerification = class
    class function Create: IDPFPVerification;
    class function CreateRemote(const MachineName: string): IDPFPVerification;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDPFPVerification
// Help String      : Fingerprint Verification Class
// Default Interface: IDPFPVerification
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDPFPVerificationProperties= class;
{$ENDIF}
  TDPFPVerification = class(TOleServer)
  private
    FIntf:        IDPFPVerification;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDPFPVerificationProperties;
    function      GetServerProperties: TDPFPVerificationProperties;
{$ENDIF}
    function      GetDefaultInterface: IDPFPVerification;
  protected
    procedure InitServerData; override;
    function Get_FARRequested: Integer;
    procedure Set_FARRequested(pVal: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDPFPVerification);
    procedure Disconnect; override;
    function Verify(const pFeatureSet: IDispatch; const pTemplate: IDispatch): IDispatch;
    property DefaultInterface: IDPFPVerification read GetDefaultInterface;
    property FARRequested: Integer read Get_FARRequested write Set_FARRequested;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDPFPVerificationProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDPFPVerification
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDPFPVerificationProperties = class(TPersistent)
  private
    FServer:    TDPFPVerification;
    function    GetDefaultInterface: IDPFPVerification;
    constructor Create(AServer: TDPFPVerification);
  protected
    function Get_FARRequested: Integer;
    procedure Set_FARRequested(pVal: Integer);
  public
    property DefaultInterface: IDPFPVerification read GetDefaultInterface;
  published
    property FARRequested: Integer read Get_FARRequested write Set_FARRequested;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoDPFPVerificationResult provides a Create and CreateRemote method to          
// create instances of the default interface IDPFPVerificationResult exposed by              
// the CoClass DPFPVerificationResult. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDPFPVerificationResult = class
    class function Create: IDPFPVerificationResult;
    class function CreateRemote(const MachineName: string): IDPFPVerificationResult;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDPFPVerificationResult
// Help String      : Fingerprint Verification Result Class
// Default Interface: IDPFPVerificationResult
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDPFPVerificationResultProperties= class;
{$ENDIF}
  TDPFPVerificationResult = class(TOleServer)
  private
    FIntf:        IDPFPVerificationResult;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDPFPVerificationResultProperties;
    function      GetServerProperties: TDPFPVerificationResultProperties;
{$ENDIF}
    function      GetDefaultInterface: IDPFPVerificationResult;
  protected
    procedure InitServerData; override;
    function Get_Verified: WordBool;
    function Get_FARAchieved: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDPFPVerificationResult);
    procedure Disconnect; override;
    property DefaultInterface: IDPFPVerificationResult read GetDefaultInterface;
    property Verified: WordBool read Get_Verified;
    property FARAchieved: Integer read Get_FARAchieved;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDPFPVerificationResultProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDPFPVerificationResult
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDPFPVerificationResultProperties = class(TPersistent)
  private
    FServer:    TDPFPVerificationResult;
    function    GetDefaultInterface: IDPFPVerificationResult;
    constructor Create(AServer: TDPFPVerificationResult);
  protected
    function Get_Verified: WordBool;
    function Get_FARAchieved: Integer;
  public
    property DefaultInterface: IDPFPVerificationResult read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoDPFPFeatureExtraction.Create: IDPFPFeatureExtraction;
begin
  Result := CreateComObject(CLASS_DPFPFeatureExtraction) as IDPFPFeatureExtraction;
end;

class function CoDPFPFeatureExtraction.CreateRemote(const MachineName: string): IDPFPFeatureExtraction;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DPFPFeatureExtraction) as IDPFPFeatureExtraction;
end;

procedure TDPFPFeatureExtraction.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{C64055AD-8960-4429-BDB4-2E102F47BD9A}';
    IntfIID:   '{780AAF49-C395-4AD5-8E87-1A5ABE59E1EA}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDPFPFeatureExtraction.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDPFPFeatureExtraction;
  end;
end;

procedure TDPFPFeatureExtraction.ConnectTo(svrIntf: IDPFPFeatureExtraction);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDPFPFeatureExtraction.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDPFPFeatureExtraction.GetDefaultInterface: IDPFPFeatureExtraction;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDPFPFeatureExtraction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDPFPFeatureExtractionProperties.Create(Self);
{$ENDIF}
end;

destructor TDPFPFeatureExtraction.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDPFPFeatureExtraction.GetServerProperties: TDPFPFeatureExtractionProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TDPFPFeatureExtraction.Get_FeatureSet: IDispatch;
begin
    Result := DefaultInterface.FeatureSet;
end;

function TDPFPFeatureExtraction.CreateFeatureSet(const pSample: IDispatch; 
                                                 Purpose: DPFPDataPurposeEnum): DPFPCaptureFeedbackEnum;
begin
  Result := DefaultInterface.CreateFeatureSet(pSample, Purpose);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDPFPFeatureExtractionProperties.Create(AServer: TDPFPFeatureExtraction);
begin
  inherited Create;
  FServer := AServer;
end;

function TDPFPFeatureExtractionProperties.GetDefaultInterface: IDPFPFeatureExtraction;
begin
  Result := FServer.DefaultInterface;
end;

function TDPFPFeatureExtractionProperties.Get_FeatureSet: IDispatch;
begin
    Result := DefaultInterface.FeatureSet;
end;

{$ENDIF}

class function CoDPFPEnrollment.Create: IDPFPEnrollment;
begin
  Result := CreateComObject(CLASS_DPFPEnrollment) as IDPFPEnrollment;
end;

class function CoDPFPEnrollment.CreateRemote(const MachineName: string): IDPFPEnrollment;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DPFPEnrollment) as IDPFPEnrollment;
end;

procedure TDPFPEnrollment.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{1E1020EF-4A4F-430D-A351-427821B177B2}';
    IntfIID:   '{0C1E3E79-C57F-4DC5-BC3C-69C920EA94F9}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDPFPEnrollment.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDPFPEnrollment;
  end;
end;

procedure TDPFPEnrollment.ConnectTo(svrIntf: IDPFPEnrollment);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDPFPEnrollment.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDPFPEnrollment.GetDefaultInterface: IDPFPEnrollment;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDPFPEnrollment.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDPFPEnrollmentProperties.Create(Self);
{$ENDIF}
end;

destructor TDPFPEnrollment.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDPFPEnrollment.GetServerProperties: TDPFPEnrollmentProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TDPFPEnrollment.Get_FeaturesNeeded: Integer;
begin
    Result := DefaultInterface.FeaturesNeeded;
end;

function TDPFPEnrollment.Get_TemplateStatus: DPFPTemplateStatusEnum;
begin
    Result := DefaultInterface.TemplateStatus;
end;

function TDPFPEnrollment.Get_Template: IDispatch;
begin
    Result := DefaultInterface.Template;
end;

procedure TDPFPEnrollment.AddFeatures(const pFeatures: IDispatch);
begin
  DefaultInterface.AddFeatures(pFeatures);
end;

procedure TDPFPEnrollment.Clear;
begin
  DefaultInterface.Clear;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDPFPEnrollmentProperties.Create(AServer: TDPFPEnrollment);
begin
  inherited Create;
  FServer := AServer;
end;

function TDPFPEnrollmentProperties.GetDefaultInterface: IDPFPEnrollment;
begin
  Result := FServer.DefaultInterface;
end;

function TDPFPEnrollmentProperties.Get_FeaturesNeeded: Integer;
begin
    Result := DefaultInterface.FeaturesNeeded;
end;

function TDPFPEnrollmentProperties.Get_TemplateStatus: DPFPTemplateStatusEnum;
begin
    Result := DefaultInterface.TemplateStatus;
end;

function TDPFPEnrollmentProperties.Get_Template: IDispatch;
begin
    Result := DefaultInterface.Template;
end;

{$ENDIF}

class function CoDPFPVerification.Create: IDPFPVerification;
begin
  Result := CreateComObject(CLASS_DPFPVerification) as IDPFPVerification;
end;

class function CoDPFPVerification.CreateRemote(const MachineName: string): IDPFPVerification;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DPFPVerification) as IDPFPVerification;
end;

procedure TDPFPVerification.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{8B7A9D29-5C11-464F-A058-BFA8024805CE}';
    IntfIID:   '{7BC9C18B-D192-488D-BAB6-D43C963B2B3D}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDPFPVerification.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDPFPVerification;
  end;
end;

procedure TDPFPVerification.ConnectTo(svrIntf: IDPFPVerification);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDPFPVerification.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDPFPVerification.GetDefaultInterface: IDPFPVerification;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDPFPVerification.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDPFPVerificationProperties.Create(Self);
{$ENDIF}
end;

destructor TDPFPVerification.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDPFPVerification.GetServerProperties: TDPFPVerificationProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TDPFPVerification.Get_FARRequested: Integer;
begin
    Result := DefaultInterface.FARRequested;
end;

procedure TDPFPVerification.Set_FARRequested(pVal: Integer);
begin
  DefaultInterface.Set_FARRequested(pVal);
end;

function TDPFPVerification.Verify(const pFeatureSet: IDispatch; const pTemplate: IDispatch): IDispatch;
begin
  Result := DefaultInterface.Verify(pFeatureSet, pTemplate);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDPFPVerificationProperties.Create(AServer: TDPFPVerification);
begin
  inherited Create;
  FServer := AServer;
end;

function TDPFPVerificationProperties.GetDefaultInterface: IDPFPVerification;
begin
  Result := FServer.DefaultInterface;
end;

function TDPFPVerificationProperties.Get_FARRequested: Integer;
begin
    Result := DefaultInterface.FARRequested;
end;

procedure TDPFPVerificationProperties.Set_FARRequested(pVal: Integer);
begin
  DefaultInterface.Set_FARRequested(pVal);
end;

{$ENDIF}

class function CoDPFPVerificationResult.Create: IDPFPVerificationResult;
begin
  Result := CreateComObject(CLASS_DPFPVerificationResult) as IDPFPVerificationResult;
end;

class function CoDPFPVerificationResult.CreateRemote(const MachineName: string): IDPFPVerificationResult;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DPFPVerificationResult) as IDPFPVerificationResult;
end;

procedure TDPFPVerificationResult.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{B2D559AE-F070-4C2A-9D99-6E68DA0B1E8E}';
    IntfIID:   '{B05FBE8F-1014-4DDB-8E43-2C86BAAC7909}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDPFPVerificationResult.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDPFPVerificationResult;
  end;
end;

procedure TDPFPVerificationResult.ConnectTo(svrIntf: IDPFPVerificationResult);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDPFPVerificationResult.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDPFPVerificationResult.GetDefaultInterface: IDPFPVerificationResult;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDPFPVerificationResult.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDPFPVerificationResultProperties.Create(Self);
{$ENDIF}
end;

destructor TDPFPVerificationResult.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDPFPVerificationResult.GetServerProperties: TDPFPVerificationResultProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TDPFPVerificationResult.Get_Verified: WordBool;
begin
    Result := DefaultInterface.Verified;
end;

function TDPFPVerificationResult.Get_FARAchieved: Integer;
begin
    Result := DefaultInterface.FARAchieved;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDPFPVerificationResultProperties.Create(AServer: TDPFPVerificationResult);
begin
  inherited Create;
  FServer := AServer;
end;

function TDPFPVerificationResultProperties.GetDefaultInterface: IDPFPVerificationResult;
begin
  Result := FServer.DefaultInterface;
end;

function TDPFPVerificationResultProperties.Get_Verified: WordBool;
begin
    Result := DefaultInterface.Verified;
end;

function TDPFPVerificationResultProperties.Get_FARAchieved: Integer;
begin
    Result := DefaultInterface.FARAchieved;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TDPFPFeatureExtraction, TDPFPEnrollment, TDPFPVerification, TDPFPVerificationResult]);
end;

end.
