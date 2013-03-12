
#import <AppKit/AppKit.h>

#import "BOFHExcuseService.h"

#define BOFH_URL @"http://pages.cs.wisc.edu/~ballard/bofh/bofhserver.pl"

@implementation BOFHExcuseService

- (NSURL *)bofhURL
{
    return [NSURL URLWithString:BOFH_URL];
}

- (NSXMLDocument *)webPageDocument
{
    NSURL * url = [self bofhURL];
    NSXMLDocument * document = [[NSXMLDocument alloc] initWithContentsOfURL:url options:NSXMLDocumentTidyHTML error:NULL];
    assert(document != nil);
    return document;
}

- (NSString *)excuse
{
    NSXMLDocument * document = [self webPageDocument];
    NSXMLElement * root = [document rootElement];
    NSArray * fontNodes = [root nodesForXPath:@"//font[1]" error:nil];
    assert([fontNodes count] > 1);
    NSString * excuse = [fontNodes[1] stringValue];
    return excuse;
}

- (void)clicketyClickety:(NSPasteboard *)pboard
                userData:(NSString *)data
                   error:(NSString **)error
{
    NSString * excuse = [self excuse];
    assert(excuse != nil);

    [pboard declareTypes:@[NSStringPboardType] owner:nil];
    [pboard setString:excuse forType:NSStringPboardType];
}

@end
