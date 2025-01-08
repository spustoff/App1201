//
//  ExpensesViewModel.swift
//  App1201
//
//  Created by IGOR on 27/12/2024.
//

import SwiftUI
import CoreData

final class ExpensesViewModel: ObservableObject {

    @AppStorage("genService") var genService: String = ""
    @AppStorage("genRepair") var genRepair: String = ""
    @AppStorage("genFin") var genFin: String = ""
    
    @Published var addGenSer: String = ""
    @Published var addGenRep: String = ""
    @Published var addGenFin: String = ""
    
    @Published var types: [String] = ["Service", "Repair", "Fines"]
    @Published var currType: String = ""

    @Published var colors: [String] = ["bc", "wc", "gc", "bluc", "rc", "fc"]
    @Published var ccars: [String] = ["bc", "wc", "gc", "bluc", "rc", "fc"]
    @Published var curColor: String = ""
    @Published var curCar: String = ""

    @Published var isAdd: Bool = false
    @Published var isAddGeneral: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false

    @Published var exName: String = ""
    @Published var exType: String = ""
    @Published var exAmount: String = ""

    @Published var expenses: [ExpenModel] = []
    @Published var selectedExp: ExpenModel?

    func addExp() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ExpenModel", into: context) as! ExpenModel

        loan.exName = exName
        loan.exType = exType
        loan.exAmount = exAmount

        CoreDataStack.shared.saveContext()
    }

    func fetchExps() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ExpenModel>(entityName: "ExpenModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.expenses = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.expenses = []
        }
    }
}
