

#import "ViewController.h"
#import "TokenAttach.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (NSArray *)tokenField:(NSTokenField *)tokenField shouldAddObjects:(NSArray *)tokens atIndex:(NSUInteger)index
{
    NSMutableArray* ret = [NSMutableArray array];
    NSAttributedString *str = ((NSTextView*)self.field.currentEditor).attributedString;
    [str enumerateAttribute:NSAttachmentAttributeName
                     inRange:NSMakeRange(0, 1)
                     options:0
                  usingBlock:^(NSTextAttachment *attachment, NSRange range, BOOL *stop) {
                      if ( attachment )
                      {
                          TokenAttach *cell = [[TokenAttach alloc] initTextCell:str.string];
                          cell.text = str.string;
                          attachment.attachmentCell = cell;
                          cell.textColor = [NSColor redColor];
                          
                      }
                  }];
    [ret addObject:str.string];
    return ret;
}
@end
