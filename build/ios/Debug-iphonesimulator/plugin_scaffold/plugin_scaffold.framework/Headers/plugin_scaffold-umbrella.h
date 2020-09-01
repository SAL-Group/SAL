#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "PluginScaffoldHelper.h"
#import "PluginScaffoldPlugin.h"

FOUNDATION_EXPORT double plugin_scaffoldVersionNumber;
FOUNDATION_EXPORT const unsigned char plugin_scaffoldVersionString[];

