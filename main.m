
#import <AppKit/AppKit.h>
#import "BOFHExcuseService.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        BOFHExcuseService * excuseService = [[BOFHExcuseService alloc] init];
        NSRegisterServicesProvider(excuseService, @"BOFHExcuseServicer");
                
        [[NSRunLoop currentRunLoop] run];
    };
    
    exit(0);
    return 0;
}
