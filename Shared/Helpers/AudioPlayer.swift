//
//  AudioPlayer.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 21/05/2021.
//

// From: https://gist.github.com/standinga/f3e303d504f770a33496941137a68eef
// Discussion: https://stackoverflow.com/questions/54345702/how-to-play-multiple-audio-files-simultaneously-using-avplayer

// ⚠️ This player can display time, not sure we need this. There is another solution on the stackoverflow without it 


import Foundation
import AVFoundation

class AudioPlayer {
    var topAudioFiles: [AVAudioFile] = []
    var engine:AVAudioEngine
    var backgroundAudioNode: AVAudioPlayerNode
    var backgroundAudioFile: AVAudioFile
    var topAudioAudioNodes = [AVAudioPlayerNode]()
    var mixer: AVAudioMixerNode
    var timer: Timer!
    var urls: [URL] = []
    var player: AVPlayer!
    var times = [NSValue]()
    var delays = [UInt64]()
    
    init (_ url: URL, urls: [URL] = []) {
        self.urls = urls
        topAudioFiles = urls.map { try! AVAudioFile(forReading: $0) }
        backgroundAudioFile = try! AVAudioFile(forReading: url)
        player = AVPlayer(url: url)
        engine = AVAudioEngine()
        mixer = AVAudioMixerNode()
        
        engine.attach(mixer)
        engine.connect(mixer, to: engine.outputNode, format: nil)
        backgroundAudioNode = AVAudioPlayerNode()
        
        initTimeOffsets()
        initTopAudioNodes()
        try! engine.start()
    }
    
    // play beeps every 1 bar @ 124 bpm (1936ms offset)
    func initTimeOffsets() {
        for i in 1...50 {
            let t = Double(1936 * i) / 1000.0
            times += [NSValue(time: CMTime(seconds: t, preferredTimescale: 600))]
        }
        for i in 1...100 {
            delays += [UInt64(i * 1936 / 1000 * 44100)]
        }
    }
    
    func initTopAudioNodes() {
        for _ in topAudioFiles {
            topAudioAudioNodes += [AVAudioPlayerNode()]
        }
        for node in topAudioAudioNodes {
            engine.attach(node)
            engine.connect(node, to: mixer, format: nil)
        }
    }
    
    func playWithAudioPlayerAndNodes() {
        player.play()
        var i = 1
        
        player.addBoundaryTimeObserver(forTimes: times, queue: nil) {
            let index = i % self.topAudioAudioNodes.count
            let node = self.topAudioAudioNodes[index]
            node.scheduleFile(self.topAudioFiles[index], at: nil, completionHandler: nil)
            node.play()
            i += 1
        }
    }
    
    func playWithNodes() {
        engine.attach(backgroundAudioNode)
        engine.connect(backgroundAudioNode, to: mixer, format: nil)
        
        var i = 0
        for t in times {
            let index = i % topAudioAudioNodes.count
            i += 1
            let node = topAudioAudioNodes[index]
            let delay = Int64(t.timeValue.seconds * 44100.0)
            let startSampleTime = node.lastRenderTime!.sampleTime + delay
            
            let avtime = AVAudioTime(sampleTime: startSampleTime, atRate: 44100)
            node.scheduleFile(self.topAudioFiles[index], at: avtime)
            node.play()
        }
        backgroundAudioNode.scheduleFile(backgroundAudioFile, at: nil)
        backgroundAudioNode.play()
    }
}

// 👇 Use it like this:

//let bundle = Bundle.main
//let beepLow = bundle.url(forResource: "beeplow", withExtension: "wav")!
//let beepMid = bundle.url(forResource: "beepmid", withExtension: "wav")!
//let backgroundAudio = bundle.url(forResource: "backgroundAudio", withExtension: "wav")!
//let audioPlayer = AudioPlayer(backgroundAudio, urls: [beepLow, beepMid])
//audioPlayer.playWithNodes()
//// second approach using AVPlayer and boundary time observer:
//audioPlayer.playWithAudioPlayerAndNodes()

