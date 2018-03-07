import UIKit

class DramaTableViewController: UITableViewController{
    
    var dramaBooks:[BookModel]=[BookModel(title: "48 Tygodni",author: "Magdalena Korde", image: "48Tygodni",price: 26.69,description:"loremIpsum" ),BookModel(title: "Gwiazdka z Nieba",author: "Katarzyna Michalak", image: "GwizadkaZNieba",price: 26.57,description:"loremIpsum" ),BookModel(title: "Przybysz z Morza",author: "Windston Gordon", image: "PrzybyszZMorza",price: 24.49,description:"loremIpsum" ),BookModel(title: "Jak Zawsze",author: "Zygmund Miłoszewski", image: "JakZawsze",price: 27.19,description:"loremIpsum" )]
    
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
