//
//  FeedVC.swift
//  SOLID_principles_Example_iOS
//
//  Created by sudhir on 24/01/25.
//

import UIKit

class FeedVC: UIViewController {
	
	public typealias Block = () -> Void
	
	private var viewModel: FeedViewModelProtocol!
	private var onRefresh: Block?
	
	@IBOutlet private weak var tableView: UITableView!
	
	required init?(
		coder: NSCoder,
		viewModel: FeedViewModelProtocol
	) {
		super.init(coder: coder)
		self.viewModel = viewModel
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("You must create this view controller.")
	}
        
    override func viewDidLoad() {
        super.viewDidLoad()
		overrideUserInterfaceStyle = .dark
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = .init(top: 25, left: 0, bottom: 25, right: 0)
                
		viewModel.updateData?()
		
		viewModel.cellControllers.forEach({ $0.register(tableView)})
    }
}

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		viewModel.cellControllers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let dl = viewModel.cellControllers[indexPath.row]
		return dl.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let dl = viewModel.cellControllers[indexPath.row]
		dl.tableView(tableView, didSelectRowAt: indexPath)
	}
}

// MARK: - factory method
extension FeedVC {
	static func get(viewModel: FeedViewModelProtocol) -> UIViewController {
		let view = UIStoryboard(name: "Feed", bundle: nil).instantiateViewController(
			identifier: "FeedVC") { coder in
				return FeedVC(
					coder: coder,
					viewModel: viewModel
				)
			}
		return view
	}
}
