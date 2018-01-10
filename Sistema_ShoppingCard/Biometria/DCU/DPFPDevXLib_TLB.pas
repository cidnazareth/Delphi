unit DPFPDevXLib_TLB;

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
// File generated on 09/05/2017 19:58:46 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files (x86)\DigitalPersona\Bin\COM-ActiveX\DPFPDevX.dll (1)
// LIBID: {BCDEF2D4-F788-4A38-B0C2-C97B3F9FB791}
// LCID: 0
// Helpfile: 
// HelpString: DigitalPersona One Touch for Windows Device components 1.0
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// Errors:
//   Error creating palette bitmap of (TDPFPReaderDescription) : Server C:\Program Files (x86)\DigitalPersona\Bin\COM-ActiveX\DPFPDevX.dll contains no icons
//   Error creating palette bitmap of (TDPFPReadersCollection) : Server C:\Program Files (x86)\DigitalPersona\Bin\COM-ActiveX\DPFPDevX.dll contains no icons
//   Error creating palette bitmap of (TDPFPCapture) : Server C:\Program Files (x86)\DigitalPersona\Bin\COM-ActiveX\DPFPDevX.dll contains no icons
//   Error creating palette bitmap of (TDPFPSampleConversion) : Server C:\Program Files (x86)\DigitalPersona\Bin\COM-ActiveX\DPFPDevX.dll contains no icons
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
  DPFPDevXLibMajorVersion = 1;
  DPFPDevXLibMinorVersion = 0;

  LIBID_DPFPDevXLib: TGUID = '{BCDEF2D4-F788-4A38-B0C2-C97B3F9FB791}';

  IID_IDPFPReaderDescription: TGUID = '{A582741B-8913-4E8C-8621-6D907EC8363D}';
  IID_IDPFPReadersCollection: TGUID = '{176F9311-1132-433C-88D4-2060C7A25946}';
  IID_IDPFPCapture: TGUID = '{4984B820-7BA4-41D2-901B-3E98B91BEFD6}';
  IID_IDPFPSampleConversion: TGUID = '{34CE265E-92E3-4884-922B-D4C7E9AD43BA}';
  DIID__IDPFPCaptureEvents: TGUID = '{C1673A85-2C18-49CA-9644-F08E71D94EDB}';
  CLASS_DPFPReaderDescription: TGUID = '{0A611435-B092-45C7-B928-137255359B7A}';
  CLASS_DPFPReadersCollection: TGUID = '{2BF17AC6-58B6-4AF2-82A3-1DD4C4F99CE2}';
  CLASS_DPFPCapture: TGUID = '{3FA859DA-300C-4247-BD33-6011198399C0}';
  CLASS_DPFPSampleConversion: TGUID = '{F6CEDB0E-A5F3-4C9C-BDB0-58B2BC9A4BF3}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum DPFPReaderSerialNumberTypeEnum
type
  DPFPReaderSerialNumberTypeEnum = TOleEnum;
const
  ReaderSerialNumberTypePersistent = $00000000;
  ReaderSerialNumberTypeVolatile = $00000001;

// Constants for enum DPFPReaderImpressionTypeEnum
type
  DPFPReaderImpressionTypeEnum = TOleEnum;
const
  ReaderImpressionTypeUnknown = $00000000;
  ReaderImpressionTypeSwipe = $00000001;
  ReaderImpressionTypeArea = $00000002;

// Constants for enum DPFPReaderTechnologyEnum
type
  DPFPReaderTechnologyEnum = TOleEnum;
const
  ReaderTechnologyUnknown = $00000000;
  ReaderTechnologyOptical = $00000001;
  ReaderTechnologyCapacitive = $00000002;
  ReaderTechnologyThermal = $00000003;
  ReaderTechnologyPressure = $00000004;

// Constants for enum DPFPCapturePriorityEnum
type
  DPFPCapturePriorityEnum = TOleEnum;
