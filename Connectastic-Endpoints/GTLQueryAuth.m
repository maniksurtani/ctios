/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2015 Google Inc.
 */

//
//  GTLQueryAuth.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   auth/v1
// Description:
//   Logs users in and out, and retrieves a user's details.
// Classes:
//   GTLQueryAuth (5 custom class methods, 1 custom properties)

#import "GTLQueryAuth.h"

#import "GTLAuthConnectasticAuthReq.h"
#import "GTLAuthConnectasticAuthRsp.h"
#import "GTLAuthConnectasticRecordInvitationsReq.h"
#import "GTLAuthConnectasticRegisterReq.h"
#import "GTLAuthConnectasticWaitlistReq.h"

@implementation GTLQueryAuth

@dynamic fields;

#pragma mark - Service level methods
// These create a GTLQueryAuth object.

+ (instancetype)queryForLoginWithObject:(GTLAuthConnectasticAuthReq *)object {
  if (object == nil) {
    GTL_DEBUG_ASSERT(object != nil, @"%@ got a nil object", NSStringFromSelector(_cmd));
    return nil;
  }
  NSString *methodName = @"auth.login";
  GTLQueryAuth *query = [self queryWithMethodName:methodName];
  query.bodyObject = object;
  query.expectedObjectClass = [GTLAuthConnectasticAuthRsp class];
  return query;
}

+ (instancetype)queryForLogoutWithObject:(GTLAuthConnectasticAuthReq *)object {
  if (object == nil) {
    GTL_DEBUG_ASSERT(object != nil, @"%@ got a nil object", NSStringFromSelector(_cmd));
    return nil;
  }
  NSString *methodName = @"auth.logout";
  GTLQueryAuth *query = [self queryWithMethodName:methodName];
  query.bodyObject = object;
  return query;
}

+ (instancetype)queryForRecordInvitationWithObject:(GTLAuthConnectasticRecordInvitationsReq *)object {
  if (object == nil) {
    GTL_DEBUG_ASSERT(object != nil, @"%@ got a nil object", NSStringFromSelector(_cmd));
    return nil;
  }
  NSString *methodName = @"auth.record_invitation";
  GTLQueryAuth *query = [self queryWithMethodName:methodName];
  query.bodyObject = object;
  return query;
}

+ (instancetype)queryForRegisterWithObject:(GTLAuthConnectasticRegisterReq *)object {
  if (object == nil) {
    GTL_DEBUG_ASSERT(object != nil, @"%@ got a nil object", NSStringFromSelector(_cmd));
    return nil;
  }
  NSString *methodName = @"auth.register";
  GTLQueryAuth *query = [self queryWithMethodName:methodName];
  query.bodyObject = object;
  query.expectedObjectClass = [GTLAuthConnectasticAuthRsp class];
  return query;
}

+ (instancetype)queryForWaitlistWithObject:(GTLAuthConnectasticWaitlistReq *)object {
  if (object == nil) {
    GTL_DEBUG_ASSERT(object != nil, @"%@ got a nil object", NSStringFromSelector(_cmd));
    return nil;
  }
  NSString *methodName = @"auth.waitlist";
  GTLQueryAuth *query = [self queryWithMethodName:methodName];
  query.bodyObject = object;
  return query;
}

@end
