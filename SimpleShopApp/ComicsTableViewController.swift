import UIKit

class ComicsTableViewController: UITableViewController{
    
    
    var comicsBooks:[BookModel]=[BookModel(title: "Kajko i Kokosz",author: "Janusz Christa", image: "KajkoiKokosz",price: 14.99,description:"loremIpsum" ),BookModel(title: "Ateriks i Goci",author: "Rene Goscinny", image: "Asteriks",price: 16.99,description:"loremIpsum" ),BookModel(title: "Tytus Romek i A'Tomek",author: "Henryk Chmielewski", image: "Tytus",price: 14.03,description:"loremIpsum" ),BookModel(title: "Pipi sie Wprowadza",author: "Astrid Lindgred", image: "Pipi",price: 19.99,description:"loremIpsum" )]

    override func viewDidLoad() {
        print("Witaj w ComicsController")
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comicsBooks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndetifier="ComicsCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndetifier, for: indexPath)as!ComicsTableViewCell
        let bookPrice = comicsBooks[indexPath.row].price
        let bookPriceString = String(bookPrice)
        cell.titleLabel.text=comicsBooks[indexPath.row].title
        cell.authorLabel.text=comicsBooks[indexPath.row].author
        cell.comicsImageView.image=UIImage(named: comicsBooks[indexPath.row].image)
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
                destinationController.book = comicsBooks[indexPath.row]
            }
        }
    }
}
