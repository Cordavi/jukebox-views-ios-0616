//
//  FISJukeboxViewController.m
//  JukeboxViews
//
//  Created by Michael Amundsen on 6/23/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISJukeboxViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface FISJukeboxViewController ()
@property (weak, nonatomic) IBOutlet UITextField *songNumberLabel;
@property (weak, nonatomic) IBOutlet UITextView *playListLabel;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation FISJukeboxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.playlist = [[FISPlaylist alloc] init];
    self.playListLabel.text = self.playlist.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)playTapped:(id)sender {
    FISSong *songSelected = [self.playlist songForTrackNumber:[self.songNumberLabel.text integerValue]];
    [self setUpAVAudioPlayerWithFileName:songSelected.fileName];
    [self.audioPlayer play];
    //NSLog(@"Playing: %@", [self.playlist songForTrackNumber:[self.songNumberLabel.text integerValue]]);
}

- (IBAction)stopTapped:(id)sender {
    [self.audioPlayer stop];
}

- (IBAction)titleTapped:(id)sender {
    [self.playlist sortSongsByTitle];
    self.playListLabel.text = self.playlist.text;
    
}
- (IBAction)artistTapped:(id)sender {
    [self.playlist sortSongsByArtist];
    self.playListLabel.text = self.playlist.text;
}
- (IBAction)albumTapped:(id)sender {
    [self.playlist sortSongsByAlbum];
    self.playListLabel.text = self.playlist.text;
}

- (void)setUpAVAudioPlayerWithFileName:(NSString *)fileName
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:@"mp3"];
    NSError *error = nil;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (!self.audioPlayer)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        [self.audioPlayer prepareToPlay];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
