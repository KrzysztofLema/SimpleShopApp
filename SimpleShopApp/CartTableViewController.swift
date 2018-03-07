import UIKit
import RealmSwift
import SwipeCellKit

protocol ChangeAmountDelegate {
    func changeTotalAmountDelegate(amount: String)
}
class CartTableViewCell: UITableViewCell {
    

  
    @IBAction func deleteButton(_ sender: Any) {
        
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
}

class CartTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SwipeTableViewCellDelegate{
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sumLabel: UILabel!

    let realm = try!Realm()
    var dataArray:Results<Data>!
    var delegate : ChangeAmountDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
        totalAmount()
        self.title = "Koszyk"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 1
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndentifier = "cartCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as! CartTableViewCell
        cell.titleLabel.text = dataArray[indexPath.row].title
        let price = dataArray[indexPath.row].price
        let priceString = String(price)
        cell.priceLabel.text = priceString
        
        
        return cell
    }
    

    func loadCategories(){
        dataArray = realm.objects(Data.self)
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = dataArray?[indexPath.row]{
            do{
                try realm.write {
                    realm.delete(data)
                }
            }catch{
                print("Error with deleting data, \(error)")
            }
            tableView.reloadData()
            totalAmount()
        }
    }
    func totalAmount(){
        let totalAmount:Double = realm.objects(Data.self).sum(ofProperty: "price")
        let totalAmountString = String(totalAmount)
        sumLabel.text = totalAmountString
    }
    func totalAmountString() -> String {
        let totalAmount:Double = realm.objects(Data.self).sum(ofProperty: "price")
        let totalAmountString = String(totalAmount)
        return totalAmountString
    }
    override func viewWillDisappear(_ animated: Bool) {
        let totalAmount = totalAmountString()
        delegate?.changeTotalAmountDelegate(amount: totalAmount)
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            print("deleted item")
            
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")
        
        return [deleteAction]
    }
    }