const
  CapturePriorityLow = $00000000;
  CapturePriorityNormal = $00000001;
  CapturePriorityHigh = $00000002;

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
  IDPFPReaderDescription = interface;
  IDPFPReaderDescriptionDisp = dispinterface;
  IDPFPReadersCollection = interface;
  IDPFPReadersCollectionDisp = dispinterface;
  IDPFPCapture = interface;
  IDPFPCaptureDisp = dispinterface;
  IDPFPSampleConversion = interface;
  IDPFPSampleConversionDisp = dispinterface;
  _IDPFPCaptureEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DPFPReaderDescription = IDPFPReaderDescription;
  DPFPReadersCollection = IDPFPReadersCollection;
  DPFPCapture = IDPFPCapture;
  DPFPSampleConversion = IDPFPSampleConversion;


// *********************************************************************//
// Interface: IDPFPReaderDescription
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {A582741B-8913-4E8C-8621-6D907EC8363D}
// *********************************************************************//
  IDPFPReaderDescription = interface(IDispatch)
    ['{A582741B-8913-4E8C-8621-6D907EC8363D}']
    function Get_SerialNumber: WideString; safecall;
    function Get_SerialNumberType: DPFPReaderSerialNumberTypeEnum; safecall;
    function Get_ImpressionType: DPFPReaderImpressionTypeEnum; safecall;
    function Get_Technology: DPFPReaderTechnologyEnum; safecall;
    function Get_LanguageID: Integer; safecall;
    function Get_Vendor: WideString; safecall;
    function Get_ProductName: WideString; safecall;
    function Get_HardwareRevision: WideString; safecall;
    function Get_FirmwareRevision: WideString; safecall;
    property SerialNumber: WideString read Get_SerialNumber;
    property SerialNumberType: DPFPReaderSerialNumberTypeEnum read Get_SerialNumberType;
    property ImpressionType: DPFPReaderImpressionTypeEnum read Get_ImpressionType;
    property Technology: DPFPReaderTechnologyEnum read Get_Technology;
    property LanguageID: Integer read Get_LanguageID;
    property Vendor: WideString read Get_Vendor;
    property ProductName: WideString read Get_ProductName;
    property HardwareRevision: WideString read Get_HardwareRevision;
    property FirmwareRevision: WideString read Get_FirmwareRevision;
  end;

// *********************************************************************//
// DispIntf:  IDPFPReaderDescriptionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {A582741B-8913-4E8C-8621-6D907EC8363D}
// *********************************************************************//
  IDPFPReaderDescriptionDisp = dispinterface
    ['{A582741B-8913-4E8C-8621-6D907EC8363D}']
    property SerialNumber: WideString readonly dispid 1;
    property SerialNumberType: DPFPReaderSerialNumberTypeEnum readonly dispid 2;
    property ImpressionType: DPFPReaderImpressionTypeEnum readonly dispid 3;
    property Technology: DPFPReaderTechnologyEnum readonly dispid 4;
    property LanguageID: Integer readonly dispid 5;
    property Vendor: WideString readonly dispid 6;
    property ProductName: WideString readonly dispid 7;
    property HardwareRevision: WideString readonly dispid 8;
    property FirmwareRevision: WideString readonly dispid 9;
  end;

// *********************************************************************//
// Interface: IDPFPReadersCollection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {176F9311-1132-433C-88D4-2060C7A25946}
// *********************************************************************//
  IDPFPReadersCollection = interface(IDispatch)
    ['{176F9311-1132-433C-88D4-2060C7A25946}']
    function Get_Count: Integer; safecall;
    function Reader(const ReaderSerialNumber: WideString): IDispatch; safecall;
    function Get_Item(lDevice: Integer): IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property Item[lDevice: Integer]: IDispatch read Get_Item; default;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  IDPFPReadersCollectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {176F9311-1132-433C-88D4-2060C7A25946}
// *********************************************************************//
  IDPFPReadersCollectionDisp = dispinterface
    ['{176F9311-1132-433C-88D4-2060C7A25946}']
    property Count: Integer readonly dispid 1;
    function Reader(const ReaderSerialNumber: WideString): IDispatch; dispid 2;
    property Item[lDevice: Integer]: IDispatch readonly dispid 0; default;
    property _NewEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IDPFPCapture
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {4984B820-7BA4-41D2-901B-3E98B91BEFD6}
// *********************************************************************//
  IDPFPCapture = interface(IDispatch)
    ['{4984B820-7BA4-41D2-901B-3E98B91BEFD6}']
    procedure StartCapture; safecall;
    procedure StopCapture; safecall;
    function Get_ReaderSerialNumber: WideString; safecall;
    procedure Set_ReaderSerialNumber(const pVal: WideString); safecall;
    function Get_Priority: DPFPCapturePriorityEnum; safecall;
    procedure Set_Priority(pVal: DPFPCapturePriorityEnum); safecall;
    property ReaderSerialNumber: WideString read Get_ReaderSerialNumber write Set_ReaderSerialNumber;
    property Priority: DPFPCapturePriorityEnum read Get_Priority write Set_Priority;
  end;

