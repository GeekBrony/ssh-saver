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

@interface ViewController () {
    NSString *connName;
    NSString *connHost;
    int connPort;
    NSString *connUser;
    NSString *connPass;
    NMSSHSession *session;
    NMSSHChannel *channel;
}

@end

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

- (IBAction)connectButton:(id)sender {
    connName = _nameField.stringValue;
    connHost = _hostField.stringValue;
    connPort = _portBox.intValue;
    connUser = _userField.stringValue;
    connPass = _passField.stringValue;
    
    int connection = [self connectWith:connHost port:connPort user:connUser password:connPass];
    
    if(connection) {
        channel = session.channel;
        if(_commandToRun.stringValue.length != 0) {
            NSError *e = nil;
            [channel execute:_commandToRun.stringValue error:&e];
        }
    } else {
        // Try again?
    }
}

- (int)connectWith:(NSString *)host port:(int)port user:(NSString *)user password:(NSString *)password {
    session = [NMSSHSession connectToHost:host port:(port == 0 ? 22 : port) withUsername:user];
    NSLog(@"Connecting.");
    [session connect];
    if(session.isConnected) {
        NSLog(@"Connected.");
        [session authenticateByPassword:password];
        NSLog(@"Authenticating.");
        if(session.authorized) {
            NSLog(@"Authorized.");
            return 0;
        } else {
            // do a thing;
            return 1;
        }
    } else {
        NSLog(@"Not connected.");
        return 1;
    }
    
}

@end
