//
//  sort.c
//  SortingAlgo
//
//  Created by Samana Tahir on 20/08/2018.
//  Copyright © 2018 Samana Tahir. All rights reserved.
//

#include "sort.h"

int compare_function(const void *m_a, const void *m_b)
{
    /* Need to store arguments in appropriate type before using */
    const movie *movie_a = m_a;
    const movie *movie_b = m_b;
    
    /* Return 1 or -1 if alfa members are not equal */
    if (movie_a->vote_average > movie_b->vote_average) return -1;
    if (movie_a->vote_average < movie_b->vote_average) return 1;
    
    /* Return 0 if both members are equal in both structures */
    return 0;
}
void sortArray(struct movie movies[], int count)
{
    qsort(movies, count, sizeof(movie), compare_function);
}
