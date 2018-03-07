//
//  MusicDetailViewController.swift
//  SimpleShopApp
//
//  Created by Krzysztof Lema on 07.03.2018.
//  Copyright © 2018 Krzysztof Lema. All rights reserved.
//

import UIKit
import AVFoundation
import RealmSwift
class MusicDetailViewController: UIViewController, ChangeAmountDelegate {
    

    let realm = try!Realm()
    var music:MusicModel = MusicModel()
    var player:AVAudioPlayer?
    @IBOutlet var headerView:MusicDetiledHeaderView!
    @IBAction func playMusicButton(_ sender: Any) {
        playSound()
    }

    @IBOutlet weak var sumLabel: UILabel!
    @IBAction func stopPlayMusicButton(_ sender: Any) {
    player?.stop()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
           headerView.musicImageView.image = UIImage(named: music.image)
            headerView.titleLabel.text = music.title
            headerView.priceLabel.text = String(music.price)
        sumLabel.text = totalAmount()
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
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
    
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            player!.play()
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
    }
    @IBAction func buyButton(_ sender: Any) {
        let newData:Data = Data()
            newData.title = music.title
            newData.price = music.price
            saveData(data: newData)
            sumLabel.text = totalAmount()
    }
    func saveData(data:Data){
        do{
           try realm.write {
                realm.add(data)
            }
        }catch{
            print("Could not add data to database, \(error)")
        }
    }
    func totalAmount()->String{
        let totalAmount:Double = realm.objects(Data.self).sum(ofProperty: "price")
        let totalAmoutString = String(totalAmount)
        return totalAmoutString
    }
    
    func changeTotalAmountDelegate(amount: String) {
        sumLabel.text = amount
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listOfPurchase"{
            let destinationVC = segue.destination as! CartTableViewController
            destinationVC.delegate = self
        }
}
}
