//
//  ViewModel.swift
//  SOLID_principles_Example_iOS
//
//  Created by sudhir on 24/01/25.
//

import Foundation

protocol FeedViewModelProtocol {
	var cellControllers: [CellController] { get set }
	var updateData: (() -> Void)? { get set }
}

final class FeedViewModel: FeedViewModelProtocol {
	var cellControllers: [CellController] = []
	var updateData: (() -> Void)?
	
	init() {
		updateData = loadMockData
	}
	
	func loadMockData() {
		let mockdata = [dummyHomeFolderOne, dummyHomeFolderTwo, dummyHomeFolderThree, dummyHomeFolderFour, dummyHomeFolderFive]
		cellControllers = []
		mockdata.forEach { folder in
			switch folder.type {
				case "section one":
					cellControllers.append(contentsOf: folder.items.compactMap({ CardTwoCellController(model: $0)}))
				case "section two":
					cellControllers.append(contentsOf: folder.items.compactMap({ CardCellController(model: $0)}))
				case "section three":
					cellControllers.append(contentsOf: folder.items.compactMap({ CardCellController(model: $0)}))
				case "section four":
					cellControllers.append(contentsOf: folder.items.compactMap({ CardTwoCellController(model: $0)}))
				case "section five":
					cellControllers.append(contentsOf: folder.items.compactMap({ CardCellController(model: $0)}))
				default: break
			}
		}
	}
	
}
