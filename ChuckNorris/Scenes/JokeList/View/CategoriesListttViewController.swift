////
////  JokeListViewController.swift
////  ChuckNorris
////
////  Created by Marina Aguiar on 23/12/2021.
////
//
//import UIKit
//import Alamofire
//
//class CategoriesListViewController: UIViewController {
//    
//    @IBOutlet weak var tableView: UITableView!
//    
//    private lazy var viewModel: CategoriesListViewModelProtocol = CategoriesListViewModel(delegate: self)
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setup()
//        navigationController?.navigationBar.prefersLargeTitles = true
//    }
//}
//
//extension CategoriesListViewController {
//    
//    func setup() {
//        tableView.dataSource = self
//        tableView.delegate = self
//        viewModel.getCategories()
//        tableView.register(CategoryViewCell.self)
//        tableView.reloadData()
//    }
//    
//    func cell(_ tableView: UITableView, indexpath: IndexPath, categoryCell: CategoryCell) -> UITableViewCell {
//        let cell = tableView.dequeCell(CategoryViewCell.self, indexpath)
//        cell.fill(titleName: categoryCell)
//        cell.imageView?.image = UIImage.init(systemName: categoryCell.title ?? "")
//        cell.imageView?.tintColor = UIColor(red: 0.95, green: 0.80, blue: 0.56, alpha: 1.00)
//        return cell
//    }
//}
//
//extension CategoriesListViewController: UITableViewDataSource {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        viewModel.numberOfSections()
//        
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        viewModel.numberOfRows()
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        cell(tableView, indexpath: indexPath, categoryCell: viewModel.categoryCell(indexPath.row))
//    }
//}
//
//extension CategoriesListViewController: UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//        viewModel.showJoke(category: viewModel.transporter(index: indexPath.row))
//    }
//}
//
//extension CategoriesListViewController: CategoriesViewModelDelegate {
//    func didLoad() {
//        DispatchQueue.main.async { [weak self] in
//            guard let self = self else { return }
//            self.tableView.reloadData()
//        }
//    }
//    
//    func didLoadWithError() {
//        // Error
//    }
//    
//    func displayCategory(_ category: String) {
//        let jokeVc = JokeViewController()
//        jokeVc.setup(category)
//        guard (storyboard?.instantiateViewController(withIdentifier: "joke") as? JokeViewController) != nil else {
//            return
//        }
//        
////        viewController.category = viewModel.categories[indexPath.row]
//        
////        self.present(viewController, animated: true, completion: nil)
//    }
//}