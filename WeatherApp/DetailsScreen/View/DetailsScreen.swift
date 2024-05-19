//
//  DetailsScreen.swift
//  WeatherApp
//
//  Created by Mina on 17/05/2024.
//

import SwiftUI

struct DetailsScreen: View {
    var detailsViewModel: DetailsViewModel?
    var body: some View {
        
        let hour = Calendar.current.component(.hour, from: Date())
        VStack {
            if let hours = detailsViewModel?.getHours().hour {
                
                List(filterHours(hours: hours)) { item in
                    HourlyRow(hour: item)
                        .listRowBackground(Color.white.opacity(0.2))
                    
                }
                
                .contentMargins(.vertical, 0)
                .scrollContentBackground(.hidden)
            }
        }.background {
            Image(hour > 6 && hour < 18 ? .day : .night)
        }.foregroundColor(hour > 6 && hour < 18 ? .black : .white)
            .onAppear {
                print("jaja")
                print(detailsViewModel?.getHours().hour.count ?? 0)
            }
        
    }
//    func filterHours(hours: [Hour]) -> [Hour] {
//        let formatter = DateFormatter()
//            formatter.dateFormat = "yyyy-MM-dd HH:mm"
//        let filteredHours = hours.filter {
//            formatter.date(from: $0.time ?? "") ?? Date()   >= Date()
//            
//        }
//        
//        return filteredHours
//    }
}

#Preview {
    DetailsScreen(detailsViewModel: nil)
}
func filterHours(hours: [Hour]) -> [Hour] {
    // Create and configure the DateFormatter
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm"
    
    // Get the current date and time
    let now = Date()
    
    // Calculate the start of the next hour
    let calendar = Calendar.current
    if let nextHour = calendar.date(byAdding: .hour, value: 0, to: calendar.startOfHour(for: now)) {
        // Filter the hours
        let filteredHours = hours.filter {
            guard let timeString = $0.time, let hourDate = formatter.date(from: timeString) else {
                return false
            }
            return hourDate >= nextHour
        }
        
        return filteredHours
    } else {
        // In case of any issues calculating the next hour, return an empty array
        return []
    }
}

extension Calendar {
    func startOfHour(for date: Date) -> Date {
        return self.date(from: self.dateComponents([.year, .month, .day, .hour], from: date))!
    }
}
