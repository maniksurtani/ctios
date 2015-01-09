/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2014 Google Inc.
 */

//
//  GTLServiceAuth.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   auth/v1
// Description:
//   Logs users in and out, and retrieves a user's details.
// Classes:
//   GTLServiceAuth (0 custom class methods, 0 custom properties)

#import "GTLAuth.h"

@implementation GTLServiceAuth

#if DEBUG
// Method compiled in debug builds just to check that all the needed support
// classes are present at link time.
+ (NSArray *)checkClasses {
  NSArray *classes = [NSArray arrayWithObjects:
                      [GTLQueryAuth class],
                      [GTLAuthConnectasticAuthReq class],
                      [GTLAuthConnectasticAuthRsp class],
                      [GTLAuthConnectasticRecordInvitationsReq class],
                      [GTLAuthConnectasticRegisterReq class],
                      nil];
  return classes;
}
#endif  // DEBUG

- (id)init {
  self = [super init];
  if (self) {
    // Version from discovery.
    self.apiVersion = @"v1";

    // From discovery.  Where to send JSON-RPC.
    // Turn off prettyPrint for this service to save bandwidth (especially on
    // mobile). The fetcher logging will pretty print.
    self.rpcURL = [NSURL URLWithString:@"https://smapp-web.appspot.com/_ah/api/rpc?prettyPrint=false"];
  }
  return self;
}

@end