
import UIKit

class MusicTableViewController: UITableViewController {
    
    @IBOutlet weak var MusicImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    var musicLibrary:[MusicModel] = [MusicModel(title: "Bob Marley - Unity United",author: "Bob Marley",music: "BobMarley",image: "BobMarley",price: 45.5),MusicModel(title: "Metallica",author: "Enter",music: "Metallica",image: "Metallica",price: 50.0),MusicModel(title: "PinkFloyd",author: "PinkFloyd",music: "PinkFloyd",image: "PinkFloyd",price: 50.0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return musicLibrary.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cellIndentifier = "musicCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier , for: indexPath) as! MusicTableViewCell
        cell.musicImageView.image = UIImage(named: musicLibrary[indexPath.row].image)
        cell.musicTitleLabel.text = musicLibrary[indexPath.row].title
        let priceString = String(musicLibrary[indexPath.row].price)
        cell.musicPriceLabel.text = priceString
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMusicDetails" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! MusicDetailViewController
                destinationController.music = musicLibrary[indexPath.row]
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
