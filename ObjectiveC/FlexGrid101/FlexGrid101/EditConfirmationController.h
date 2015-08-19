//
//  EditConfirmationController.h
//  FlexGrid101
//
//  Copyright (c) 2015 GrapeCity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FlexGridKit/FlexGridKit.h>
@interface EditConfirmationController : UIViewController<FlexGridDelegate>

- (void) beginningEdit:(FlexCellRangeEventArgs *)args;
- (void) cellEditEnding:(FlexCellRangeEventArgs *)args;

@end
