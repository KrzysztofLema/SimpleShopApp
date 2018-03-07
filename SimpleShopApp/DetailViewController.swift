

import UIKit
import RealmSwift

class DetailViewController: UIViewController,ChangeAmountDelegate{
    
    @IBOutlet weak var sumLabel: UILabel!
    
    var book:BookModel=BookModel()
    let realm = try! Realm()
    
    
    @IBAction func addToArray(_ sender: Any) {
       let newData = Data()
        newData.title = book.title
        newData.price = book.price
        saveData(data: newData)
        sumLabel.text = totalAmount()
    }
    @IBOutlet var headerView:BooksDetiledHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.detiledImageView.image = UIImage(named: book.image)
        headerView.titleLabel.text = book.title
        headerView.authorLabel.text = book.author
        headerView.priceLabel.text = String(book.price)
        headerView.descriptionLabel.text = book.description
        sumLabel.text = totalAmount()
        sumLabel.sizeToFit()
    }
    func saveData(data: Data){
        do{
            try realm.write {
                realm.add(data)
            }
        }catch{
            print("Error saving category,\(error)")
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
