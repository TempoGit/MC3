//
//  Music.swift
//  MC3
//
//  Created by Guendalina De Laurentis on 15/02/22.
//


import AVFoundation
var backgroundMusicPlayer: AVAudioPlayer!
var playingMusic: Bool = false

func musicCheck(filename: String){
    if(!playingMusic){
        playBackgroundMusic(filename: filename)
            } else {
        backgroundMusicPlayer.play()
    }
}

func playBackgroundMusic(filename: String) {
  let resourceUrl = Bundle.main.url(forResource:
    filename, withExtension: nil)
  guard let url = resourceUrl else {
    print("Could not find file: \(filename)")
return
}
  do {
    try backgroundMusicPlayer = AVAudioPlayer(contentsOf: url)
      backgroundMusicPlayer.numberOfLoops = -1
      backgroundMusicPlayer.prepareToPlay()
      backgroundMusicPlayer.play()
      playingMusic = true
    } catch {
      print("Could not create audio player!")
  return
  }
    
}


func musicStop(){
    backgroundMusicPlayer.stop()
}
