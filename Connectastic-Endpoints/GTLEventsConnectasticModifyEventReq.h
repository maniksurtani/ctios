/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2014 Google Inc.
 */

//
//  GTLEventsConnectasticModifyEventReq.h
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   events/v1
// Description:
//   Handles events
// Classes:
//   GTLEventsConnectasticModifyEventReq (0 custom class methods, 5 custom properties)

#if GTL_BUILT_AS_FRAMEWORK
  #import "GTL/GTLObject.h"
#else
  #import "GTLObject.h"
#endif

// ----------------------------------------------------------------------------
//
//   GTLEventsConnectasticModifyEventReq
//

@interface GTLEventsConnectasticModifyEventReq : GTLObject
@property (retain) NSNumber *date;  // longLongValue
@property (copy) NSString *eventId;
@property (copy) NSString *name;
@property (copy) NSString *token;
@property (copy) NSString *type;
@end