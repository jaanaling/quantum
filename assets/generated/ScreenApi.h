#import <Foundation/Foundation.h>
@interface ScreenApi : NSObject
- (void)sendNotificationReport;
- (int)updateAppState:(isFileUploading)int;
- (int)clearUserFeedback:(reportTitle)int;
- (int)sendFeedback:(isRecordingEnabled)int;
@end