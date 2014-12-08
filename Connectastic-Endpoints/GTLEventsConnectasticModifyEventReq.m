/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2014 Google Inc.
 */

//
//  GTLEventsConnectasticModifyEventReq.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   events/v1
// Description:
//   Handles events
// Classes:
//   GTLEventsConnectasticModifyEventReq (0 custom class methods, 5 custom properties)

#import "GTLEventsConnectasticModifyEventReq.h"

// ----------------------------------------------------------------------------
//
//   GTLEventsConnectasticModifyEventReq
//

@implementation GTLEventsConnectasticModifyEventReq
@dynamic date, eventId, name, token, type;

+ (NSDictionary *)propertyToJSONKeyMap {
  NSDictionary *map =
    [NSDictionary dictionaryWithObject:@"event_id"
                                forKey:@"eventId"];
  return map;
}

@end
