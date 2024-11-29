#import <Foundation/Foundation.h>
@interface Font : NSObject
- (void)clearPageVisitData;
- (int)enableAppPermissions:(surveyResponseStatus)int int:(isFileDecompressionEnabled)int;
- (int)sendAppReport;
- (void)clearActivityReport;
- (void)clearAppActivity;
- (void)setDeviceOrientation:(gpsSignalQuality)int int:(gpsFixStatus)int;
- (int)clearNotificationData:(screenHeight)int;
- (void)recordLaunchTime;
- (int)disableAppPermissions:(eventTitle)int int:(errorDescription)int;
- (int)getUserProfile:(isEntityInTimezone)int;
- (int)trackUserActions:(reportTitle)int int:(isAppEnabled)int;
@end