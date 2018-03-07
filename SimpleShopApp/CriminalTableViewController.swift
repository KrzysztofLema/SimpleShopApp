
import UIKit

protocol UsersBooks {
    func UserBooks(book:[String])
}

class CriminalTableViewController: UITableViewController{
    
    var criminalBooks:[BookModel]=[BookModel(title: "Pierwszy Śnieg",author: "Jo Nesbø", image: "PierwszyŚnieg",price: 26.99,description:"Jest listopad, w Oslo właśnie spadł pierwszy śnieg. Birte Becker po powrocie z pracy do domu chwali syna i męża za ulepienie bałwana w ogrodzie. Nie jest on jednak ich dziełem. Stają przy oknie - i widzą, że bałwan jest skierowany twarzą w stronę domu. Patrzy wprost na nich."                                                                                                                                                                                                                                ),BookModel(title: "Morderstwo w Orient Expressie",author: "Agatha Christie", image: "MorderstwoWOrientExpresie",price: 24.99 ,description:"Herkules Poirot po rozwiązaniu sprawy kryminalnej w Azji wraca do Europy. Pociąg Orient Express, którym podróżuje, grzęźnie w zaspie śnieżnej. W nocy w niewyjaśnionych okolicznościach ginie jeden z pasażerów. Detektyw Poirot rozpoczyna dochodzenie, a jego podróż zamienia się w śledztwo. Fakty wskazują, że zabójca zajmuje przedział w tym samym wagonie… Czy Poirot zdoła rozwiązać zagadkę tajemniczego morderstwa? Sprawa nie należy do łatwych - każdy pasażer jest podejrzany… "  ),BookModel(title: "Trylogia Milennium",author: "Stieg Larsson", image: "TrylogiaMillenium",price: 56.99 ,description:"Bestsellerowe powieści kryminalne, wywodzące się z najlepszej szwedzkiej tradycji fikcji i literatury kryminalnej: świetnie napisane, z trzymającą w napięciu fabułą i fascynującymi postaciami. Wyjątkowe zjawisko na światowym rynku literackim! Te książki można czytać na wielu płaszczyznach: jak kryminały pełne mrocznych i nierzadko politycznych tajemnic, jak doskonałe, wielowątkowe powieści współczesne, pełne prawdziwych zdarzeń i osób, i w końcu jak thriller psychologiczny."  ),BookModel(title: "Chemia Śmierci",author: "Simon Beckett", image: "ChemiaŚmierci",price: 24.05 ,description:"W Polsce sprzedanych w ponad 150 000 egzemplarzy! Manham. Małe spokojne miasteczko. 'Krajobraz pozbawiony zarówno życia, jak i konkretnych kształtów. Płaskie wrzosowiska i upstrzone kępami drzew mokradła'. To tu doktor David Hunter szuka schronienia przed okrutną przeszłością. Sądzi, że przeżył już wszystko to, co najgorszego może przeżyć człowiek. Sądzi, że wie o śmierci wszystko. Ale śmierć, ów proces alchemii na wspak, w którym złoto życia ulega rozbiciu na cuchnące składniki wyjściowe', wdziera się do Manham. I to w niewyobrażalnie wynaturzonych formach. Jeszcze nie wiemy, dlaczego wybitny antropolog sądowy doktor Hunter zaszył się tu jako zwykły lekarz. Dlaczego odmawia pomocy policji, skoro potrafi określić czas i sposób dokonania każdej zbrodni. Wiemy tylko, że się boimy. Razem z mieszkańcami Manham czujemy odór wszechobecnej śmierci. Giną młode kobiety, dzieci znajdują makabrycznie okaleczone zwłoki, ktoś podrzuca pod drzwi martwe zwierzęta, ktoś zastawia sidła na ludzi. Spokojne miasteczko rozsadza strach i nienawiść. Każdy może być ofiarą... I każdy może być zwyrodniałym mordercą..."  )]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return criminalBooks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIndetifier="CriminalCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndetifier, for: indexPath) as! CriminalTableViewCell
        let bookPrice = criminalBooks[indexPath.row].price
        let bookPriceString = String(bookPrice)
        cell.titleLabel.text=criminalBooks[indexPath.row].title
        cell.criminalImageView.image=UIImage(named: criminalBooks[indexPath.row].image)
        cell.authorLabel.text=criminalBooks[indexPath.row].author
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
                destinationController.book = criminalBooks[indexPath.row]
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
