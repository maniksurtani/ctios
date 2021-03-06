/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2015 Google Inc.
 */

//
//  GTLEventsConnectasticUpdateParticipantsReq.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   events/v1
// Description:
//   Handles events
// Classes:
//   GTLEventsConnectasticUpdateParticipantsReq (0 custom class methods, 3 custom properties)

#import "GTLEventsConnectasticUpdateParticipantsReq.h"

#import "GTLEventsConnectasticParticipantReq.h"

// ----------------------------------------------------------------------------
//
//   GTLEventsConnectasticUpdateParticipantsReq
//

@implementation GTLEventsConnectasticUpdateParticipantsReq
@dynamic eventId, participants, token;

+ (NSDictionary *)propertyToJSONKeyMap {
  NSDictionary *map = @{
    @"eventId" : @"event_id"
  };
  return map;
}

+ (NSDictionary *)arrayPropertyToClassMap {
  NSDictionary *map = @{
    @"participants" : [GTLEventsConnectasticParticipantReq class]
  };
  return map;
}

@end
