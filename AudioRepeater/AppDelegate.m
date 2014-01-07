//
//  AppDelegate.m
//  AudioRepeater
//
//  Created by Zhou, Chao on 12/11/13.
//  Copyright (c) 2013 Zhou, Chao. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    NSString * path = @"/Users/i038954/Documents/Study/English/F6_mp3/199826.F6_71G_en_srt_lrc/F6-71G-en.srt-lrc/MP3-lrc/第1季/Friends.S01E02.The.One.With.The.Sonogram.At.The.End.mg.lrc";
    NSError *aError;
    NSString * lrcContent =[NSString stringWithContentsOfFile:path encoding:NSUTF16LittleEndianStringEncoding error:&aError];
    NSLog(@"%@",aError);
    NSScanner *lrcScanner = [NSScanner scannerWithString:lrcContent];
    while (![lrcScanner isAtEnd]) {
        @autoreleasepool {
            NSString * starTime;
            NSString * content;
            (void)[lrcScanner scanString:@"[" intoString:NULL];
            (void)[lrcScanner scanUpToString:@"]" intoString:&starTime];
            NSArray *timeArray = [starTime componentsSeparatedByString:@":"];
            NSTimeInterval timePosition= [timeArray[0] integerValue]*60+[timeArray[1] floatValue];
            NSLog(@"%@",timeArray);
            NSLog(@"%@",timePosition);
            (void)[lrcScanner scanString:@"]" intoString:NULL];
            (void)[lrcScanner scanUpToCharactersFromSet:[NSCharacterSet newlineCharacterSet]  intoString:&content];
            content = [content stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            NSDictionary *lrcDic = [NSDictionary dictionaryWithObjectsAndKeys:starTime,@"startTime",content,@"content", nil];
            NSLog(@"%@",lrcDic);
        }
    }
}

@end
