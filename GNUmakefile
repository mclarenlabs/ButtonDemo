#
# GNUmakefile
#
# Copyright (C) 2023 McLaren Labs

include $(GNUSTEP_MAKEFILES)/common.make

APP_NAME = \
  butdemo

COMMON_OBJC_FILES = \


butdemo_OBJC_FILES = \
  $(COMMON_OBJC_FILES) \
  STScriptingSupport.m \
  butdemo_main.m \
  butdemo_AppDelegate.m

butdemo_RESOURCE_FILES = ScriptingInfo.plist Scripts

ADDITIONAL_CPPFLAGS += -I../Libraries/
ADDITIONAL_OBJCFLAGS = -Wall -Wno-import -fblocks -fobjc-arc

ADDITIONAL_LDFLAGS = -ldispatch -lStepTalk

ifeq ($(check),yes)
    ADDITIONAL_OBJCFLAGS += -Werror
endif


-include GNUmakefile.preamble
include $(GNUSTEP_MAKEFILES)/application.make
-include GNUMakefile.postamble
