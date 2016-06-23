//
//  FISPlaylist.h
//  JukeboxViews
//
//  Created by Michael Amundsen on 6/23/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISSong.h"

@interface FISPlaylist : NSObject
@property (strong, nonatomic) NSMutableArray *songs;
@property (strong, nonatomic) NSString *text;

- (void)sortSongsByTitle;
- (void)sortSongsByArtist;
- (void)sortSongsByAlbum;
- (FISSong *)songForTrackNumber:(NSUInteger)trackNumber;

@end
