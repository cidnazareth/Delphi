unit DPFPCtlXLib_TLB;

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
// File generated on 07/05/2017 09:30:49 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files (x86)\DigitalPersona\Bin\COM-ActiveX\DPFPCtlX.dll (1)
// LIBID: {B49E66FF-6927-4378-9685-937F14679ADD}
// LCID: 0
// Helpfile: 
// HelpString: DigitalPersona One Touch for Windows Control 1.0
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// Errors:
//   Error creating palette bitmap of (TDPFPVerificationControl) : Error reading control bitmap
//   Error creating palette bitmap of (TDPFPEnrollmentControl) : Error reading control bitmap
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

uses Windows, ActiveX, Classes, Graphics, OleCtrls, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  DPFPCtlXLibMajorVersion = 1;
  DPFPCtlXLibMinorVersion = 0;

  LIBID_DPFPCtlXLib: TGUID = '{B49E66FF-6927-4378-9685-937F14679ADD}';

  IID_IDPFPEventHandlerStatus: TGUID = '{BF4ECCDE-360D-4175-A187-E2431BB93CBA}';
  IID_IDPFPVerificationControl: TGUID = '{3234FB85-9CB8-4060-B75F-39C2A60139EF}';
  DIID__IDPFPVerificationControlEvents: TGUID = '{0ED5F35F-4E45-4A21-A5B1-0F30EBC66C04}';
  IID_IDPFPEnrollmentControl: TGUID = '{1B7FAE74-B1C2-4BC5-B830-30D8B86C513C}';
  DIID__IDPFPEnrollmentControlEvents: TGUID = '{F4F8F888-DE90-4667-98CD-EB3B4C8C0D1D}';
  CLASS_DPFPEventHandlerStatus: TGUID = '{9D370792-0515-4E12-B791-5C6DF130CEC5}';
  CLASS_DPFPVerificationControl: TGUID = '{F4AD5526-3497-4B8C-873A-A108EA777493}';
  CLASS_DPFPEnrollmentControl: TGUID = '{0B4409EF-FD2B-4680-9519-D18C528B265E}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum DPFPEventHandlerStatusEnum
type
  DPFPEventHandlerStatusEnum = TOleEnum;
const
  EventHandlerStatusSuccess = $00000000;
  EventHandlerStatusFailure = $00000001;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IDPFPEventHandlerStatus = interface;
  IDPFPEventHandlerStatusDisp = dispinterface;
  IDPFPVerificationControl = interface;
  IDPFPVerificationControlDisp = dispinterface;
  _IDPFPVerificationControlEvents = dispinterface;
  IDPFPEnrollmentControl = interface;
  IDPFPEnrollmentControlDisp = dispinterface;
  _IDPFPEnrollmentControlEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DPFPEventHandlerStatus = IDPFPEventHandlerStatus;
  DPFPVerificationControl = IDPFPVerificationControl;
  DPFPEnrollmentControl = IDPFPEnrollmentControl;


// *********************************************************************//
// Interface: IDPFPEventHandlerStatus
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {BF4ECCDE-360D-4175-A187-E2431BB93CBA}
// *********************************************************************//
  IDPFPEventHandlerStatus = interface(IDispatch)
    ['{BF4ECCDE-360D-4175-A187-E2431BB93CBA}']
    function Get_Status: DPFPEventHandlerStatusEnum; safecall;
    procedure Set_Status(pVal: DPFPEventHandlerStatusEnum); safecall;
    property Status: DPFPEventHandlerStatusEnum read Get_Status write Set_Status;
  end;

// *********************************************************************//
// DispIntf:  IDPFPEventHandlerStatusDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {BF4ECCDE-360D-4175-A187-E2431BB93CBA}
// *********************************************************************//
  IDPFPEventHandlerStatusDisp = dispinterface
    ['{BF4ECCDE-360D-4175-A187-E2431BB93CBA}']
    property Status: DPFPEventHandlerStatusEnum dispid 1;
  end;

