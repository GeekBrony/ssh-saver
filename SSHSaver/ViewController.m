//
//  ViewController.m
//  SSHSaver
//
//  Created by Cameron Kilgore on 1/24/17.
//  Copyright © 2017 Cameron Kilgore. All rights reserved.
//

#define kPixelOffset 100

#import "ViewController.h"
#import <NMSSH/NMSSH.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)advancedToggle:(id)sender {
    NSWindow *w = [NSApp mainWindow];
    CGFloat x = w.frame.origin.x; CGFloat y = w.frame.origin.y;
    NSRect frame = [self.view frame];
    NSRect ch;
    int off;
    if(_illuminatiSwitch.state == (NSInteger) 1) {
        frame = NSRectFromCGRect(CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height + kPixelOffset));
        off = -kPixelOffset;
    } else {
        frame = NSRectFromCGRect(CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height - kPixelOffset));
        off = kPixelOffset;
    }
    
    //[self window]
    
    ch = NSRectFromCGRect(CGRectMake(x, y + off, frame.size.width, w.frame.size.height - off));
    //self.view.frame = frame;
    //[w setContentSize:self.view.frame.size];
    [w setFrame:ch display:NO animate:YES];
    [w setContentView:self.view];
    
    
}
@end