// *********************************************************************//
// DispIntf:  IDPFPCaptureDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {4984B820-7BA4-41D2-901B-3E98B91BEFD6}
// *********************************************************************//
  IDPFPCaptureDisp = dispinterface
    ['{4984B820-7BA4-41D2-901B-3E98B91BEFD6}']
    procedure StartCapture; dispid 1;
    procedure StopCapture; dispid 2;
    property ReaderSerialNumber: WideString dispid 3;
    property Priority: DPFPCapturePriorityEnum dispid 4;
  end;

// *********************************************************************//
// Interface: IDPFPSampleConversion
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {34CE265E-92E3-4884-922B-D4C7E9AD43BA}
// *********************************************************************//
  IDPFPSampleConversion = interface(IDispatch)
    ['{34CE265E-92E3-4884-922B-D4C7E9AD43BA}']
    function ConvertToPicture(const pSample: IDispatch): IDispatch; safecall;
    function ConvertToANSI381(const pSample: IDispatch): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IDPFPSampleConversionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {34CE265E-92E3-4884-922B-D4C7E9AD43BA}
// *********************************************************************//
  IDPFPSampleConversionDisp = dispinterface
    ['{34CE265E-92E3-4884-922B-D4C7E9AD43BA}']
    function ConvertToPicture(const pSample: IDispatch): IDispatch; dispid 1;
    function ConvertToANSI381(const pSample: IDispatch): OleVariant; dispid 2;
  end;

// *********************************************************************//
// DispIntf:  _IDPFPCaptureEvents
// Flags:     (4096) Dispatchable
// GUID:      {C1673A85-2C18-49CA-9644-F08E71D94EDB}
// *********************************************************************//
  _IDPFPCaptureEvents = dispinterface
    ['{C1673A85-2C18-49CA-9644-F08E71D94EDB}']
    procedure OnComplete(const ReaderSerNum: WideString; const pSample: IDispatch); dispid 1;
    procedure OnReaderDisconnect(const ReaderSerNum: WideString); dispid 2;
    procedure OnReaderConnect(const ReaderSerNum: WideString); dispid 3;
    procedure OnFingerTouch(const ReaderSerNum: WideString); dispid 4;
    procedure OnFingerGone(const ReaderSerNum: WideString); dispid 5;
    procedure OnSampleQuality(const ReaderSerNum: WideString; 
                              CaptureFeedback: DPFPCaptureFeedbackEnum); dispid 6;
  end;

// *********************************************************************//
// The Class CoDPFPReaderDescription provides a Create and CreateRemote method to          
// create instances of the default interface IDPFPReaderDescription exposed by              
// the CoClass DPFPReaderDescription. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDPFPReaderDescription = class
    class function Create: IDPFPReaderDescription;
    class function CreateRemote(const MachineName: string): IDPFPReaderDescription;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDPFPReaderDescription
