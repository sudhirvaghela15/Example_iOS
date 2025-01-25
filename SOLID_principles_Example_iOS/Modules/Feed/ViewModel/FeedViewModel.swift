//
//  ViewModel.swift
//  SOLID_principles_Example_iOS
//
//  Created by sudhir on 24/01/25.
//

import Foundation

protocol FeedViewModelProtocol {
	var items: [HomeFolder] { get set }
	var updateData: (() -> Void)? { get set }
}

final class FeedViewModel: FeedViewModelProtocol {
	var items: [HomeFolder] = [
		dummyHomeFolderOne,
		dummyHomeFolderOneTow,
		dummyHomeFolderTwo,
		dummyHomeFolderThree,
		dummyHomeFolderFive
	]

	var updateData: (() -> Void)?
	
}
