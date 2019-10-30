//
//  ManufacturerVC.swift
//  Auto1Test
//
//  Created by Adnan Munir on 14/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import UIKit

class ManufacturerVC: BaseVC {
    @IBOutlet weak var tableView: UITableView!
    
    var coordinator : ManufacturerCoordinator?
    
    var manufacturerVM : ManufacturerModeling! {
        didSet {
            self.manufacturerVM.updateView = {[unowned self] in
                if self.manufacturerVM.getRows() > 0 {
                    self.tableView.isHidden = false
                }
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manufacturerVM = ManufacturerVM()
        setupUI()
        getData()
    }
    
    private func setupUI() {
        setNavigationBarTitle("Manufacturers")
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension;
        tableView.estimatedRowHeight = 65.0;
        registerCell()
    }
    
    
    private func getData() {

        manufacturerVM.getManufacturers()
    }
    
    private func registerCell() {
        let loadingCellNib = UINib(nibName: LoadingTVC.string, bundle: Bundle(for: LoadingTVC.self))
        tableView.register(loadingCellNib, forCellReuseIdentifier: LoadingTVC.string)
    }
}

extension ManufacturerVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manufacturerVM.getRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if  manufacturerVM.isShowLoadingCell(indexPath.row) {
            let cell = tableView.dequeueReusableCell(withIdentifier: LoadingTVC.string, for: indexPath) as! LoadingTVC
            cell.startLoading()
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ManufacturerTVC.string, for: indexPath) as! ManufacturerTVC
        cell.configureView(manufacturerVM.getManufacturer(at: indexPath.row), index: indexPath.row)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator?.moveToModel(ModelVM(manufacturerVM.getManufacturer(at: indexPath.row)!))
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        // Change 10.0 to adjust the distance from bottom
        print("Distance")
        print(maximumOffset - currentOffset)
        if maximumOffset - currentOffset <= 20.0 {
            manufacturerVM.getNextData()
        }
    }
}
