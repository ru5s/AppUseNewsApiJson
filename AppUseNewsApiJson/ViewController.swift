//
//  ViewController.swift
//  AppUseNewsApiJson
//
//  Created by Ruslan Ismailov on 06/11/22.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {
    
    var haveData: Bool = false
    
    let defaultUrl = URL(string: "https://1.bp.blogspot.com/--b7JV7PgDPo/Xj6jliViqZI/AAAAAAAAC60/NO3XtMYWHR00NPBc-a_wxlkszqLEB07QACLcBGAsYHQ/s1600/record.jpg")!
    
    let tableView: UITableView = {
        var tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.backgroundColor = .clear
        
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .darkGray
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFromJson()
        
        tableView.separatorStyle = .none
        tableView.sectionHeaderTopPadding = 0
        
        
    }
    
    @objc private func gestureDone(){
        print("its work")
    }

    override func viewDidLayoutSubviews() {
        let safeArea = view.layoutMarginsGuide
        print("data from didlayout \(haveData)")
        if haveData == true {
            tableView.stopSkeletonAnimation()
        } else {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                
                // Данные пришли. Останавливаем анимацию скелетона
                self.tableView.stopSkeletonAnimation()
                // Скрываем скелетон
                self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
                // Перезагружаем таблицу
                self.tableView.reloadData()
            }
        }
        
        
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        gradientBackground()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.isSkeletonable = true
        if haveData == false {
            tableView.showAnimatedGradientSkeleton()
        }
        tableView.updateSkeleton(usingColor: UIColor.midnightBlue)
    }
    
    
    
    private func gradientBackground(){
        let colorTop =  UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 70.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 100.0/255.0, green: 100.0/255.0, blue: 100.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.4, 0.75]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.backgroundColor = .clear
        
//        DispatchQueue.main.sync {
//            
//            
//            
//        }
        
//        cell.name.text = "Name"
//        cell.date.text = Date().description
//        cell.textField.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        cell.imageOfCell.image = UIImage(named: "launch logo")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.tintColor = UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 70.0/255.0, alpha: 1.0)
        headerView.textLabel?.textColor = .white
        headerView.textLabel?.font = UIFont(name: "Helvetica", size: 30)
        
        let line: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .white
            return view
        }()
        
        headerView.addSubview(line)
        line.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.widthAnchor.constraint(equalToConstant: headerView.bounds.width).isActive = true
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        let header: String = " All news ".uppercased()

        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let lastVC = LastViewController()
        
        lastVC.titleNews.text = "Title of news"
        lastVC.autorsName.text = "Arthur Conan Doil"
        lastVC.imageOfNews.image = UIImage(named: "launch logo")
        lastVC.textField.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        
        lastVC.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backBtn))
        lastVC.navigationItem.leftBarButtonItem?.tintColor = .white
        
        let navBar = UINavigationController(rootViewController: lastVC)
        
        navBar.modalTransitionStyle = .crossDissolve
        navBar.modalPresentationStyle = .fullScreen
        
        present(navBar, animated: true)
        
        tableView.reloadData()
    }
    
    @objc private func backBtn(){
        dismiss(animated: true)
        haveData = true
        print("data from dismis \(haveData)")
    }
    
    
    func getDataFromJson(){
        
        let urlMy = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2022-10-08&sortBy=publishedAt&apiKey=ea9f3fd5e5ef4620b6797fdd0cc4d3ed&page=1")
        
        guard let urlRequest = urlMy else { return }
        var request = URLRequest(url: urlRequest)
        
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                              guard let jsonData = json as? [String:Any] else { return }
                              if let arrayNews = jsonData["articles"] as? NSArray {
                 
                                for news in arrayNews {
                                  guard let currentNews = news as? [String:Any] else { return }
                 
                                  var currentTitle: String = "Without title"
                                  if let title = currentNews["title"] as? String {
                                    currentTitle = title
                                  }
                 
                                  let datePublishedAt = currentNews["publishedAt"] as! String
    //                              let convertedDate = self.dateConverter(datePublishedAt)
                 
                                  var currentAuthor: String = "Without author"
                                  if let author = currentNews["author"] as? String {
                                    currentAuthor = author
                                  }
                 
                                  var currentDescription: String = "Without description"
                                  if let description = currentNews["description"] as? String {
                                    currentDescription = description
                                  }
                 
                                  var currenURL: URL = self.defaultUrl
                                  if let urlString = currentNews["url"] as? String {
                                    currenURL = URL(string: urlString)!
                                  }
                 
                                  var currentImageURL: URL = self.defaultUrl
                                  if let imageString = currentNews["urlToImage"] as? String {
                                    if imageString.isEmpty{
                                      currentImageURL = self.defaultUrl
                                    }else{
                                      currentImageURL = URL(string: imageString) ?? self.defaultUrl
                                    }
                                  }
                                    print("current title - \(currentTitle)")
                                }
                              }
            } catch {
                print("error - \(error)")
            }
            
            
        }
        task.resume()
    }
    
}

