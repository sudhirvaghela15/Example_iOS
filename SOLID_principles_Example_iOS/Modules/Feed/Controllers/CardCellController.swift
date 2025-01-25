//
//  CardCellController.swift
//  SOLID_principles_Example_iOS
//
//  Created by sudhir on 25/01/25.
//

import UIKit

final class CardCellController: CellController {
	
	var model: CardModel
	
	init(model: CardModel) {
		self.model = model
	}
	
	func register(_ tableView: UITableView) {
		tableView.register(
			UINib(nibName: "CardCell", bundle: nil),
			   forCellReuseIdentifier: "CardCell"
		   )
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as! CardCell
		cell.didToggleStatus = { [weak self] in
			self?.model.active.toggle()
			tableView.reloadRows(at: [indexPath], with: .fade)
		}
		cell.configCell(item: model)
		cell.backgroundColor = .blue
		return cell
	}
}
