

#import "TokenAttach.h"

@implementation TokenAttach

- (void)drawWithFrame:(NSRect)fp8 inView:(id)fp24
{
    NSLog(@"drawWithFrame: inView:");
    [self drawElementWithFrame:fp8 inView:fp24];
}

- (void)drawInteriorWithFrame:(NSRect)fp8 inView:(id)fp24
{
    NSLog(@"drawInteriorWithFrame: inView:");
}
- (void)drawTokenWithFrame:(NSRect)fp8 inView:(id)fp24
{
     NSLog(@"drawTokenWithFrame: inView:");
}
- (void)drawWithFrame:(NSRect)fp8 inView:(id)fp24 characterIndex:(unsigned int)fp28 layoutManager:(id)fp32
{
    NSLog(@"drawWithFrame: inView: characterIndex:");
    [self drawElementWithFrame:fp8 inView:fp24];
}

- (void)drawTitleWithFrame:(NSRect)rect inView:(NSView *)controlView {
    NSLog(@"self.stringValue = %@", self.stringValue );
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.text drawInRect:rect
                  withAttributes:@{NSFontAttributeName:self.font,
                                   NSForegroundColorAttributeName:[NSColor redColor],
                                   NSParagraphStyleAttributeName:style}];
}

//==============

- (void) drawElementWithFrame:(NSRect)fp8 inView:(id)fp24{
    
    [[NSGraphicsContext currentContext] saveGraphicsState];
    
    NSColor *fillColor = [NSColor colorWithDeviceRed:210.0f/255.0f green:230.0f/255.0f blue:251.0f/255.0f alpha:1];
    
    NSBezierPath *path = [self tokenPathForBounds:fp8];
    [path addClip];
    
    if (fillColor) {
        [fillColor setFill];
        [path fill];
    }
    
    [self drawTitleWithFrame:fp8 inView:fp24];
    [[NSGraphicsContext currentContext] restoreGraphicsState];
}
- (NSBezierPath *)tokenPathForBounds:(NSRect)bounds  {
    bounds.size.width = MAX(bounds.size.width - 10, 10 * 2 + bounds.size.height);
    
    CGFloat radius = bounds.size.height / 4.0f; // means 1/4 of height
    CGFloat minY = NSMinY(bounds);
    CGFloat maxY = NSMaxY(bounds);
    
    NSBezierPath *path = [NSBezierPath new];
    [path moveToPoint:NSMakePoint(NSMinX(bounds) + radius, minY)];
    // Left edge
    [path appendBezierPathWithArcWithCenter:NSMakePoint(NSMinX(bounds)+radius, minY+radius)
                                     radius:radius
                                 startAngle:-90.0f
                                   endAngle:0.0f
                                  clockwise:YES];
    [path moveToPoint:NSMakePoint(NSMinX(bounds), minY+radius)];
    [path lineToPoint:NSMakePoint(NSMinX(bounds), maxY - radius)];
    [path appendBezierPathWithArcWithCenter:NSMakePoint(NSMinX(bounds)+radius, maxY-radius)
                                     radius:radius
                                 startAngle:0.0f
                                   endAngle:90.0f
                                  clockwise:YES];
    
    // Top edge
    [path lineToPoint:NSMakePoint(NSMaxX(bounds) - radius, maxY)];
    
    // Right edge
    [path appendBezierPathWithArcWithCenter:NSMakePoint(NSMaxX(bounds) - radius, maxY-radius)
                                     radius:radius
                                 startAngle:90.0f
                                   endAngle:0.0f
                                  clockwise:YES];
    [path lineToPoint:NSMakePoint(NSMaxX(bounds), minY + radius)];
    [path appendBezierPathWithArcWithCenter:NSMakePoint(NSMaxX(bounds)-radius, minY+radius)
                                     radius:radius
                                 startAngle:0.0f
                                   endAngle:-90.0f
                                  clockwise:YES];
    
    // Bottom edge
    [path lineToPoint:NSMakePoint(NSMinX(bounds) + radius, minY)];
    
    [path closePath];
    
    [path setLineWidth:2];
    
    return path;
}
@end
