//
//  ViewController.h
//  SSHSaver
//
//  Created by Cameron Kilgore on 1/24/17.
//  Copyright © 2017 Cameron Kilgore. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet NSTextField *nameField;
@property (weak) IBOutlet NSTextField *hostField;
@property (weak) IBOutlet NSComboBox *portBox;
@property (weak) IBOutlet NSTextField *userField;
@property (weak) IBOutlet NSSecureTextField *passField;
@property (weak) IBOutlet NSTextField *runField;
@property (weak) IBOutlet NSButton *illuminatiSwitch;
- (IBAction)advancedToggle:(id)sender;
- (IBAction)connectButton:(id)sender;
@property (weak) IBOutlet NSTextField *commandToRun;

@end

