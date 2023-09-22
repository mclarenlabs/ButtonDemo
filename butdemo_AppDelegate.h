/*
 * Display two buttons in a window.
 *
 */

#import <AppKit/AppKit.h>

@interface AppDelegate : NSObject<NSApplicationDelegate>

@property (nonatomic, retain, strong) NSMenu *menuBar;
@property (nonatomic, retain, strong) NSWindow *mainWindow;
@property (nonatomic, retain, strong) NSButton *but1;
@property (nonatomic, retain, strong) NSButton *but2;
@property (nonatomic, retain, strong) NSTextField *text1;

@end
