#import "butdemo_AppDelegate.h"
#import "STScriptingSupport.h"

@implementation AppDelegate

- (void) makeMenu {
  
  self.menuBar = [NSMenu new];
  NSMenu *appMenu = [NSMenu new];
  NSMenuItem *appMenuItem = [[NSMenuItem alloc] init];
  appMenuItem.title = @"File";

  NSMenuItem *quitMenuItem = [[NSMenuItem alloc]
			       initWithTitle:@"Quit"
				      action:@selector(terminate:)
			       keyEquivalent:@"q"];

  [self.menuBar addItem:appMenuItem];
  [appMenu addItem:quitMenuItem];
  [appMenuItem setSubmenu:appMenu];

#if 1
  if([NSApp isScriptingSupported])
    {
      id<NSMenuItem> scriptingItem =
	[self.menuBar addItemWithTitle: @"Scripting"
			action: NULL
		 keyEquivalent: @""];
      if ([NSApp respondsToSelector:@selector(scriptingMenu)]) {
	NSMenu *menu = [NSApp scriptingMenu];
	[scriptingItem setSubmenu: menu];
      }
    }
#endif

  [NSApp setMainMenu:self.menuBar];
}

- (void) makeWindow {

  NSRect windowRect = NSMakeRect(0, 100, 500, 300);
  self.mainWindow = [[NSWindow alloc]
		  initWithContentRect:windowRect
			    styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable
			      backing:NSBackingStoreBuffered
				defer:NO];
  self.mainWindow.delegate = self;

  [self.mainWindow makeKeyAndOrderFront:self];
  [self.mainWindow orderFrontRegardless];

}

- (void) makeButton1 {
  NSRect rect = NSMakeRect(100, 100, 120, 60);

  self.but1 = [[NSButton alloc] initWithFrame:rect];
  self.but1.title = @"But1";
  NSFont *font = [NSFont userFixedPitchFontOfSize:40.0];
  self.but1.font = font;

  [self.mainWindow.contentView addSubview:self.but1];
}

- (void) makeButton2 {
  NSRect rect = NSMakeRect(300, 100, 120, 60);

  self.but2 = [[NSButton alloc] initWithFrame:rect];
  self.but2.title = @"But2";
  NSFont *font = [NSFont userFixedPitchFontOfSize:40.0];
  self.but2.font = font;

  [self.mainWindow.contentView addSubview:self.but2];
}

- (void) makeText1 {
  NSRect rect = NSMakeRect(100, 50, 320, 40);

  self.text1 = [[NSTextField alloc] initWithFrame:rect];
  self.text1.stringValue = @"output text";
  [self.text1 setSelectable:NO];
  NSFont *font = [NSFont userFixedPitchFontOfSize:32.0];
  self.text1.font = font;

  [self.mainWindow.contentView addSubview:self.text1];

}

- (void) applicationDidFinishLaunching: (NSNotification *) aNotification
{
  if ([NSApp isScriptingSupported]) {
    // Make sure this is called before calling [NSApp scriptingMenu]
    [NSApp initializeApplicationScripting];

  }

  [self makeMenu];
  [self makeWindow];

  [self makeButton1];  
  [self makeButton2];
  [self makeText1];

  self.but1.nextKeyView = self.but2;
  self.but2.nextKeyView = self.but1;

  // These are provided by ScriptingSupport as a dynamically loaded category
  [NSApp orderFrontScriptsPanel:self];
  [NSApp orderFrontTranscriptWindow:self];

}

@end