// Help String      : Fingerprint Reader Description Class
// Default Interface: IDPFPReaderDescription
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDPFPReaderDescriptionProperties= class;
{$ENDIF}
  TDPFPReaderDescription = class(TOleServer)
  private
    FIntf:        IDPFPReaderDescription;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDPFPReaderDescriptionProperties;
    function      GetServerProperties: TDPFPReaderDescriptionProperties;
{$ENDIF}
    function      GetDefaultInterface: IDPFPReaderDescription;
  protected
    procedure InitServerData; override;
    function Get_SerialNumber: WideString;
    function Get_SerialNumberType: DPFPReaderSerialNumberTypeEnum;
    function Get_ImpressionType: DPFPReaderImpressionTypeEnum;
    function Get_Technology: DPFPReaderTechnologyEnum;
    function Get_LanguageID: Integer;
    function Get_Vendor: WideString;
    function Get_ProductName: WideString;
    function Get_HardwareRevision: WideString;
    function Get_FirmwareRevision: WideString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDPFPReaderDescription);
    procedure Disconnect; override;
    property DefaultInterface: IDPFPReaderDescription read GetDefaultInterface;
    property SerialNumber: WideString read Get_SerialNumber;
    property SerialNumberType: DPFPReaderSerialNumberTypeEnum read Get_SerialNumberType;
    property ImpressionType: DPFPReaderImpressionTypeEnum read Get_ImpressionType;
    property Technology: DPFPReaderTechnologyEnum read Get_Technology;
    property LanguageID: Integer read Get_LanguageID;
    property Vendor: WideString read Get_Vendor;
    property ProductName: WideString read Get_ProductName;
    property HardwareRevision: WideString read Get_HardwareRevision;
    property FirmwareRevision: WideString read Get_FirmwareRevision;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDPFPReaderDescriptionProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDPFPReaderDescription
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDPFPReaderDescriptionProperties = class(TPersistent)
  private
    FServer:    TDPFPReaderDescription;
    function    GetDefaultInterface: IDPFPReaderDescription;
    constructor Create(AServer: TDPFPReaderDescription);
  protected
    function Get_SerialNumber: WideString;
    function Get_SerialNumberType: DPFPReaderSerialNumberTypeEnum;
    function Get_ImpressionType: DPFPReaderImpressionTypeEnum;
    function Get_Technology: DPFPReaderTechnologyEnum;
    function Get_LanguageID: Integer;
    function Get_Vendor: WideString;
    function Get_ProductName: WideString;
    function Get_HardwareRevision: WideString;
    function Get_FirmwareRevision: WideString;
  public
    property DefaultInterface: IDPFPReaderDescription read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoDPFPReadersCollection provides a Create and CreateRemote method to          
// create instances of the default interface IDPFPReadersCollection exposed by              
// the CoClass DPFPReadersCollection. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDPFPReadersCollection = class
    class function Create: IDPFPReadersCollection;
    class function CreateRemote(const MachineName: string): IDPFPReadersCollection;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDPFPReadersCollection
// Help String      : Fingerprint Readers Manager Class
// Default Interface: IDPFPReadersCollection
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDPFPReadersCollectionProperties= class;
{$ENDIF}
  TDPFPReadersCollection = class(TOleServer)
  private
    FIntf:        IDPFPReadersCollection;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDPFPReadersCollectionProperties;
    function      GetServerProperties: TDPFPReadersCollectionProperties;
{$ENDIF}
    function      GetDefaultInterface: IDPFPReadersCollection;
  protected
    procedure InitServerData; override;
    function Get_Count: Integer;
    function Get_Item(lDevice: Integer): IDispatch;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDPFPReadersCollection);
    procedure Disconnect; override;
    function Reader(const ReaderSerialNumber: WideString): IDispatch;
    property DefaultInterface: IDPFPReadersCollection read GetDefaultInterface;
    property Count: Integer read Get_Count;
    property Item[lDevice: Integer]: IDispatch read Get_Item; default;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDPFPReadersCollectionProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDPFPReadersCollection
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDPFPReadersCollectionProperties = class(TPersistent)
  private
    FServer:    TDPFPReadersCollection;
    function    GetDefaultInterface: IDPFPReadersCollection;
    constructor Create(AServer: TDPFPReadersCollection);
  protected
    function Get_Count: Integer;
    function Get_Item(lDevice: Integer): IDispatch;
  public
    property DefaultInterface: IDPFPReadersCollection read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoDPFPCapture provides a Create and CreateRemote method to          
// create instances of the default interface IDPFPCapture exposed by              
// the CoClass DPFPCapture. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDPFPCapture = class
    class function Create: IDPFPCapture;
    class function CreateRemote(const MachineName: string): IDPFPCapture;
  end;

  TDPFPCaptureOnComplete = procedure(ASender: TObject; const ReaderSerNum: WideString; 
                                                       const pSample: IDispatch) of object;
  TDPFPCaptureOnReaderDisconnect = procedure(ASender: TObject; const ReaderSerNum: WideString) of object;
  TDPFPCaptureOnReaderConnect = procedure(ASender: TObject; const ReaderSerNum: WideString) of object;
  TDPFPCaptureOnFingerTouch = procedure(ASender: TObject; const ReaderSerNum: WideString) of object;
  TDPFPCaptureOnFingerGone = procedure(ASender: TObject; const ReaderSerNum: WideString) of object;
  TDPFPCaptureOnSampleQuality = procedure(ASender: TObject; const ReaderSerNum: WideString; 
                                                            CaptureFeedback: DPFPCaptureFeedbackEnum) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDPFPCapture
