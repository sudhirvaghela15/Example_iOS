//
//  CardModel.swift
//  SOLID_principles_Example_iOS
//
//  Created by sudhir on 24/01/25.
//


struct HomeFolder {
	var type: String
	var items: [CardModel]
}

struct CardModel {
    var title: String!
    var description: String!
    var active: Bool!
}

var dummyHomeFolderOne = HomeFolder(type: "section one", items: [
	CardModel(title: "Title 1", description: "Description 1", active: false),
	CardModel(title: "Title 2", description: "Description 2", active: true)
])

var dummyHomeFolderOneTow = HomeFolder(type: "section four", items: [
	CardModel(title: "Title 3", description: "Description 3", active: true),
	CardModel(title: "Title 4", description: "Description 4", active: false)
])


var dummyHomeFolderFive = HomeFolder(type: "section five", items: [
	CardModel(title: "Title 1", description: "Description 1", active: false),
	CardModel(title: "Title 2", description: "Description 2", active: true)
])

var dummyHomeFolderTwo = HomeFolder(type: "section two", items: [
	CardModel(title: "Title 5", description: "Description 5", active: false),
	CardModel(title: "Title 6", description: "Description 6", active: false),
])

var dummyHomeFolderThree = HomeFolder(type: "section three", items: [
	CardModel(title: "Title 8", description: "Description 8", active: false),
	CardModel(title: "Title 9", description: "Description 9", active: true)
])
