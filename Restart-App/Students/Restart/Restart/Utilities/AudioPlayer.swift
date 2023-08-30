//
//  AudioPlayer.swift
//  Restart
//
//  Created by Taewon Yoon on 2023/08/20.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?
                // 사운드 파일 // 파일 확장자
func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("사운드 파일 실행 실패")
        }
    }
}
