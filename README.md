<h1>Avoid Switch Cases In TableView And Collection View</h1>

<p>Are you tired of dealing with switch cases that clutter your code, making it harder to maintain or extend? Do complex conditional statements frustrate you, limiting your ability to write reusable and clean code? If so, you're not alone. In this article, we’ll explore how to break free from the constraints of switch cases and embrace more flexible, extensible, and maintainable solutions for your codebase.</p>

<p>Consider a common scenario in app development where you have a list view with multiple types of cells. Each cell has its own unique layout and behavior. Traditionally, you may have used a switch case statement and if else to handle the different cell types, leading to a massive and unwieldy block of code. But what happens when you need to add a new type of cell? It quickly becomes a headache, involving extensive modifications to the existing code and violating the SOLID principle of open-closed design.</p>

<img width="647" alt="image" src="https://github.com/user-attachments/assets/db9626ef-f4a3-4680-9e93-1cb8385eb40c" />

<p>In the above screenshots, let’s say we want to introduce a new type of cell with a 
  completely different layout and functionality. With the switch case approach,
  we would need to modify the existing code, add a new case, 
  and handle the specific logic for the new cell type. This not only introduces overhead 
  development effort but also makes the code less maintainable and prone to errors.</p>


<h4>Solution:</h4>
<p>1- Create a protocol CellController, Using CellController promotes code reusability and maintainability.</p>

```
protocol CellController {
	func register(_ tableView: UITableView)
	
    	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}

extension CellController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
}

```

<p>2- Create a separate cell controller class for each cell type in the table view.
Each cell controller class should conform to the CellController protocol,
which defines the required methods for configuring the cell,
Each cell controller should have its own associated data type,
allowing for customization and flexibility in handling different types of cell data, 
include a static register method in each cell controller to register the corresponding cell
type with the table view, typically using a custom cell class or nib</p>

```
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
```

<h4>3- Create a list of cellControllers with the type CellController.</h4>

<img width="797" alt="image" src="https://github.com/user-attachments/assets/b209bf48-211e-4185-941d-c427270eff72" />

<p>in line 42 every cell we register the specific cell type </p>
<img width="671" alt="image" src="https://github.com/user-attachments/assets/f56561dd-eeb8-4552-ac5c-1f8e1f88e858" />

<h4>4- Finally look at UITableViewDataSource.</h4>
<img width="752" alt="image" src="https://github.com/user-attachments/assets/d81f40fa-dfc0-4f65-bf32-9997da04ef5d" />


<h4>Benefits of These Approaches</h4>
1. Scalability: Adding new sections or cell types is as simple as adding new models or conforming types.
2. Readability: Your view controller methods remain clean and focused on their primary responsibilities.
3. Reusability: Data models and protocol-based implementations can be reused across multiple view controllers.


<h4>Conclusion</h4>
In conclusion, the approach demonstrated in this article provides an effective solution for managing multiple cell types in UITableView and UICollectionView. By implementing the CellController protocol and utilizing switch cases, we can easily add new cell types without having to modify multiple parts of the codebase. This approach adheres to the SOLID principles, specifically the Single Responsibility Principle (SRP), by assigning a single responsibility to each CellController implementation.
Before adopting this approach, developers often had to locate and update multiple switch cases and if statements whenever a new cell type was introduced. This not only violated SOLID principles but also made the codebase less maintainable and prone to errors. By encapsulating the cell-specific logic within separate CellController implementations, we achieve better code organization and maintainability.
By using this method with switch cases, we centralize the configuration of cell types in one place, making it easier to manage and extend the functionality of our table and collection views. Additionally, this approach promotes scalability and flexibility, allowing for seamless integration of new cell types without disrupting existing code.
In summary, adopting this approach simplifies the process of handling multiple cell types and sections in UITableView and UICollectionView, improves code maintainability, and adheres to SOLID principles. It provides a clean and modular solution, enabling developers to efficiently manage and extend the functionality of their views.



