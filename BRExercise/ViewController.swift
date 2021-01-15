//
//  ViewController.swift
//  BRExercise
//
//  Created by Edvin Lellhame on 1/14/21.
//

import UIKit
import BlinkReceipt

class ViewController: UIViewController, BRScanResultsDelegate {
    
    var receipts = [Receipt]()
    
    let button: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "camera"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let receiptTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.showsVerticalScrollIndicator = false
//        tableView.backgroundColor = UIColor(red: 236/255.0, green: 236/255.0, blue: 239/255.0, alpha: 1)
        
        return tableView
    }()
    
    let firstPostButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        setViewAndConstraints()
        firstPostButton.setTitle("Add your first receipt! ( + )", for: .normal)
        firstPostButton.setTitleColor(.black, for: .normal)
        view.bringSubviewToFront(firstPostButton)
        receiptTableView.register(ReceiptCell.self, forCellReuseIdentifier: ReceiptCell.reuseIdentifer)
        receiptTableView.dataSource = self
        receiptTableView.delegate = self
        receiptTableView.separatorStyle = .none
        receiptTableView.backgroundColor = UIColor(red: 236/255.0, green: 236/255.0, blue: 239/255.0, alpha: 1)
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        firstPostButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        let scanOptions = BRScanOptions()
        BRScanManager.shared().startStaticCamera(from: self, scanOptions: scanOptions, with: self)
            
    }

    private func setViewAndConstraints() {
        view.addSubview(firstPostButton)
        NSLayoutConstraint.activate([
            firstPostButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            firstPostButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        ])
        
        view.addSubview(receiptTableView)
        NSLayoutConstraint.activate([
            receiptTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            receiptTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            receiptTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            receiptTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 80),
            button.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    
    func didFinishScanning(_ cameraViewController: UIViewController!, with scanResults: BRScanResults!) {
        let total = scanResults.total.value
        let storeName = scanResults.merchantName.value
        let storeAddress = scanResults.storeAddress.value
        let storeCity = scanResults.storeCity.value
        let storeZip = scanResults.storeZip.value
        let storePhone = scanResults.storePhone.value
        let id = scanResults.blinkReceiptId
        let state = scanResults.storeState.value
        
        let receipt = Receipt(storeName: storeName ?? nil, storeAddress: storeAddress ?? nil, storeZipCode: storeZip ?? nil, storePhone: storePhone ?? nil, storeCity: storeCity ?? nil, storeState: state ?? nil, id: id!, total: String(total))
        
        
        self.receipts.append(receipt)
        
        DispatchQueue.main.async {
            self.receiptTableView.reloadData()
            cameraViewController.dismiss(animated: true, completion: nil)
            self.firstPostButton.isHidden = true
            self.firstPostButton.isEnabled = false
        }
    }
    
    

}

// MARK: TableViewDelegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receipts.count
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReceiptCell.reuseIdentifer, for: indexPath) as! ReceiptCell
        let receipt = receipts[indexPath.row]
        cell.setCell(receipt: receipt)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
