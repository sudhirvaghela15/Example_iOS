//
//  CardCellController 2.swift
//  SOLID_principles_Example_iOS
//
//  Created by sudhir on 25/01/25.
//

import UIKit

final class CardTwoCellController: CellController {
	
	var model: CardModel
	
	init(model: CardModel) {
		self.model = model
	}
	
	func register(_ tableView: UITableView) {
		tableView.register(
			UINib(nibName: "Card2Cell", bundle: nil),
			   forCellReuseIdentifier: "Card2Cell"
		   )
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Card2Cell", for: indexPath) as! Card2Cell
		cell.configCell(item: model)
		cell.backgroundColor = .green
		return cell
	}
}
