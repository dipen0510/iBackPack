//
//  CachedLI.m
//  FreeHandDraw
//
//  Created by Dipen Sekhsaria on 01/02/13.
//  Copyright (c) 2013 Stardeep. All rights reserved.
//

#import "CachedLI.h"

@implementation CachedLI
{
    UIBezierPath *path;
    UIImage *incrementalImage;
}

-(id) initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder: aDecoder])
    {
        [self setMultipleTouchEnabled:NO];
        [self setBackgroundColor:[UIColor whiteColor]];
        path = [UIBezierPath bezierPath];
        [path setLineWidth:2.0];
    }
    return self;
}

-(void) drawRect:(CGRect)rect {
    [incrementalImage drawInRect:rect];
    [path stroke];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path moveToPoint:p];
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path addLineToPoint:p];
    [self setNeedsDisplay];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path addLineToPoint:p];
    [self drawBitmap];
    [self setNeedsDisplay];
    [path removeAllPoints];
}

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesEnded:touches withEvent:event];
}


-(void) drawBitmap {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0.0);
    [[UIColor blackColor] setStroke];
    if (!incrementalImage) {
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:self.bounds];
        [[UIColor whiteColor] setFill];
        [bezierPath fill];
    }
    [incrementalImage drawAtPoint:CGPointZero];
    [path stroke];
    incrementalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

@end