// Help String      : Fingerprint Sample Capture Class
// Default Interface: IDPFPCapture
// Def. Intf. DISP? : No
// Event   Interface: _IDPFPCaptureEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDPFPCaptureProperties= class;
{$ENDIF}
  TDPFPCapture = class(TOleServer)
  private
    FOnComplete: TDPFPCaptureOnComplete;
    FOnReaderDisconnect: TDPFPCaptureOnReaderDisconnect;
    FOnReaderConnect: TDPFPCaptureOnReaderConnect;
    FOnFingerTouch: TDPFPCaptureOnFingerTouch;
    FOnFingerGone: TDPFPCaptureOnFingerGone;
    FOnSampleQuality: TDPFPCaptureOnSampleQuality;
    FIntf:        IDPFPCapture;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDPFPCaptureProperties;
    function      GetServerProperties: TDPFPCaptureProperties;
{$ENDIF}
    function      GetDefaultInterface: IDPFPCapture;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_ReaderSerialNumber: WideString;
    procedure Set_ReaderSerialNumber(const pVal: WideString);
    function Get_Priority: DPFPCapturePriorityEnum;
    procedure Set_Priority(pVal: DPFPCapturePriorityEnum);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDPFPCapture);
    procedure Disconnect; override;
    procedure StartCapture;
    procedure StopCapture;
    property DefaultInterface: IDPFPCapture read GetDefaultInterface;
    property ReaderSerialNumber: WideString read Get_ReaderSerialNumber write Set_ReaderSerialNumber;
    property Priority: DPFPCapturePriorityEnum read Get_Priority write Set_Priority;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDPFPCaptureProperties read GetServerProperties;
{$ENDIF}
    property OnComplete: TDPFPCaptureOnComplete read FOnComplete write FOnComplete;
    property OnReaderDisconnect: TDPFPCaptureOnReaderDisconnect read FOnReaderDisconnect write FOnReaderDisconnect;
    property OnReaderConnect: TDPFPCaptureOnReaderConnect read FOnReaderConnect write FOnReaderConnect;
    property OnFingerTouch: TDPFPCaptureOnFingerTouch read FOnFingerTouch write FOnFingerTouch;
    property OnFingerGone: TDPFPCaptureOnFingerGone read FOnFingerGone write FOnFingerGone;
    property OnSampleQuality: TDPFPCaptureOnSampleQuality read FOnSampleQuality write FOnSampleQuality;
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDPFPCapture
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDPFPCaptureProperties = class(TPersistent)
  private
    FServer:    TDPFPCapture;
    function    GetDefaultInterface: IDPFPCapture;
    constructor Create(AServer: TDPFPCapture);
  protected
    function Get_ReaderSerialNumber: WideString;
    procedure Set_ReaderSerialNumber(const pVal: WideString);
    function Get_Priority: DPFPCapturePriorityEnum;
    procedure Set_Priority(pVal: DPFPCapturePriorityEnum);
  public
    property DefaultInterface: IDPFPCapture read GetDefaultInterface;
  published
    property ReaderSerialNumber: WideString read Get_ReaderSerialNumber write Set_ReaderSerialNumber;
    property Priority: DPFPCapturePriorityEnum read Get_Priority write Set_Priority;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoDPFPSampleConversion provides a Create and CreateRemote method to          
// create instances of the default interface IDPFPSampleConversion exposed by              
// the CoClass DPFPSampleConversion. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDPFPSampleConversion = class
    class function Create: IDPFPSampleConversion;
    class function CreateRemote(const MachineName: string): IDPFPSampleConversion;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDPFPSampleConversion
