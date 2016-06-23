//
//  FISPlaylist.m
//  JukeboxViews
//
//  Created by Michael Amundsen on 6/23/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISPlaylist.h"

@implementation FISPlaylist

- (instancetype)init {
    self = [super init];
    if (self) {
        _songs = [self generateSongObjects];
        _text = [self formatSongText:self.songs];
    }
    return self;
}

- (void)sortSongsByTitle {
    NSSortDescriptor *titleSorter = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    NSSortDescriptor *artistSorter = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
    NSArray *titleSorted = [NSArray arrayWithObjects:titleSorter, artistSorter, nil];
    [self.songs sortUsingDescriptors:titleSorted];
    self.text = [self formatSongText:self.songs];
}

- (void)sortSongsByArtist {
    NSSortDescriptor *artistSorter = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
    NSSortDescriptor *albumSorter = [NSSortDescriptor sortDescriptorWithKey:@"album" ascending:YES];
    NSArray *artistSorted = [NSArray arrayWithObjects:artistSorter, albumSorter,  nil];
    [self.songs sortUsingDescriptors:artistSorted];
    self.text = [self formatSongText:self.songs];
}

- (void)sortSongsByAlbum {
    NSSortDescriptor *albumSorter = [NSSortDescriptor sortDescriptorWithKey:@"album" ascending:YES];
    NSSortDescriptor *titleSorter = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    NSArray *albumSorted = [NSArray arrayWithObjects:albumSorter, titleSorter,  nil];
    [self.songs sortUsingDescriptors:albumSorted];
    self.text = [self formatSongText:self.songs];
    
}

- (FISSong *)songForTrackNumber:(NSUInteger)trackNumber {
    if (trackNumber > [self.songs count] || trackNumber == 0) {
        return nil;
    }
    trackNumber = trackNumber - 1;
    return self.songs[trackNumber];
}

- (NSString *)formatSongText:(NSArray *)songs {
    NSUInteger songNumber = 1;
    NSMutableString  *playlist = [@"" mutableCopy];
    for (FISSong *song in songs) {
        NSString *songTextFormatted = [NSString stringWithFormat:@"%lu. (Title) %@ (Artist) %@ (Album) %@\n", songNumber, song.title, song.artist, song.album];
        [playlist appendString:songTextFormatted];
        songNumber++;
    }
    return playlist;
}

- (NSMutableArray *)generateSongObjects
{
    NSMutableArray *songs = [[NSMutableArray alloc] init];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Hold on Be Strong"
                                             artist:@"Matoma vs Big Poppa"
                                              album:@"The Internet 1"
                                           fileName:@"hold_on_be_strong"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Higher Love"
                                             artist:@"Matoma ft. James Vincent McMorrow"
                                              album:@"The Internet 2"
                                           fileName:@"higher_love"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Mo Money Mo Problems"
                                             artist:@"Matoma ft. The Notorious B.I.G."
                                              album:@"The Internet 3"
                                           fileName:@"mo_money_mo_problems"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Old Thing Back"
                                             artist:@"The Notorious B.I.G."
                                              album:@"The Internet 4"
                                           fileName:@"old_thing_back"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Gangsta Bleeding Love"
                                             artist:@"Matoma"
                                              album:@"The Internet 5"
                                           fileName:@"gangsta_bleeding_love"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Bailando"
                                             artist:@"Enrique Iglesias ft. Sean Paul"
                                              album:@"The Internet 6"
                                           fileName:@"bailando"] ];
    return songs;
}

@end
