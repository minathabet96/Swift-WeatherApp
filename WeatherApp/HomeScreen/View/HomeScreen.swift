//
//  HomeScreen.swift
//  WeatherApp
//
//  Created by Mina on 17/05/2024.
//

import SwiftUI
import Alamofire

struct HomeScreen: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        
        let hour = Calendar.current.component(.hour, from: Date())
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        NavigationView {
            VStack {
                
                
                
                Text("\(viewModel.response?.location.name ?? "Unknown")")
                    .bold()
                    .font(.system(size: 50))
                Text("\(viewModel.response?.current.tempC ?? 0)°")
                    .bold()
                    .font(.system(size: 50))
                Text("\(viewModel.response?.current.condition.text.rawValue ?? "Unknown")")
                HStack {
                    let high = String(format: "%.1f", viewModel.response?.forecast.forecastday[0].day.maxtempC ?? 0)
                    let low = String(format: "%.1f", viewModel.response?.forecast.forecastday[0].day.mintempC ?? 0)
                    Text("H: \(high)°")
                    Text("L: \(low)°")
                }
                Text("⛅️")
                    .font(.system(size: 100))
                Spacer()
                Text("3-DAY FORECAST")
                    .offset(x: -110, y: 8)
                    .font(.subheadline)
                List {
                    NavigationLink(destination: DetailsScreen()) {
                        HStack(alignment: .center, spacing: nil) {
                            Text("Today")
                                .font(.custom("Menlo", size: 26))
                            Text("⛅️")
                            
                            let avg = String(format: "%.1f", viewModel.response?.forecast.forecastday[0].day.avgtempC ?? 0)
                            Text("\(avg)°")
                            
                            Spacer()
                            Text("\(viewModel.response?.forecast.forecastday[0].day.condition.text.rawValue ?? "Unknown")")
                                .font(.system(size: 14))
                        }
                        .font(.system(size: 24))
                        
                    }
                    .listRowBackground(Color.white.opacity(0.3))
                    
                    NavigationLink(destination: DetailsScreen()) {
                        HStack(alignment: .center, spacing: nil) {
                            Text("\(viewModel.dayName(from: viewModel.day2 ?? "2024-05-18").prefix(3))")
                                .font(.custom("Menlo", size: 26))
                            
                            Text("⛅️")
                                .padding(.leading, 30)
                            let avg = String(format: "%.1f", viewModel.response?.forecast.forecastday[1].day.avgtempC ?? 0)
                            Text("\(avg)°")
                            
                            Spacer()
                            Text("\(viewModel.response?.forecast.forecastday[1].day.condition.text.rawValue ?? "Unknown")")
                                .font(.system(size: 14))
                        }
                        .font(.system(size: 24))
                        
                    }
                    .listRowBackground(Color.white.opacity(0.3))
                    NavigationLink(destination: DetailsScreen()) {
                        HStack(alignment: .center, spacing: nil) {
                            Text("\(viewModel.dayName(from: viewModel.day3 ?? "2024-05-18").prefix(3))")
                                .font(.custom("Menlo", size: 26))
                            Text("⛅️")
                                .padding(.leading, 30)
                            let avg = String(format: "%.1f", viewModel.response?.forecast.forecastday[2].day.avgtempC ?? 0)
                            Text("\(avg)°")
                            
                            Spacer()
                            Text("\(viewModel.response?.forecast.forecastday[2].day.condition.text.rawValue ?? "Unknown")")
                                .font(.system(size: 14))
                        }
                        .font(.system(size: 24))
                        
                    }
                    .listRowBackground(Color.white.opacity(0.3))
                }
                
                .contentMargins(.vertical, 0)
                .scrollContentBackground(.hidden)
                
                LazyVGrid(columns: columns, spacing: 40) {
                    VStack {
                        Text("VISIBILITY")
                            .font(.title3)
                            .foregroundColor(.gray)
                        Text("\(viewModel.response?.current.visKM ?? 0) KM")
                            .font(.largeTitle)
                    }
                    VStack {
                        Text("HUMIDITY")
                            .font(.title3)
                            .foregroundColor(.gray)
                        Text("\(viewModel.response?.current.humidity ?? 0)%")
                            .font(.largeTitle)
                    }
                    VStack {
                        Text("FEELS LIKE")
                            .font(.title3)
                            .foregroundColor(.gray)
                        let feelsLike = String(format: "%.1f", viewModel.response?.current.feelslikeC ?? 0)
                        Text("\(feelsLike)°")
                            .font(.largeTitle)
                    }
                    VStack {
                        Text("PRESSURE")
                            .font(.title3)
                            .foregroundColor(.gray)
                        Text("\(viewModel.response?.current.pressureMB ?? 0)")
                            .font(.largeTitle)
                    }
                }
                .padding()
                .padding()
                
                
                
            }.background {
                Image(hour > 6 && hour < 18 ? .day : .night)
            }.foregroundColor(hour > 6 && hour < 18 ? .black : .white)
                .font(.largeTitle)
            
        }
        
        .onAppear {
            if let location = locationManager.location {
                viewModel.fetchData(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
            }
        }
        .onChange(of: locationManager.location) { newLocation in
                    if let location = newLocation {
                        viewModel.fetchData(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
                    }
                }
    }
}



#Preview {
    HomeScreen()
}