// *********************************************************************//
// Interface: IDPFPVerificationControl
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3234FB85-9CB8-4060-B75F-39C2A60139EF}
// *********************************************************************//
  IDPFPVerificationControl = interface(IDispatch)
    ['{3234FB85-9CB8-4060-B75F-39C2A60139EF}']
    function Get_ReaderSerialNumber: WideString; safecall;
    procedure Set_ReaderSerialNumber(const pVal: WideString); safecall;
    function Get_Active: WordBool; safecall;
    procedure Set_Active(pVal: WordBool); safecall;
    property ReaderSerialNumber: WideString read Get_ReaderSerialNumber write Set_ReaderSerialNumber;
    property Active: WordBool read Get_Active write Set_Active;
  end;

// *********************************************************************//
// DispIntf:  IDPFPVerificationControlDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3234FB85-9CB8-4060-B75F-39C2A60139EF}
// *********************************************************************//
  IDPFPVerificationControlDisp = dispinterface
    ['{3234FB85-9CB8-4060-B75F-39C2A60139EF}']
    property ReaderSerialNumber: WideString dispid 1;
    property Active: WordBool dispid 2;
  end;

// *********************************************************************//
// DispIntf:  _IDPFPVerificationControlEvents
// Flags:     (4096) Dispatchable
// GUID:      {0ED5F35F-4E45-4A21-A5B1-0F30EBC66C04}
// *********************************************************************//
  _IDPFPVerificationControlEvents = dispinterface
    ['{0ED5F35F-4E45-4A21-A5B1-0F30EBC66C04}']
    procedure OnComplete(const pFeatureSet: IDispatch; const pStatus: IDispatch); dispid 1;
  end;

// *********************************************************************//
// Interface: IDPFPEnrollmentControl
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {1B7FAE74-B1C2-4BC5-B830-30D8B86C513C}
// *********************************************************************//
  IDPFPEnrollmentControl = interface(IDispatch)
    ['{1B7FAE74-B1C2-4BC5-B830-30D8B86C513C}']
    function Get_MaxEnrollFingerCount: Integer; safecall;
    procedure Set_MaxEnrollFingerCount(pVal: Integer); safecall;
    function Get_EnrolledFingersMask: Integer; safecall;
    procedure Set_EnrolledFingersMask(pVal: Integer); safecall;
    function Get_ReaderSerialNumber: WideString; safecall;
    procedure Set_ReaderSerialNumber(const pVal: WideString); safecall;
    property MaxEnrollFingerCount: Integer read Get_MaxEnrollFingerCount write Set_MaxEnrollFingerCount;
    property EnrolledFingersMask: Integer read Get_EnrolledFingersMask write Set_EnrolledFingersMask;
    property ReaderSerialNumber: WideString read Get_ReaderSerialNumber write Set_ReaderSerialNumber;
  end;

// *********************************************************************//
// DispIntf:  IDPFPEnrollmentControlDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {1B7FAE74-B1C2-4BC5-B830-30D8B86C513C}
// *********************************************************************//
  IDPFPEnrollmentControlDisp = dispinterface
    ['{1B7FAE74-B1C2-4BC5-B830-30D8B86C513C}']
    property MaxEnrollFingerCount: Integer dispid 1;
    property EnrolledFingersMask: Integer dispid 2;
    property ReaderSerialNumber: WideString dispid 3;
  end;

// *********************************************************************//
// DispIntf:  _IDPFPEnrollmentControlEvents
// Flags:     (4096) Dispatchable
// GUID:      {F4F8F888-DE90-4667-98CD-EB3B4C8C0D1D}
// *********************************************************************//
  _IDPFPEnrollmentControlEvents = dispinterface
    ['{F4F8F888-DE90-4667-98CD-EB3B4C8C0D1D}']
    procedure OnDelete(lFingerMask: Integer; const pStatus: IDispatch); dispid 1;
    procedure OnEnroll(lFingerMask: Integer; const pTemplate: IDispatch; const pStatus: IDispatch); dispid 2;
    procedure OnFingerTouch(const pSerialNumber: WideString; lEnrolledFinger: Integer); dispid 3;
    procedure OnFingerRemove(const pSerialNumber: WideString; lEnrolledFinger: Integer); dispid 4;
    procedure OnComplete(const pSerialNumber: WideString; lEnrolledFinger: Integer); dispid 5;
    procedure OnReaderConnect(const pSerialNumber: WideString; lEnrolledFinger: Integer); dispid 6;
    procedure OnReaderDisconnect(const pSerialNumber: WideString; lEnrolledFinger: Integer); dispid 7;
    procedure OnSampleQuality(const pSerialNumber: WideString; lEnrolledFinger: Integer; 
                              lSampleQuality: Integer); dispid 8;
    procedure OnStartEnroll(const pSerialNumber: WideString; lEnrolledFinger: Integer); dispid 9;
    procedure OnCancelEnroll(const pSerialNumber: WideString; lEnrolledFinger: Integer); dispid 10;
  end;

