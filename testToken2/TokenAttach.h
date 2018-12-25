

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface TokenAttach : NSTextAttachmentCell

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSColor *textColor;

- (void)drawWithFrame:(NSRect)fp8 inView:(nullable NSView *)fp24 ;
- (void)drawInteriorWithFrame:(NSRect)fp8 inView:(nullable NSView *)fp24;
@end

NS_ASSUME_NONNULL_END