// Help String      : Sample Converter Class
// Default Interface: IDPFPSampleConversion
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDPFPSampleConversionProperties= class;
{$ENDIF}
  TDPFPSampleConversion = class(TOleServer)
  private
    FIntf:        IDPFPSampleConversion;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDPFPSampleConversionProperties;
    function      GetServerProperties: TDPFPSampleConversionProperties;
{$ENDIF}
    function      GetDefaultInterface: IDPFPSampleConversion;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDPFPSampleConversion);
    procedure Disconnect; override;
    function ConvertToPicture(const pSample: IDispatch): IDispatch;
    function ConvertToANSI381(const pSample: IDispatch): OleVariant;
    property DefaultInterface: IDPFPSampleConversion read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDPFPSampleConversionProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDPFPSampleConversion
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDPFPSampleConversionProperties = class(TPersistent)
  private
    FServer:    TDPFPSampleConversion;
    function    GetDefaultInterface: IDPFPSampleConversion;
    constructor Create(AServer: TDPFPSampleConversion);
  protected
  public
    property DefaultInterface: IDPFPSampleConversion read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoDPFPReaderDescription.Create: IDPFPReaderDescription;
begin
  Result := CreateComObject(CLASS_DPFPReaderDescription) as IDPFPReaderDescription;
end;

class function CoDPFPReaderDescription.CreateRemote(const MachineName: string): IDPFPReaderDescription;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DPFPReaderDescription) as IDPFPReaderDescription;
end;

procedure TDPFPReaderDescription.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0A611435-B092-45C7-B928-137255359B7A}';
    IntfIID:   '{A582741B-8913-4E8C-8621-6D907EC8363D}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDPFPReaderDescription.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDPFPReaderDescription;
  end;
end;

procedure TDPFPReaderDescription.ConnectTo(svrIntf: IDPFPReaderDescription);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDPFPReaderDescription.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDPFPReaderDescription.GetDefaultInterface: IDPFPReaderDescription;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDPFPReaderDescription.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDPFPReaderDescriptionProperties.Create(Self);
{$ENDIF}
end;

destructor TDPFPReaderDescription.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDPFPReaderDescription.GetServerProperties: TDPFPReaderDescriptionProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TDPFPReaderDescription.Get_SerialNumber: WideString;
begin
    Result := DefaultInterface.SerialNumber;
end;

function TDPFPReaderDescription.Get_SerialNumberType: DPFPReaderSerialNumberTypeEnum;
begin
    Result := DefaultInterface.SerialNumberType;
end;

function TDPFPReaderDescription.Get_ImpressionType: DPFPReaderImpressionTypeEnum;
begin
    Result := DefaultInterface.ImpressionType;
end;

function TDPFPReaderDescription.Get_Technology: DPFPReaderTechnologyEnum;
begin
    Result := DefaultInterface.Technology;
end;

function TDPFPReaderDescription.Get_LanguageID: Integer;
begin
    Result := DefaultInterface.LanguageID;
end;

function TDPFPReaderDescription.Get_Vendor: WideString;
begin
    Result := DefaultInterface.Vendor;
end;

function TDPFPReaderDescription.Get_ProductName: WideString;
begin
    Result := DefaultInterface.ProductName;
end;

function TDPFPReaderDescription.Get_HardwareRevision: WideString;
begin
    Result := DefaultInterface.HardwareRevision;
end;

function TDPFPReaderDescription.Get_FirmwareRevision: WideString;
begin
    Result := DefaultInterface.FirmwareRevision;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDPFPReaderDescriptionProperties.Create(AServer: TDPFPReaderDescription);
begin
  inherited Create;
  FServer := AServer;
end;

function TDPFPReaderDescriptionProperties.GetDefaultInterface: IDPFPReaderDescription;
begin
  Result := FServer.DefaultInterface;
end;

function TDPFPReaderDescriptionProperties.Get_SerialNumber: WideString;
begin
    Result := DefaultInterface.SerialNumber;
end;

function TDPFPReaderDescriptionProperties.Get_SerialNumberType: DPFPReaderSerialNumberTypeEnum;
begin
    Result := DefaultInterface.SerialNumberType;
end;

function TDPFPReaderDescriptionProperties.Get_ImpressionType: DPFPReaderImpressionTypeEnum;
begin
    Result := DefaultInterface.ImpressionType;
end;

function TDPFPReaderDescriptionProperties.Get_Technology: DPFPReaderTechnologyEnum;
begin
    Result := DefaultInterface.Technology;
end;