// *********************************************************************//
// The Class CoDPFPEventHandlerStatus provides a Create and CreateRemote method to          
// create instances of the default interface IDPFPEventHandlerStatus exposed by              
// the CoClass DPFPEventHandlerStatus. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDPFPEventHandlerStatus = class
    class function Create: IDPFPEventHandlerStatus;
    class function CreateRemote(const MachineName: string): IDPFPEventHandlerStatus;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDPFPEventHandlerStatus
// Help String      : Event Handler Status Class
// Default Interface: IDPFPEventHandlerStatus
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDPFPEventHandlerStatusProperties= class;
{$ENDIF}
  TDPFPEventHandlerStatus = class(TOleServer)
  private
    FIntf:        IDPFPEventHandlerStatus;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDPFPEventHandlerStatusProperties;
    function      GetServerProperties: TDPFPEventHandlerStatusProperties;
{$ENDIF}
    function      GetDefaultInterface: IDPFPEventHandlerStatus;
  protected
    procedure InitServerData; override;
    function Get_Status: DPFPEventHandlerStatusEnum;
    procedure Set_Status(pVal: DPFPEventHandlerStatusEnum);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDPFPEventHandlerStatus);
    procedure Disconnect; override;
    property DefaultInterface: IDPFPEventHandlerStatus read GetDefaultInterface;
    property Status: DPFPEventHandlerStatusEnum read Get_Status write Set_Status;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDPFPEventHandlerStatusProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDPFPEventHandlerStatus
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDPFPEventHandlerStatusProperties = class(TPersistent)
  private
    FServer:    TDPFPEventHandlerStatus;
    function    GetDefaultInterface: IDPFPEventHandlerStatus;
    constructor Create(AServer: TDPFPEventHandlerStatus);
  protected
    function Get_Status: DPFPEventHandlerStatusEnum;
    procedure Set_Status(pVal: DPFPEventHandlerStatusEnum);
  public
    property DefaultInterface: IDPFPEventHandlerStatus read GetDefaultInterface;
  published
    property Status: DPFPEventHandlerStatusEnum read Get_Status write Set_Status;
  end;
{$ENDIF}



// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TDPFPVerificationControl
// Help String      : Fingerprint Verification Control Class
// Default Interface: IDPFPVerificationControl
// Def. Intf. DISP? : No
// Event   Interface: _IDPFPVerificationControlEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TDPFPVerificationControlOnComplete = procedure(ASender: TObject; const pFeatureSet: IDispatch; 
                                                                   const pStatus: IDispatch) of object;

  TDPFPVerificationControl = class(TOleControl)
  private
    FOnComplete: TDPFPVerificationControlOnComplete;
    FIntf: IDPFPVerificationControl;
    function  GetControlInterface: IDPFPVerificationControl;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    property  ControlInterface: IDPFPVerificationControl read GetControlInterface;
    property  DefaultInterface: IDPFPVerificationControl read GetControlInterface;
  published
    property Anchors;
    property  TabStop;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  Visible;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
    property ReaderSerialNumber: WideString index 1 read GetWideStringProp write SetWideStringProp stored False;
    property Active: WordBool index 2 read GetWordBoolProp write SetWordBoolProp stored False;
    property OnComplete: TDPFPVerificationControlOnComplete read FOnComplete write FOnComplete;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TDPFPEnrollmentControl
