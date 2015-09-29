/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2015 Google Inc.
 */

//
//  GTLEventsConnectasticVenueRsp.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   events/v1
// Description:
//   Handles events
// Classes:
//   GTLEventsConnectasticVenueRsp (0 custom class methods, 8 custom properties)

#import "GTLEventsConnectasticVenueRsp.h"

// ----------------------------------------------------------------------------
//
//   GTLEventsConnectasticVenueRsp
//

@implementation GTLEventsConnectasticVenueRsp
@dynamic fbId, latitude, longitude, name, reservationUrl, reservationsAvailable,
         type, venueId;

+ (NSDictionary *)propertyToJSONKeyMap {
  NSDictionary *map = @{
    @"fbId" : @"fb_id",
    @"reservationsAvailable" : @"reservations_available",
    @"reservationUrl" : @"reservation_url",
    @"venueId" : @"venue_id"
  };
  return map;
}

@end
