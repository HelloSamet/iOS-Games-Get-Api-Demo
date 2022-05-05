//
//  ViewController.swift
//  VideoGames_Api
//
//  Created by Abdulsamet Göçmen on 4.05.2022.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pagecntrl: UIPageControl!
    
        public let url = URL(string: "https://api.rawg.io/api/platforms?key=cb8dbc4257f6408d93e87757126f1624")
        public let session = URLSession.shared
        public let myJSONData = try! Data(contentsOf: URL(string: "https://api.rawg.io/api/platforms?key=cb8dbc4257f6408d93e87757126f1624")!)
        public var res = [Result]()
        public static var  collections = [Collection]()
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        getData()
    }
    
    func getData(){
        let decoder = JSONDecoder()
        do{
            let data = try! decoder.decode(FakeData.self, from: myJSONData)
            for index in 0...49{
                res.append(data.results![index])
            }
                firsFor: for number1 in 0...49{
                    secondFor: for number2 in 0...6{
                        if number2 == 6{
                            continue firsFor
                        }
                        //print(data.results![number1].games![number2])
                        //print("\n")
                        var col = Collection()
                        //col.image!.downloadImage(from: res[number1].imageBackground!) burada resim ekleniyor fakat boş döndüğü için yorum satırına aldım.
                        col.name = res[number1].games![number2].name
                        col.raiting = res[number1].image
                        ViewController.collections.append(col)
                    }
                }
           
        }catch let error{
            print(error)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 300
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as? TableViewCell
        
        cell?.nameGame.text = ViewController.collections[indexPath.item].name
        cell?.raitingGame.text = ViewController.collections[indexPath.count].raiting
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        var index = indexPath.row / 6
        
        for item in 0...indexPath.row{
            if item == indexPath.row{
                print(res[index].games![item])
            }
                   
        }
      
    }
    
}



extension UIImageView{
    func downloadImage(from url: String){
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil{
                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}

