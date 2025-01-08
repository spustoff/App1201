//
//  CarsViewModel.swift
//  App1201
//
//  Created by IGOR on 27/12/2024.
//

import SwiftUI
import CoreData

final class CarsViewModel: ObservableObject {

    @Published var colors: [String] = ["bc", "wc", "gc", "bluc", "rc", "fc"]
    @Published var ccars: [String] = ["bc", "wc", "gc", "bluc", "rc", "fc"]
    @Published var curColor: String = ""
    @Published var curCar: String = ""

    @Published var isAdd: Bool = false
    @Published var isAddDream: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDeleteDream: Bool = false

    @Published var cModel: String = ""
    @Published var cChar: String = ""
    @Published var cMil: String = ""
    @Published var cCol: String = ""

    @Published var cars: [CarsModel] = []
    @Published var selectedCar: CarsModel?

    func addCar() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CarsModel", into: context) as! CarsModel

        loan.cModel = cModel
        loan.cChar = cChar
        loan.cMil = cMil
        loan.cCol = cCol

        CoreDataStack.shared.saveContext()
    }

    func fetchCars() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CarsModel>(entityName: "CarsModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.cars = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.cars = []
        }
    }

    @Published var dcModel: String = ""
    @Published var dcChar: String = ""
    @Published var dcMil: String = ""
    @Published var dcCol: String = ""

    @Published var dreamcars: [DreamsCarModel] = []
    @Published var selectedDreamcar: DreamsCarModel?

    func addDreamcar() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "DreamsCarModel", into: context) as! DreamsCarModel

        loan.dcModel = dcModel
        loan.dcChar = dcChar
        loan.dcMil = dcMil
        loan.dcCol = dcCol

        CoreDataStack.shared.saveContext()
    }

    func fetchDreamcars() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<DreamsCarModel>(entityName: "DreamsCarModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.dreamcars = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.dreamcars = []
        }
    }
}
