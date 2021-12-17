//
//  RatesPageViewController.swift
//  RatePage
//
//  Created by Melalujka on 12.12.2021.
//

import UIKit

class RatesPageViewController: UIViewController {
    var viewModel: RatesPageViewModel?
    
    @IBOutlet weak var tableView: UITableView?
    
    enum Section: CaseIterable, Hashable {
        case main
    }
    
    typealias DataSource = UITableViewDiffableDataSource<Int, Rate>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Rate>
    
    var dataSource: DataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel?.fetchRates()
    }

    private func bindViewModel() {
        viewModel?.bind { [weak self] action in
            switch action {
            case .success:
                self?.update()
            case .failure(message: let text):
                self?.showSimpleAlert(message: text)
            }
        }
    }
    
    private func setup() {
        initDataSource()
        tableView?.dataSource = dataSource
        tableView?.delegate = self
    }
    
    private func initDataSource() {
        guard let tableView = tableView else { return }

        tableView.register(UINib(nibName: CurrencyRateCell.identifier, bundle: nil), forCellReuseIdentifier: CurrencyRateCell.identifier)
        
        dataSource = DataSource(tableView: tableView) { tableView, indexPath, itemIdentifier in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyRateCell.identifier, for: indexPath) as? CurrencyRateCell else { return UITableViewCell() }
            cell.configure(itemIdentifier)
            
            return cell
        }
    }
    
    private func update() {
        guard var snapshot = dataSource?.snapshot() else { return }
        snapshot.appendSections(viewModel?.sections ?? [])
        viewModel?.sections?.forEach { section in
            if let items = viewModel?.getItems(for: section) {
                snapshot.appendItems(items, toSection: section)
            }
        }
        dataSource?.apply(snapshot, animatingDifferences: false)
    }
}

extension RatesPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionIdentifier = dataSource?.sectionIdentifier(for: section) else { return nil }
        let header = HeaderView()
        header.setTitle("Торговая площадка №\(sectionIdentifier)")
        
        return header
    }
}
