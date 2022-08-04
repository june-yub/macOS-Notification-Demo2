//
//  AppDelegate.h
//  macOS Notification Demo2
//
//  Created by Jason Jeon on 8/3/22.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (weak, getter = buttonPostNotification, setter = setButtonPostNotification:) IBOutlet NSButton *m_pButtonPostNotification;

@property (weak, getter = buttonPostDistributedNotification, setter = setButtonDistributedNotification:) IBOutlet NSButton *m_pButtonPostDistributedNotification;

@property (weak, getter = textFieldResult, setter = setTextFieldResult:) IBOutlet NSTextField *m_pTextFieldResult;




@end

