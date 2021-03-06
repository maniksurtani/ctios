/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2015 Google Inc.
 */

//
//  GTLQueryDeviceregistration.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   deviceregistration/v1
// Description:
//   Registers and un-registers devices
// Classes:
//   GTLQueryDeviceregistration (3 custom class methods, 1 custom properties)

#import "GTLQueryDeviceregistration.h"

#import "GTLDeviceregistrationConnectasticDeviceExistsRsp.h"
#import "GTLDeviceregistrationConnectasticDeviceReq.h"

@implementation GTLQueryDeviceregistration

@dynamic fields;

#pragma mark - Service level methods
// These create a GTLQueryDeviceregistration object.

+ (instancetype)queryForCheckWithObject:(GTLDeviceregistrationConnectasticDeviceReq *)object {
  if (object == nil) {
    GTL_DEBUG_ASSERT(object != nil, @"%@ got a nil object", NSStringFromSelector(_cmd));
    return nil;
  }
  NSString *methodName = @"deviceregistration.check";
  GTLQueryDeviceregistration *query = [self queryWithMethodName:methodName];
  query.bodyObject = object;
  query.expectedObjectClass = [GTLDeviceregistrationConnectasticDeviceExistsRsp class];
  return query;
}

+ (instancetype)queryForRegisterWithObject:(GTLDeviceregistrationConnectasticDeviceReq *)object {
  if (object == nil) {
    GTL_DEBUG_ASSERT(object != nil, @"%@ got a nil object", NSStringFromSelector(_cmd));
    return nil;
  }
  NSString *methodName = @"deviceregistration.register";
  GTLQueryDeviceregistration *query = [self queryWithMethodName:methodName];
  query.bodyObject = object;
  return query;
}

+ (instancetype)queryForUnregisterWithObject:(GTLDeviceregistrationConnectasticDeviceReq *)object {
  if (object == nil) {
    GTL_DEBUG_ASSERT(object != nil, @"%@ got a nil object", NSStringFromSelector(_cmd));
    return nil;
  }
  NSString *methodName = @"deviceregistration.unregister";
  GTLQueryDeviceregistration *query = [self queryWithMethodName:methodName];
  query.bodyObject = object;
  return query;
}

@end
