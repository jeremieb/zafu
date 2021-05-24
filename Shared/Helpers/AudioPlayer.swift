//
//  AudioPlayer.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 21/05/2021.
//

// From: https://gist.github.com/standinga/f3e303d504f770a33496941137a68eef
// Discussion: https://stackoverflow.com/questions/54345702/how-to-play-multiple-audio-files-simultaneously-using-avplayer

// ⚠️ This player can display time, not sure we need this. There is another solution on the Stackoverflow without it 
// 😅 I didn't use it...

import Foundation
import AVFoundation

class AudioPlayer {
    
    static var audioPlayer:AVAudioPlayer?
    static var audioSecondPlayer: AVAudioPlayer?
    
    static func playBackgroundSound(soundFile: String) {
        
        if let path = Bundle.main.path(forResource: soundFile, ofType: nil){
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.prepareToPlay()
                audioPlayer?.numberOfLoops = -1
                audioPlayer?.play()
            } catch {
                print("Error")
            }
        }
    }
    
    static func playSecondarySound(soundFile: String) {
        
        if let path = Bundle.main.path(forResource: soundFile, ofType: nil){
            
            do {
                audioSecondPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioSecondPlayer?.prepareToPlay()
                audioSecondPlayer?.play()
            } catch {
                print("Error")
            }
        }
    }
    
    static func stopSecondarySound() {
        if ((audioSecondPlayer?.isPlaying) != nil) {
            do {
                audioSecondPlayer?.setVolume(0, fadeDuration: 1)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                    audioSecondPlayer?.stop()
                }
            }
        }
    }
    
    static func stopMainSound(){
        if ((audioPlayer?.isPlaying) != nil) {
            do {
                audioPlayer?.setVolume(0, fadeDuration: 1)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                    audioPlayer?.stop()
                }
            }
        }
    }
}
