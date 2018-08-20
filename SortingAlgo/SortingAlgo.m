//
//  SortingAlgo.m
//  SortingAlgo
//
//  Created by Samana Tahir on 20/08/2018.
//  Copyright © 2018 Samana Tahir. All rights reserved.
//

#import "SortingAlgo.h"
#import "sort.h"

@implementation SortingAlgo

-(NSMutableArray*)sortMoviesArray:(NSArray*)array;
{
    movie movieArray[array.count];
    
    for (int i = 0; i < array.count; ++i)
    {
        NSDictionary*dataDictWithNulss = array[i];
        NSDictionary*dataDict = [self dictionaryByReplacingNullsWithStrings:dataDictWithNulss];
        
        movieArray[i] = (movie){.title = [dataDict[@"title"] UTF8String] ,.overview = [dataDict[@"overview"] UTF8String] ,.popularity = [dataDict[@"popularity"] floatValue], .poster_path = [dataDict[@"poster_path"] UTF8String], .release_date = [dataDict[@"release_date"] UTF8String], .video = [dataDict[@"video"] intValue], .vote_average = [dataDict[@"vote_average"] floatValue], .vote_count = [dataDict[@"vote_count"] intValue]};
    }
    sortArray(movieArray, (int)array.count);
    
    NSMutableArray*arraysorted = [NSMutableArray array];
    for (int i = 0; i < array.count; ++i)
    {
        movie selectedMovie = movieArray[i];
        NSMutableDictionary*dataDict = [NSMutableDictionary dictionary];
        [dataDict setObject:[NSString stringWithFormat:@"%d",selectedMovie.adult] forKey:@"adult"];
        [dataDict setObject:@"" forKey:@"backdrop_path"];
        [dataDict setObject:[NSString stringWithFormat:@"%s",selectedMovie.title] forKey:@"title"];
        [dataDict setObject:[NSString stringWithFormat:@"%s",selectedMovie.overview] forKey:@"overview"];
        [dataDict setObject:[NSString stringWithFormat:@"%f",selectedMovie.popularity] forKey:@"popularity"];
        [dataDict setObject:[NSString stringWithFormat:@"%s",selectedMovie.poster_path] forKey:@"poster_path"];
        [dataDict setObject:[NSString stringWithFormat:@"%s",selectedMovie.release_date] forKey:@"release_date"];
        [dataDict setObject:[NSString stringWithFormat:@"%d",selectedMovie.video] forKey:@"video"];
        [dataDict setObject:[NSString stringWithFormat:@"%f",selectedMovie.vote_average] forKey:@"vote_average"];
        [dataDict setObject:[NSString stringWithFormat:@"%d",selectedMovie.vote_count] forKey:@"vote_count"];
        [arraysorted addObject:dataDict];
        
    }
    return arraysorted;
    
}


- (NSDictionary *)dictionaryByReplacingNullsWithStrings:(NSDictionary*)dataDict {
    const NSMutableDictionary *replaced = [dataDict mutableCopy];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    
    for(NSString *key in dataDict) {
        const id object = [dataDict objectForKey:key];
        if(object == nul) {
            [replaced setObject:blank
                         forKey:key];
        }
    }
    
    return [replaced copy];
}
@end
