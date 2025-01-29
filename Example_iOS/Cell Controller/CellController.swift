//
//  CellController.swift
//  SOLID_principles_Example_iOS
//
//  Created by sudhir on 24/01/25.
//

import UIKit

protocol CellController {

	func register(_ tableView: UITableView)
	
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}

extension CellController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
}
