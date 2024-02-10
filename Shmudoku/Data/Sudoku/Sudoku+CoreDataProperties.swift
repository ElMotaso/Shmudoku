import Foundation
import CoreData


extension Sudoku {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sudoku> {
        return NSFetchRequest<Sudoku>(entityName: "Sudoku")
    }

    @NSManaged public var initialGrid: [[Int]]
    @NSManaged public var workingGrid: [[Int]]
    @NSManaged public var solvedGrid: [[Int]]
    @NSManaged public var commentGrid: [[[Bool]]]
    @NSManaged public var secondsElapsed: Int
}

extension Sudoku : Identifiable {

}




