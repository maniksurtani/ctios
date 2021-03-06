/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2015 Google Inc.
 */

//
//  GTLEventsConnectasticPersonRsp.h
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   events/v1
// Description:
//   Handles events
// Classes:
//   GTLEventsConnectasticPersonRsp (0 custom class methods, 6 custom properties)

#if GTL_BUILT_AS_FRAMEWORK
  #import "GTL/GTLObject.h"
#else
  #import "GTLObject.h"
#endif

// ----------------------------------------------------------------------------
//
//   GTLEventsConnectasticPersonRsp
//

@interface GTLEventsConnectasticPersonRsp : GTLObject
@property (nonatomic, copy) NSString *address;
@property (nonatomic, retain) NSNumber *fbId;  // longLongValue
@property (nonatomic, copy) NSString *latitude;
@property (nonatomic, copy) NSString *longitude;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *transport;
@end
