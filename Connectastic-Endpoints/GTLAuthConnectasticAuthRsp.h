/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2014 Google Inc.
 */

//
//  GTLAuthConnectasticAuthRsp.h
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   auth/v1
// Description:
//   Logs users in and out, and retrieves a user's details.
// Classes:
//   GTLAuthConnectasticAuthRsp (0 custom class methods, 6 custom properties)

#if GTL_BUILT_AS_FRAMEWORK
  #import "GTL/GTLObject.h"
#else
  #import "GTLObject.h"
#endif

// ----------------------------------------------------------------------------
//
//   GTLAuthConnectasticAuthRsp
//

@interface GTLAuthConnectasticAuthRsp : GTLObject
@property (copy) NSString *email;
@property (retain) NSNumber *error;  // longLongValue
@property (retain) NSNumber *hasInvites;  // boolValue
@property (retain) NSNumber *invites;  // longLongValue
@property (retain) NSNumber *loggedIn;  // boolValue
@property (copy) NSString *name;
@end
