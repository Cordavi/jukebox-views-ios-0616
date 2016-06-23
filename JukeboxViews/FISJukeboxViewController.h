//
//  FISJukeboxViewController.h
//  JukeboxViews
//
//  Created by Michael Amundsen on 6/23/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISPlaylist.h"

@interface FISJukeboxViewController : UIViewController
@property (strong, nonatomic) FISPlaylist *playlist;

@end
