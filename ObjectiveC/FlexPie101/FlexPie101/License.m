//
//  License.m
//  FlexPie101
//
//  Copyright (c) 2015 GrapeCity. All rights reserved.
//

#import "License.h"

NSString *const key = @"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";
