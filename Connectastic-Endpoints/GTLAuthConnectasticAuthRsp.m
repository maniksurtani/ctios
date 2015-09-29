/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2015 Google Inc.
 */

//
//  GTLAuthConnectasticAuthRsp.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   auth/v1
// Description:
//   Logs users in and out, and retrieves a user's details.
// Classes:
//   GTLAuthConnectasticAuthRsp (0 custom class methods, 7 custom properties)

#import "GTLAuthConnectasticAuthRsp.h"

// ----------------------------------------------------------------------------
//
//   GTLAuthConnectasticAuthRsp
//

@implementation GTLAuthConnectasticAuthRsp
@dynamic email, error, hasInvites, invites, loggedIn, name, token;

+ (NSDictionary *)propertyToJSONKeyMap {
  NSDictionary *map = @{
    @"hasInvites" : @"has_invites",
    @"loggedIn" : @"logged_in"
  };
  return map;
}

@end
