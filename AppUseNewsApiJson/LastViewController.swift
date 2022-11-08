//
//  LastViewController.swift
//  AppUseNewsApiJson
//
//  Created by Ruslan Ismailov on 06/11/22.
//

import UIKit


class LastViewController: UIViewController {
    
    let titleNews: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 22)
        label.textAlignment = .center
        
        return label
    }()
    
    let textField: UITextView = {
        var tf = UITextView()
        tf.translatesAutoresizingMaskIntoConstraints = false
//        tf.sizeToFit()
        tf.textColor = .white
        tf.textAlignment = .justified
        tf.font = UIFont(name: "Helvetica", size: 24)
        tf.backgroundColor = .clear


        return tf
    }()
    
    let imageOfNews: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        
        return image
    }()
    
    let autorsName: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 19)
        label.textColor = .white
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .darkGray
        
        
        view.addSubview(titleNews)
        view.addSubview(imageOfNews)
        view.addSubview(autorsName)
        view.addSubview(textField)
        
        textField.isScrollEnabled = true
        
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        let safeArea = view.layoutMarginsGuide
        
        let contentSize = textField.sizeThatFits(textField.bounds.size)
        var frame = textField.frame
        frame.size.height = contentSize.height
        textField.frame = frame
        
        titleNews.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0).isActive = true
        titleNews.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        imageOfNews.topAnchor.constraint(equalTo: titleNews.bottomAnchor, constant: 10).isActive = true
        imageOfNews.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        imageOfNews.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        textField.topAnchor.constraint(equalTo: imageOfNews.bottomAnchor, constant: 10).isActive = true
        textField.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 0).isActive = true
        textField.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: 0).isActive = true
//        textField.heightAnchor.constraint(equalToConstant: textField.frame.height).isActive = true
        textField.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -40).isActive = true
        
        autorsName.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: 0).isActive = true
        
        autorsName.topAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -25).isActive = true
//        autorsName.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        
    }


}