function TDPFPReaderDescriptionProperties.Get_LanguageID: Integer;
begin
    Result := DefaultInterface.LanguageID;
end;

function TDPFPReaderDescriptionProperties.Get_Vendor: WideString;
begin
    Result := DefaultInterface.Vendor;
end;

function TDPFPReaderDescriptionProperties.Get_ProductName: WideString;
begin
    Result := DefaultInterface.ProductName;
end;

function TDPFPReaderDescriptionProperties.Get_HardwareRevision: WideString;
begin
    Result := DefaultInterface.HardwareRevision;
end;

function TDPFPReaderDescriptionProperties.Get_FirmwareRevision: WideString;
begin
    Result := DefaultInterface.FirmwareRevision;
end;

{$ENDIF}

class function CoDPFPReadersCollection.Create: IDPFPReadersCollection;
begin
  Result := CreateComObject(CLASS_DPFPReadersCollection) as IDPFPReadersCollection;
end;

class function CoDPFPReadersCollection.CreateRemote(const MachineName: string): IDPFPReadersCollection;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DPFPReadersCollection) as IDPFPReadersCollection;
end;

procedure TDPFPReadersCollection.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{2BF17AC6-58B6-4AF2-82A3-1DD4C4F99CE2}';
    IntfIID:   '{176F9311-1132-433C-88D4-2060C7A25946}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDPFPReadersCollection.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDPFPReadersCollection;
  end;
end;

procedure TDPFPReadersCollection.ConnectTo(svrIntf: IDPFPReadersCollection);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDPFPReadersCollection.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDPFPReadersCollection.GetDefaultInterface: IDPFPReadersCollection;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDPFPReadersCollection.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDPFPReadersCollectionProperties.Create(Self);
{$ENDIF}
end;

destructor TDPFPReadersCollection.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDPFPReadersCollection.GetServerProperties: TDPFPReadersCollectionProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TDPFPReadersCollection.Get_Count: Integer;
begin
    Result := DefaultInterface.Count;
end;

function TDPFPReadersCollection.Get_Item(lDevice: Integer): IDispatch;
begin
    Result := DefaultInterface.Item[lDevice];
end;

function TDPFPReadersCollection.Reader(const ReaderSerialNumber: WideString): IDispatch;
begin
  Result := DefaultInterface.Reader(ReaderSerialNumber);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDPFPReadersCollectionProperties.Create(AServer: TDPFPReadersCollection);
begin
  inherited Create;
  FServer := AServer;
end;

function TDPFPReadersCollectionProperties.GetDefaultInterface: IDPFPReadersCollection;
begin
  Result := FServer.DefaultInterface;
end;

function TDPFPReadersCollectionProperties.Get_Count: Integer;
begin
    Result := DefaultInterface.Count;
end;

function TDPFPReadersCollectionProperties.Get_Item(lDevice: Integer): IDispatch;
begin
    Result := DefaultInterface.Item[lDevice];
end;

{$ENDIF}

class function CoDPFPCapture.Create: IDPFPCapture;
begin
  Result := CreateComObject(CLASS_DPFPCapture) as IDPFPCapture;
end;

class function CoDPFPCapture.CreateRemote(const MachineName: string): IDPFPCapture;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DPFPCapture) as IDPFPCapture;
end;

procedure TDPFPCapture.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{3FA859DA-300C-4247-BD33-6011198399C0}';
    IntfIID:   '{4984B820-7BA4-41D2-901B-3E98B91BEFD6}';
    EventIID:  '{C1673A85-2C18-49CA-9644-F08E71D94EDB}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDPFPCapture.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as IDPFPCapture;
  end;
end;

procedure TDPFPCapture.ConnectTo(svrIntf: IDPFPCapture);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TDPFPCapture.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TDPFPCapture.GetDefaultInterface: IDPFPCapture;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDPFPCapture.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDPFPCaptureProperties.Create(Self);
{$ENDIF}
end;

