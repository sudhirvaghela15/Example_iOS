//
//  CardModel.swift
//  SOLID_principles_Example_iOS
//
//  Created by sudhir on 24/01/25.
//


struct CardModel {
    var title: String!
    var description: String!
    var active: Bool!
}

var dummyCardModelArrayOne = [
	CardModel(title: "Title 1", description: "Description 1", active: false),
	CardModel(title: "Title 2", description: "Description 2", active: true),
	CardModel(title: "Title 3", description: "Description 5", active: false),
	CardModel(title: "Title 4", description: "Description 6", active: false)

]

var dummyCardModelArrayTwo = [
	CardModel(title: "Title 5", description: "Description 5", active: false),
	CardModel(title: "Title 6", description: "Description 6", active: false),
	CardModel(title: "Title 7", description: "Description 8", active: false)
]

var dummyCardCardModelArrayThree = [
	CardModel(title: "Title 10", description: "Description 10", active: false),
	CardModel(title: "Title 11", description: "Description 11", active: true),
	CardModel(title: "Title 12", description: "Description 12", active: true),
	CardModel(title: "Title 13", description: "Description 13", active: true)
]