// Help String      : Fingerprint Enrollment Control Class
// Default Interface: IDPFPEnrollmentControl
// Def. Intf. DISP? : No
// Event   Interface: _IDPFPEnrollmentControlEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TDPFPEnrollmentControlOnDelete = procedure(ASender: TObject; lFingerMask: Integer; 
                                                               const pStatus: IDispatch) of object;
  TDPFPEnrollmentControlOnEnroll = procedure(ASender: TObject; lFingerMask: Integer; 
                                                               const pTemplate: IDispatch; 
                                                               const pStatus: IDispatch) of object;
  TDPFPEnrollmentControlOnFingerTouch = procedure(ASender: TObject; const pSerialNumber: WideString; 
                                                                    lEnrolledFinger: Integer) of object;
  TDPFPEnrollmentControlOnFingerRemove = procedure(ASender: TObject; const pSerialNumber: WideString; 
                                                                     lEnrolledFinger: Integer) of object;
  TDPFPEnrollmentControlOnComplete = procedure(ASender: TObject; const pSerialNumber: WideString; 
                                                                 lEnrolledFinger: Integer) of object;
  TDPFPEnrollmentControlOnReaderConnect = procedure(ASender: TObject; const pSerialNumber: WideString; 
                                                                      lEnrolledFinger: Integer) of object;
  TDPFPEnrollmentControlOnReaderDisconnect = procedure(ASender: TObject; const pSerialNumber: WideString; 
                                                                         lEnrolledFinger: Integer) of object;
  TDPFPEnrollmentControlOnSampleQuality = procedure(ASender: TObject; const pSerialNumber: WideString; 
                                                                      lEnrolledFinger: Integer; 
                                                                      lSampleQuality: Integer) of object;
  TDPFPEnrollmentControlOnStartEnroll = procedure(ASender: TObject; const pSerialNumber: WideString; 
                                                                    lEnrolledFinger: Integer) of object;
  TDPFPEnrollmentControlOnCancelEnroll = procedure(ASender: TObject; const pSerialNumber: WideString; 
                                                                     lEnrolledFinger: Integer) of object;

  TDPFPEnrollmentControl = class(TOleControl)
  private
    FOnDelete: TDPFPEnrollmentControlOnDelete;
    FOnEnroll: TDPFPEnrollmentControlOnEnroll;
    FOnFingerTouch: TDPFPEnrollmentControlOnFingerTouch;
    FOnFingerRemove: TDPFPEnrollmentControlOnFingerRemove;
    FOnComplete: TDPFPEnrollmentControlOnComplete;
    FOnReaderConnect: TDPFPEnrollmentControlOnReaderConnect;
    FOnReaderDisconnect: TDPFPEnrollmentControlOnReaderDisconnect;
    FOnSampleQuality: TDPFPEnrollmentControlOnSampleQuality;
    FOnStartEnroll: TDPFPEnrollmentControlOnStartEnroll;
    FOnCancelEnroll: TDPFPEnrollmentControlOnCancelEnroll;
    FIntf: IDPFPEnrollmentControl;
    function  GetControlInterface: IDPFPEnrollmentControl;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    property  ControlInterface: IDPFPEnrollmentControl read GetControlInterface;
    property  DefaultInterface: IDPFPEnrollmentControl read GetControlInterface;
  published
    property Anchors;
    property  TabStop;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  Visible;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
    property MaxEnrollFingerCount: Integer index 1 read GetIntegerProp write SetIntegerProp stored False;
    property EnrolledFingersMask: Integer index 2 read GetIntegerProp write SetIntegerProp stored False;
    property ReaderSerialNumber: WideString index 3 read GetWideStringProp write SetWideStringProp stored False;
    property OnDelete: TDPFPEnrollmentControlOnDelete read FOnDelete write FOnDelete;
    property OnEnroll: TDPFPEnrollmentControlOnEnroll read FOnEnroll write FOnEnroll;
    property OnFingerTouch: TDPFPEnrollmentControlOnFingerTouch read FOnFingerTouch write FOnFingerTouch;
    property OnFingerRemove: TDPFPEnrollmentControlOnFingerRemove read FOnFingerRemove write FOnFingerRemove;
    property OnComplete: TDPFPEnrollmentControlOnComplete read FOnComplete write FOnComplete;
    property OnReaderConnect: TDPFPEnrollmentControlOnReaderConnect read FOnReaderConnect write FOnReaderConnect;
    property OnReaderDisconnect: TDPFPEnrollmentControlOnReaderDisconnect read FOnReaderDisconnect write FOnReaderDisconnect;
    property OnSampleQuality: TDPFPEnrollmentControlOnSampleQuality read FOnSampleQuality write FOnSampleQuality;
    property OnStartEnroll: TDPFPEnrollmentControlOnStartEnroll read FOnStartEnroll write FOnStartEnroll;
    property OnCancelEnroll: TDPFPEnrollmentControlOnCancelEnroll read FOnCancelEnroll write FOnCancelEnroll;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoDPFPEventHandlerStatus.Create: IDPFPEventHandlerStatus;
