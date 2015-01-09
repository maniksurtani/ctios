/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2014 Google Inc.
 */

//
//  GTLEventsConnectasticUpdateParticipantsReq.h
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   events/v1
// Description:
//   Handles events
// Classes:
//   GTLEventsConnectasticUpdateParticipantsReq (0 custom class methods, 3 custom properties)

#if GTL_BUILT_AS_FRAMEWORK
  #import "GTL/GTLObject.h"
#else
  #import "GTLObject.h"
#endif

@class GTLEventsConnectasticParticipantReq;

// ----------------------------------------------------------------------------
//
//   GTLEventsConnectasticUpdateParticipantsReq
//

@interface GTLEventsConnectasticUpdateParticipantsReq : GTLObject
@property (copy) NSString *eventId;
@property (retain) NSArray *participants;  // of GTLEventsConnectasticParticipantReq
@property (copy) NSString *token;
@end