#import <Foundation/Foundation.h>
@interface BlocHelper : NSObject
- (void)updateUserStatus;
- (int)resetSettings;
- (void)hideToast:(surveyAnswerStatusError)int;
- (int)sendErrorEventData:(entityHasProfilePicture)int;
- (int)checkNetworkAvailability:(isValidEmail)int;
- (int)sendDeleteRequest;
- (int)getUserActionData:(isErrorOccurred)int;
- (int)refreshView:(selectedItemResolution)int;
- (void)checkPermissionStatus;
- (void)checkDeviceActivity:(trackingData)int;
- (int)getEmailStatus:(entityFeedbackMessage)int;
- (void)getUserPreference:(surveyAnswerReviewMessageTime)int;
- (void)clearUserActivityData:(surveyAnswerReviewProgressMessage)int int:(isFileVerified)int;
- (void)setInstallSource:(isGpsEnabled)int;
- (int)getAppSettings:(taskStartDate)int;
- (int)resetUserSettings;
@end