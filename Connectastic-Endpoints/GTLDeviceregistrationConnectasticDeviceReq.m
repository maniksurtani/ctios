/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2014 Google Inc.
 */

//
//  GTLDeviceregistrationConnectasticDeviceReq.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   deviceregistration/v1
// Description:
//   Registers and un-registers devices
// Classes:
//   GTLDeviceregistrationConnectasticDeviceReq (0 custom class methods, 3 custom properties)

#import "GTLDeviceregistrationConnectasticDeviceReq.h"

// ----------------------------------------------------------------------------
//
//   GTLDeviceregistrationConnectasticDeviceReq
//

@implementation GTLDeviceregistrationConnectasticDeviceReq
@dynamic deviceType, fbId, token;

+ (NSDictionary *)propertyToJSONKeyMap {
  NSDictionary *map =
    [NSDictionary dictionaryWithObjectsAndKeys:
      @"device_type", @"deviceType",
      @"fb_id", @"fbId",
      nil];
  return map;
}

@end
