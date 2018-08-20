//
//  sort.h
//  SortingAlgo
//
//  Created by Samana Tahir on 20/08/2018.
//  Copyright © 2018 Samana Tahir. All rights reserved.
//

#ifndef sort_h
#define sort_h
typedef struct movie{
    int adult;
    const char *title;
    const char *overview;
    float popularity;
    const char *poster_path;
    const char *release_date;
    int video;
    float vote_average;
    int vote_count;
    
} movie;

#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void sortArray(struct movie movies[], int count);
#endif /* sort_h */
