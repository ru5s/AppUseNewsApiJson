//
//  LaunchVC.swift
//  AppUseNewsApiJson
//
//  Created by Ruslan Ismailov on 06/11/22.
//

import UIKit

class LaunchVC: UIViewController {
    
    let launchImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(cgColor: CGColor(red: 144.0 / 255.0, green: 79.0 / 255.0, blue: 218.0 / 255.0, alpha: 1.0))
        
        view.addSubview(launchImage)
        launchImage.image = UIImage(named: "launch logo")
        
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(myMethod), userInfo: nil, repeats: false)

        RunLoop.main.add(timer, forMode: RunLoop.Mode.default)
    }
    
    override func viewDidLayoutSubviews() {
        launchImage.widthAnchor.constraint(equalToConstant: 312).isActive = true
        launchImage.heightAnchor.constraint(equalToConstant: 293).isActive = true
        launchImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        launchImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func myMethod()
    {
        let vc = ViewController()
        
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
        /*let vc = ViewController()
         vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backBtn))
         let navigationBtn = UINavigationController(rootViewController: vc)
         navigationBtn.modalTransitionStyle = .crossDissolve
         navigationBtn.modalPresentationStyle = .fullScreen
         
         present(navigationBtn, animated: true)*/
    }

}
