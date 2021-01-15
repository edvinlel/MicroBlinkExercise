//
//  ReceiptCell.swift
//  BRExercise
//
//  Created by Edvin Lellhame on 1/14/21.
//

import UIKit

class ReceiptCell: UITableViewCell {
    
    
    static let reuseIdentifer = "Cell"
    
    // MARK: Properties
    let mainBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let storeName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "AvenirNext-Heavy", size: 22)
        label.text = "Store Name"
        return label
    }()
    
    let storeAddress: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "AvenirNext-Bold", size: 16)
        label.text = "333 Address St."
        return label
    }()
    
    let storeCityAndState: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "AvenirNext-Bold", size: 16)
        label.text = "City, ST"
        return label
    }()
    
    let storePhone: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "AvenirNext-Bold", size: 16)
        label.text = "111-111-1111"
        return label
    }()
    
    let storeZip: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "AvenirNext-Bold", size: 16)
        label.text = "55555"
        label.textAlignment = .left
        return label
    }()
    
    let storeTotal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.font = UIFont(name: "AvenirNext-Bold", size: 16)
        label.text = "$100.00"
        return label
    }()
    

    // MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor(red: 236/255.0, green: 236/255.0, blue: 239/255.0, alpha: 1)
        contentView.isUserInteractionEnabled = false
        selectionStyle = .none
    
        setConstraints()
    }
    
    // MARK: Initializers
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Helper Methods
    func setCell(receipt: Receipt) {
        storeName.text = receipt.storeName!
        storeAddress.text = receipt.storeAddress!
        storeZip.text = receipt.storeZipCode!
        storePhone.text = receipt.storePhone!
        storeTotal.text = "Total: $\(receipt.total!)"
        storeCityAndState.text = "\(receipt.storeCity!), \(receipt.storeState!)"
    }
    
    // MARK: Constraints
    private func setConstraints() {
        /// Container View
        addSubview(mainBackground)
        NSLayoutConstraint.activate([
            mainBackground.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            mainBackground.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            mainBackground.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            mainBackground.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        mainBackground.addSubview(storeName)
        NSLayoutConstraint.activate([
            storeName.topAnchor.constraint(equalTo: mainBackground.topAnchor, constant: 10),
            storeName.leftAnchor.constraint(equalTo: mainBackground.leftAnchor, constant: 25)
        ])
        
        mainBackground.addSubview(storeAddress)
        NSLayoutConstraint.activate([
            storeAddress.topAnchor.constraint(equalTo: storeName.bottomAnchor, constant: 0),
            storeAddress.leftAnchor.constraint(equalTo: mainBackground.leftAnchor, constant: 25)
        ])

        mainBackground.addSubview(storeCityAndState)
        NSLayoutConstraint.activate([
            storeCityAndState.topAnchor.constraint(equalTo: storeAddress.bottomAnchor, constant: 0),
            storeCityAndState.leftAnchor.constraint(equalTo: mainBackground.leftAnchor, constant: 25)
        ])
        
        mainBackground.addSubview(storeZip)
        NSLayoutConstraint.activate([
            storeZip.leftAnchor.constraint(equalTo: storeCityAndState.rightAnchor, constant: 20),
            storeZip.topAnchor.constraint(equalTo: storeAddress.bottomAnchor, constant: 0)
        ])

        
        mainBackground.addSubview(storePhone)
        NSLayoutConstraint.activate([
            storePhone.topAnchor.constraint(equalTo: storeCityAndState.bottomAnchor, constant: 0),
            storePhone.leftAnchor.constraint(equalTo: mainBackground.leftAnchor, constant: 25)
        ])
        
        mainBackground.addSubview(storeTotal)
        NSLayoutConstraint.activate([
           
            storeTotal.bottomAnchor.constraint(equalTo: mainBackground.bottomAnchor, constant: -5),
            storeTotal.rightAnchor.constraint(equalTo: mainBackground.rightAnchor, constant: -20)
        ])
        
        
        
   }
    
}
