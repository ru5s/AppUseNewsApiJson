//
//  TableViewCell.swift
//  AppUseNewsApiJson
//
//  Created by Ruslan Ismailov on 06/11/22.
//

import UIKit
import SkeletonView

class TableViewCell: UITableViewCell {
    let name: UILabel = {
        var label = UILabel()
        label.text = "                          "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isSkeletonable = true
        label.skeletonCornerRadius = 5
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 12)
        
        return label
    }()
    
    let date: UILabel = {
        var label = UILabel()
        label.text = "                          "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isSkeletonable = true
        label.skeletonCornerRadius = 5
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 10)
        
        return label
    }()
    
//    let textField: UITextView = {
//        var tf = UITextView()
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        tf.textColor = .white
//        tf.font = UIFont(name: "Helvetica", size: 14)
//        tf.backgroundColor = .clear
//
//
//        return tf
//    }()
    
    let textField: UILabel = {
        var label = UILabel()
        label.text = "                                                                   "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isSkeletonable = true
        label.skeletonCornerRadius = 5
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 14)
        label.backgroundColor = .clear
        label.numberOfLines = 3
        
        return label
    }()
    
    let imageOfCell: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isSkeletonable = true
        image.skeletonCornerRadius = 5
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        isSkeletonable = true
        
        contentView.addSubview(name)
        contentView.addSubview(date)
        contentView.addSubview(textField)
        contentView.addSubview(imageOfCell)
        
        imageOfCell.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        imageOfCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2).isActive = true
        imageOfCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2).isActive = true
        imageOfCell.widthAnchor.constraint(equalToConstant: 130).isActive = true
        
        name.leftAnchor.constraint(equalTo: imageOfCell.rightAnchor, constant: 10).isActive = true
        name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2).isActive = true
        
        textField.leftAnchor.constraint(equalTo: imageOfCell.rightAnchor, constant: 10).isActive = true
        textField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        textField.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5).isActive = true
//        textField.bottomAnchor.constraint(equalTo: date.topAnchor, constant: -10).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        date.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2).isActive = true
        date.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
