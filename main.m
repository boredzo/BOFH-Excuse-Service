
#import <AppKit/AppKit.h>
#import "BOFHExcuseService.h"

int main(int argc, char *argv[])
{
    int result = EXIT_SUCCESS;

    @autoreleasepool {
        BOFHExcuseService * excuseService = [[BOFHExcuseService alloc] init];
        NSRegisterServicesProvider(excuseService, @"BOFHExcuseServicer");
                
        result = NSApplicationMain(argc, (const char **)argv);
    };
    
    return result;
}
