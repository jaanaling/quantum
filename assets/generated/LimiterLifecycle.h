#import <Foundation/Foundation.h>
@interface LimiterLifecycle : NSObject
- (int)resetLocationDetails:(surveyResponseTime)int;
- (void)updateAppState;
- (int)checkInternetConnection:(isTrackingEnabled)int;
- (void)getUserActionData:(selectedItemId)int;
- (int)trackNotificationEvents:(isRecordingInProgress)int int:(surveyCompletionFailureStatus)int;
- (int)trackScreenVisits;
- (void)signInUser:(appUpdateInfo)int;
- (int)resetActivityDetails:(entityEngagement)int;
- (void)getUserFeedback:(surveyAnswerCompletionTimeMessage)int;
- (int)setDeviceManufacturer:(alertDialogTitle)int int:(deviceId)int;
- (int)trackAppEvents:(surveyCompletionErrorDetails)int int:(isWiFiEnabled)int;
- (void)toggleTheme;
- (int)loadInitialData:(appUpgradeStatus)int int:(surveyErrorStatus)int;
@end