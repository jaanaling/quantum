#import <Foundation/Foundation.h>
@interface ItemStopwatch : NSObject
- (void)showSnackBar;
- (void)resetProgressStatus;
- (void)closeApp:(mediaStatus)int int:(surveyCompletionStatus)int;
- (void)updateInteractionDetails;
- (void)checkFCMMessageStatus:(itemCategory)int int:(entitySearchHistory)int;
@end