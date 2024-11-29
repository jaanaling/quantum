#import <Foundation/Foundation.h>
@interface LanguageControllerManager : NSObject
- (int)updateDataInDatabase;
- (int)logAppCrash:(reminderFrequency)int;
- (void)clearInteractionDetails;
- (int)setLaunchStatus:(isFileTransferred)int;
- (int)clearErrorEventData:(surveyQuestionAnswerCount)int;
- (void)initializeCrashReporting;
- (int)trackAppMetrics;
- (int)loadPreferences:(doNotDisturbStatus)int int:(appPrivacyPolicyStatus)int;
@end