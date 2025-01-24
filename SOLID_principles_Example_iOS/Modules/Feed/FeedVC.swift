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
		viewModel: FeedViewModelProtocol,
		onRefresh: @escaping Block
	) {
		super.init(coder: coder)
		self.viewModel = viewModel
		self.onRefresh = onRefresh
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("You must create this view controller.")
	}
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = .init(top: 25, left: 0, bottom: 25, right: 0)
		onRefresh?()
    }
}

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - factory method
extension FeedVC {
	static func get(viewModel: FeedViewModelProtocol, onRefresh: @escaping () -> Void) -> UIViewController {
		let view = UIStoryboard(name: "Feed", bundle: nil).instantiateViewController(
			identifier: "FeedVC") { coder in
				return FeedVC(
					coder: coder,
					viewModel: viewModel,
					onRefresh: onRefresh
				)
			}
		return view
	}
}
