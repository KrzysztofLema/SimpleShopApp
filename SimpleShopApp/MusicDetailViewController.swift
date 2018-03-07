//
//  MusicDetailViewController.swift
//  SimpleShopApp
//
//  Created by Krzysztof Lema on 07.03.2018.
//  Copyright © 2018 Krzysztof Lema. All rights reserved.
//

import UIKit
import AVFoundation

class MusicDetailViewController: UIViewController {

    var music:MusicModel = MusicModel()
    var player:AVAudioPlayer?
    
    @IBOutlet var headerView:MusicDetiledHeaderView!
    @IBAction func playMusicButton(_ sender: Any) {
        playSound()
    }

    @IBAction func stopPlayMusicButton(_ sender: Any) {
    player?.stop()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
           headerView.musicImageView.image = UIImage(named: music.image)
            headerView.titleLabel.text = music.title
            headerView.priceLabel.text = String(music.price)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: music.music, withExtension: "mp3") else {
            print("url not found")
            print(music.music)
            return
        }
        
        do {
            /// this codes for making this app ready to takeover the device audio
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /// change fileTypeHint according to the type of your audio file (you can omit this)
            
            /// for iOS 11 onward, use :
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /// else :
            /// player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3)
            
            // no need for prepareToPlay because prepareToPlay is happen automatically when calling play()
            player!.play()
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
    } /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
