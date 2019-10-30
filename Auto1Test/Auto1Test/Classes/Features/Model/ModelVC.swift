//
//  ModelVC.swift
//  Auto1Test
//
//  Created by Adnan Munir on 16/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import UIKit

class ModelVC: BaseVC {

    var coordinator : ModelCoordinator?
    
    @IBOutlet weak var tableView: UITableView!
    var modelVM : ModelVM! {
        didSet {
            self.modelVM.updateView = {[unowned self] in
                if self.modelVM.getRows() > 0 {
                    self.tableView.isHidden = false
                }
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getData()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        coordinator?.moveBackToManufacturers()
        super.viewDidDisappear(animated)
        
    }
    
    private func setupUI() {
        setNavigationBarTitle("Models")
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension;
        tableView.estimatedRowHeight = 65.0;
        registerCell()
    }
    
    
    private func getData() {
        
        modelVM.getModels()
    }
    
    private func registerCell() {
        let loadingCellNib = UINib(nibName: LoadingTVC.string, bundle: Bundle(for: LoadingTVC.self))
        tableView.register(loadingCellNib, forCellReuseIdentifier: LoadingTVC.string)
    }

}

extension ModelVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelVM.getRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if  modelVM.isShowLoadingCell(indexPath.row) {
            let cell = tableView.dequeueReusableCell(withIdentifier: LoadingTVC.string, for: indexPath) as! LoadingTVC
            cell.startLoading()
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ModelTVC.string, for: indexPath) as! ModelTVC
        cell.configureView(modelVM.getModel(at: indexPath.row), index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        modelVM.modelSelected(at: indexPath.row)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if maximumOffset - currentOffset <= 20.0 {
            modelVM.getNextData()
        }
    }
}
