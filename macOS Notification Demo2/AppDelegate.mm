//
//  AppDelegate.m
//  macOS Notification Demo2
//
//  Created by Jason Jeon on 8/3/22.
//

#import "AppDelegate.h"

#include <string>

#define NSNOTIFICAION_NAME  @"abcd"
#define NSDISTRIBUTEDNOTIFICATION_NAME @"efgh1"


@interface AppDelegate ()
{
    
}

@property (strong) IBOutlet NSWindow *window;
@end


@implementation AppDelegate

@synthesize m_pButtonPostNotification;
@synthesize m_pButtonPostDistributedNotification;
@synthesize m_pTextFieldResult;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    [m_pButtonPostNotification setTitle:@"Post Notification [NSNotificationCenter]"];
    [m_pButtonPostDistributedNotification setTitle:@"Post Notification [NSDistributedNotificationCenter"];
    [m_pTextFieldResult setStringValue:@"initialized"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveNoti:)
                                                 name:NSNOTIFICAION_NAME
                                               object:nil];
    [[NSDistributedNotificationCenter defaultCenter] addObserver:self
                                                        selector:@selector(didReceiveDistributedNoti:)
                                                            name:NSDISTRIBUTEDNOTIFICATION_NAME
                                                          object:nil];

}


- (void)applicationWillTerminate:(NSNotification *)aNotification
{
    // Insert code here to tear down your application
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSDistributedNotificationCenter defaultCenter] removeObserver:self];
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app
{
    return YES;
}

-(void)didReceiveNoti:(NSNotification *)noti
{
    printf("didReceiveNoti:\n");
    [m_pTextFieldResult setStringValue:@"Notification Received!"];
}

-(void)didReceiveDistributedNoti:(NSNotification *)noti
{
    printf("didReceiveDistributedNoti:\n");
    [m_pTextFieldResult setStringValue:@"Distributed Notification Received!"];
}

- (IBAction)onClickPostNotification:(id)sender
{
    printf("onClickPostNotification:\n");
    NSDictionary<NSString *, NSNumber*> *dictionaryUserInfo = @{};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NSNOTIFICAION_NAME
                                                        object:nil
                                                      userInfo:dictionaryUserInfo];
}
- (IBAction)onClickedDistributedNotification:(id)sender
{
    printf("onClickedDistributedNotification:\n");
//    NSDictionary<NSString *, NSNumber*> *dictionaryUserInfo = @{};
//    [[NSNotificationCenter defaultCenter] postNotificationName:NSDISTRIBUTEDNOTIFICATION_NAME
//                                                        object:nil
//                                                      userInfo: dictionaryUserInfo];
}


@end
