/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2015 Google Inc.
 */

//
//  GTLDeviceregistrationConnectasticDeviceReq.h
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   deviceregistration/v1
// Description:
//   Registers and un-registers devices
// Classes:
//   GTLDeviceregistrationConnectasticDeviceReq (0 custom class methods, 3 custom properties)

#if GTL_BUILT_AS_FRAMEWORK
  #import "GTL/GTLObject.h"
#else
  #import "GTLObject.h"
#endif

// ----------------------------------------------------------------------------
//
//   GTLDeviceregistrationConnectasticDeviceReq
//

@interface GTLDeviceregistrationConnectasticDeviceReq : GTLObject
@property (nonatomic, retain) NSNumber *deviceType;  // longLongValue
@property (nonatomic, retain) NSNumber *fbId;  // longLongValue
@property (nonatomic, copy) NSString *token;
@end
