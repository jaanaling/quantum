#import <Foundation/Foundation.h>
@interface CultivatorRouteManager : NSObject
- (void)checkBatteryInfo:(appSettings)int;
- (int)clearAppSettings:(isTaskCompleted)int;
- (void)getUserVisitStats;
- (int)checkConnection:(networkErrorStatus)int int:(currentDeviceTime)int;
@end