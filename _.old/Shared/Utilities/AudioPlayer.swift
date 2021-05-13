//
//  AudioPlayer.swift
//  Zafu
//
//  Created by Jeremie Berduck on 08/01/2021.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?
let audioSession = AVAudioSession.sharedInstance()

func playSound (sound: String, type: String) {
  
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            try!audioSession.setCategory(AVAudioSession.Category.playback, options: AVAudioSession.CategoryOptions.mixWithOthers)
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("⚠️ Cound not find any sound file")
        }
    }
}

func stopSound (){
    if ((audioPlayer?.isPlaying) != nil) {
        audioPlayer?.setVolume(0, fadeDuration: 1)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            audioPlayer?.stop()
        }
    }
}
