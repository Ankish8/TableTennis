//
//  SettingsView.swift
//  TableTennis WatchKit Extension
//
//  Created by Ankish Khatri on 28/05/21.
//

import SwiftUI
import HealthKit

struct SettingsView: View {

    @EnvironmentObject var tennisViewModel: TennisViewModel
    @State var sliderValue: Double = 3
    //HealthKit
    private var healthStore = HKHealthStore()
        let heartRateQuantity = HKUnit(from: "count/min")
    @State private var value = 0

    var body: some View {
        VStack {
            List {
                Picker(selection: $tennisViewModel.maxPoints, label: Text("Match Points")) {
                    Text("11").tag(11)
                    Text("21").tag(21)
                    
                }
                Picker(selection: $tennisViewModel.playerName1, label: Text("Player 1"), content: {
                    Text("Ankish").tag("Ankish")
                    Text("Somu").tag("Somu")
                    Text("Swati").tag("Swati")
                    Text("Papaji").tag("Papaji")
                })
                Picker(selection: $tennisViewModel.playerName2, label: Text("Player 2"), content: {
                    Text("Ankish").tag("Ankish")
                    Text("Somu").tag("Somu")
                    Text("Swati").tag("Swati")
                    Text("Papaji").tag("Papaji")
                })
                Text("BPM is \(value)")
                
                
            }
        }
        .onAppear(perform: {
            start()
        })
        
    }
    func start() {
            autorizeHealthKit()
            startHeartRateQuery(quantityTypeIdentifier: .heartRate)
        }
        
        func autorizeHealthKit() {
            let healthKitTypes: Set = [
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!]

            healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { _, _ in }
        }
        
        private func startHeartRateQuery(quantityTypeIdentifier: HKQuantityTypeIdentifier) {
            
            // 1
            let devicePredicate = HKQuery.predicateForObjects(from: [HKDevice.local()])
            // 2
            let updateHandler: (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void = {
                query, samples, deletedObjects, queryAnchor, error in
                
                // 3
            guard let samples = samples as? [HKQuantitySample] else {
                return
            }
                
            self.process(samples, type: quantityTypeIdentifier)

            }
            
            // 4
            let query = HKAnchoredObjectQuery(type: HKObjectType.quantityType(forIdentifier: quantityTypeIdentifier)!, predicate: devicePredicate, anchor: nil, limit: HKObjectQueryNoLimit, resultsHandler: updateHandler)
            
            query.updateHandler = updateHandler
            
            // 5
            
            healthStore.execute(query)
        }
        
        private func process(_ samples: [HKQuantitySample], type: HKQuantityTypeIdentifier) {
            var lastHeartRate = 0.0
            
            for sample in samples {
                if type == .heartRate {
                    lastHeartRate = sample.quantity.doubleValue(for: heartRateQuantity)
                }
                
                self.value = Int(lastHeartRate)
            }
        }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(TennisViewModel())
    }
}
