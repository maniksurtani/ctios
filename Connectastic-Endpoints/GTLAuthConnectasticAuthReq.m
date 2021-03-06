/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2015 Google Inc.
 */

//
//  GTLAuthConnectasticAuthReq.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   auth/v1
// Description:
//   Logs users in and out, and retrieves a user's details.
// Classes:
//   GTLAuthConnectasticAuthReq (0 custom class methods, 2 custom properties)

#import "GTLAuthConnectasticAuthReq.h"

// ----------------------------------------------------------------------------
//
//   GTLAuthConnectasticAuthReq
//

@implementation GTLAuthConnectasticAuthReq
@dynamic fbId, token;

+ (NSDictionary *)propertyToJSONKeyMap {
  NSDictionary *map = @{
    @"fbId" : @"fb_id"
  };
  return map;
}

@end