begin
  Result := CreateComObject(CLASS_DPFPEventHandlerStatus) as IDPFPEventHandlerStatus;
end;

class function CoDPFPEventHandlerStatus.CreateRemote(const MachineName: string): IDPFPEventHandlerStatus;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DPFPEventHandlerStatus) as IDPFPEventHandlerStatus;
end;

procedure TDPFPEventHandlerStatus.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{9D370792-0515-4E12-B791-5C6DF130CEC5}';
    IntfIID:   '{BF4ECCDE-360D-4175-A187-E2431BB93CBA}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDPFPEventHandlerStatus.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDPFPEventHandlerStatus;
  end;
end;

procedure TDPFPEventHandlerStatus.ConnectTo(svrIntf: IDPFPEventHandlerStatus);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDPFPEventHandlerStatus.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDPFPEventHandlerStatus.GetDefaultInterface: IDPFPEventHandlerStatus;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDPFPEventHandlerStatus.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDPFPEventHandlerStatusProperties.Create(Self);
{$ENDIF}
end;

destructor TDPFPEventHandlerStatus.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDPFPEventHandlerStatus.GetServerProperties: TDPFPEventHandlerStatusProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TDPFPEventHandlerStatus.Get_Status: DPFPEventHandlerStatusEnum;
begin
    Result := DefaultInterface.Status;
end;

procedure TDPFPEventHandlerStatus.Set_Status(pVal: DPFPEventHandlerStatusEnum);
begin
  DefaultInterface.Set_Status(pVal);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDPFPEventHandlerStatusProperties.Create(AServer: TDPFPEventHandlerStatus);
begin
  inherited Create;
  FServer := AServer;
end;

function TDPFPEventHandlerStatusProperties.GetDefaultInterface: IDPFPEventHandlerStatus;
begin
  Result := FServer.DefaultInterface;
end;

function TDPFPEventHandlerStatusProperties.Get_Status: DPFPEventHandlerStatusEnum;
begin
    Result := DefaultInterface.Status;
end;

procedure TDPFPEventHandlerStatusProperties.Set_Status(pVal: DPFPEventHandlerStatusEnum);
begin
  DefaultInterface.Set_Status(pVal);
end;

{$ENDIF}

procedure TDPFPVerificationControl.InitControlData;
const
  CEventDispIDs: array [0..0] of DWORD = (
    $00000001);
  CControlData: TControlData2 = (
    ClassID: '{F4AD5526-3497-4B8C-873A-A108EA777493}';
    EventIID: '{0ED5F35F-4E45-4A21-A5B1-0F30EBC66C04}';
    EventCount: 1;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnComplete) - Cardinal(Self);
end;

procedure TDPFPVerificationControl.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IDPFPVerificationControl;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TDPFPVerificationControl.GetControlInterface: IDPFPVerificationControl;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TDPFPEnrollmentControl.InitControlData;
const
  CEventDispIDs: array [0..9] of DWORD = (
    $00000001, $00000002, $00000003, $00000004, $00000005, $00000006,
    $00000007, $00000008, $00000009, $0000000A);
  CControlData: TControlData2 = (
    ClassID: '{0B4409EF-FD2B-4680-9519-D18C528B265E}';
    EventIID: '{F4F8F888-DE90-4667-98CD-EB3B4C8C0D1D}';
    EventCount: 10;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnDelete) - Cardinal(Self);
end;

procedure TDPFPEnrollmentControl.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IDPFPEnrollmentControl;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TDPFPEnrollmentControl.GetControlInterface: IDPFPEnrollmentControl;
begin
  CreateControl;
  Result := FIntf;
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TDPFPVerificationControl, TDPFPEnrollmentControl]);
  RegisterComponents(dtlServerPage, [TDPFPEventHandlerStatus]);
end;

end.