destructor TDPFPCapture.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDPFPCapture.GetServerProperties: TDPFPCaptureProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TDPFPCapture.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    1: if Assigned(FOnComplete) then
         FOnComplete(Self,
                     Params[0] {const WideString},
                     Params[1] {const IDispatch});
    2: if Assigned(FOnReaderDisconnect) then
         FOnReaderDisconnect(Self, Params[0] {const WideString});
    3: if Assigned(FOnReaderConnect) then
         FOnReaderConnect(Self, Params[0] {const WideString});
    4: if Assigned(FOnFingerTouch) then
         FOnFingerTouch(Self, Params[0] {const WideString});
    5: if Assigned(FOnFingerGone) then
         FOnFingerGone(Self, Params[0] {const WideString});
    6: if Assigned(FOnSampleQuality) then
         FOnSampleQuality(Self,
                          Params[0] {const WideString},
                          Params[1] {DPFPCaptureFeedbackEnum});
  end; {case DispID}
end;

function TDPFPCapture.Get_ReaderSerialNumber: WideString;
begin
    Result := DefaultInterface.ReaderSerialNumber;
end;

procedure TDPFPCapture.Set_ReaderSerialNumber(const pVal: WideString);
  { Warning: The property ReaderSerialNumber has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ReaderSerialNumber := pVal;
end;

function TDPFPCapture.Get_Priority: DPFPCapturePriorityEnum;
begin
    Result := DefaultInterface.Priority;
end;

procedure TDPFPCapture.Set_Priority(pVal: DPFPCapturePriorityEnum);
begin
  DefaultInterface.Set_Priority(pVal);
end;

procedure TDPFPCapture.StartCapture;
begin
  DefaultInterface.StartCapture;
end;

procedure TDPFPCapture.StopCapture;
begin
  DefaultInterface.StopCapture;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDPFPCaptureProperties.Create(AServer: TDPFPCapture);
begin
  inherited Create;
  FServer := AServer;
end;

function TDPFPCaptureProperties.GetDefaultInterface: IDPFPCapture;
begin
  Result := FServer.DefaultInterface;
end;

function TDPFPCaptureProperties.Get_ReaderSerialNumber: WideString;
begin
    Result := DefaultInterface.ReaderSerialNumber;
end;

procedure TDPFPCaptureProperties.Set_ReaderSerialNumber(const pVal: WideString);
  { Warning: The property ReaderSerialNumber has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ReaderSerialNumber := pVal;
end;

function TDPFPCaptureProperties.Get_Priority: DPFPCapturePriorityEnum;
begin
    Result := DefaultInterface.Priority;
end;

procedure TDPFPCaptureProperties.Set_Priority(pVal: DPFPCapturePriorityEnum);
begin
  DefaultInterface.Set_Priority(pVal);
end;

{$ENDIF}

class function CoDPFPSampleConversion.Create: IDPFPSampleConversion;
begin
  Result := CreateComObject(CLASS_DPFPSampleConversion) as IDPFPSampleConversion;
end;

class function CoDPFPSampleConversion.CreateRemote(const MachineName: string): IDPFPSampleConversion;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DPFPSampleConversion) as IDPFPSampleConversion;
end;

procedure TDPFPSampleConversion.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{F6CEDB0E-A5F3-4C9C-BDB0-58B2BC9A4BF3}';
    IntfIID:   '{34CE265E-92E3-4884-922B-D4C7E9AD43BA}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDPFPSampleConversion.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDPFPSampleConversion;
  end;
end;

procedure TDPFPSampleConversion.ConnectTo(svrIntf: IDPFPSampleConversion);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDPFPSampleConversion.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDPFPSampleConversion.GetDefaultInterface: IDPFPSampleConversion;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDPFPSampleConversion.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDPFPSampleConversionProperties.Create(Self);
{$ENDIF}
end;

destructor TDPFPSampleConversion.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDPFPSampleConversion.GetServerProperties: TDPFPSampleConversionProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TDPFPSampleConversion.ConvertToPicture(const pSample: IDispatch): IDispatch;
begin
  Result := DefaultInterface.ConvertToPicture(pSample);
end;

function TDPFPSampleConversion.ConvertToANSI381(const pSample: IDispatch): OleVariant;
begin
  Result := DefaultInterface.ConvertToANSI381(pSample);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDPFPSampleConversionProperties.Create(AServer: TDPFPSampleConversion);
begin
  inherited Create;
  FServer := AServer;
end;

function TDPFPSampleConversionProperties.GetDefaultInterface: IDPFPSampleConversion;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TDPFPReaderDescription, TDPFPReadersCollection, TDPFPCapture, TDPFPSampleConversion]);
end;

end.
