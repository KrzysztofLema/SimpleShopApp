import UIKit

class BooksTableViewController: UITableViewController{
    
    var dramaBooks:[BookModel] = []
    
    override func viewDidLoad() {
        print("witaj w DramaController")
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dramaBooks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cellIndetifier="DramaCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndetifier,for:indexPath) as! DramaTableViewCell
        let bookPrice = dramaBooks[indexPath.row].price
        let bookPriceString = String(bookPrice)
        cell.DramaImageView.image=UIImage(named:dramaBooks[indexPath.row].image)
        cell.titleLabel.text = dramaBooks[indexPath.row].title
        cell.authorLabel.text = dramaBooks[indexPath.row].author
        cell.priceLabel.text = bookPriceString
        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetiles" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DetailViewController
                destinationController.book = dramaBooks[indexPath.row]
                
            }
        }
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        super.didMove(toParentViewController: parent)
        
        if parent == self.navigationController?.parent {
            print("Back tapped")
            
        }
    }
}
