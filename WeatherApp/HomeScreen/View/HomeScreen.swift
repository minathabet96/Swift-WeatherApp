//
//  HomeScreen.swift
//  WeatherApp
//
//  Created by Mina on 17/05/2024.
//
import Kingfisher
import SwiftUI

struct HomeScreen: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        
        let hour = Calendar.current.component(.hour, from: Date())
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        ZStack {
            
            NavigationView {
                
                VStack {
                    
                    
                    
                    
                    
                    Text("\(viewModel.response?.location.name ?? "Unknown")")
                        .bold()
                        .font(.system(size: 45))
                    Text("\(String(format: "%.1f",viewModel.response?.current.tempC ?? 0))°")
                        .bold()
                        .font(.system(size: 50))
                    Text("\(viewModel.response?.current.condition.text ?? "Unknown")")
                    HStack {
                        let high = String(format: "%.1f", viewModel.response?.forecast.forecastday[0].day.maxtempC ?? 0)
                        let low = String(format: "%.1f", viewModel.response?.forecast.forecastday[0].day.mintempC ?? 0)
                        Text("H: \(high)°")
                        Text("L: \(low)°")
                    }
                    KFImage.url(URL(string: "https:\(viewModel.response?.current.condition.icon ?? "⛅️")"))
                    
//                    Text("⛅️")
//                        .font(.system(size: 100))
                    Spacer()
                    Text("3-DAY FORECAST")
                        .offset(x: -110, y: 8)
                        .font(.subheadline)
                    List {
                        if let forecast = viewModel.response?.forecast.forecastday.first {
                            let det = DetailsViewModel(forecast: forecast)
                            
                            NavigationLink(destination: DetailsScreen(detailsViewModel: det)) {
                                HStack(alignment: .center, spacing: nil) {
                                    Text("Today")
                                        .font(.custom("Menlo", size: 26))
                                    KFImage.url(URL(string: "https:\(viewModel.response?.forecast.forecastday[0].day.condition?.icon ?? "⛅️")"))
                                        .frame(width: 50, height: 37, alignment: .center)
                                    
                                    let avg = String(format: "%.1f", viewModel.response?.forecast.forecastday[0].day.avgtempC ?? 0)
                                    Text("\(avg)°")
                                    
                                    Spacer()
                                    Text("\(viewModel.response?.forecast.forecastday[0].day.condition?.text ?? "Unknown")")
                                        .font(.system(size: 14))
                                }
                                .font(.system(size: 24))
                                
                            }
                            .listRowBackground(Color.white.opacity(0.3))
                        }
                        if let forecast = viewModel.response?.forecast.forecastday[1] {
                            let det = DetailsViewModel(forecast: forecast)
                            NavigationLink(destination: DetailsScreen(detailsViewModel: det)) {
                                HStack(alignment: .center, spacing: nil) {
                                    Text("\(viewModel.dayName(from: viewModel.day2 ?? "2024-05-18").prefix(3))")
                                        .font(.custom("Menlo", size: 26))
                                    
                                    KFImage.url(URL(string: "https:\(viewModel.response?.forecast.forecastday[1].day.condition?.icon ?? "⛅️")"))
                                        .frame(width: 50, height: 37, alignment: .center)
                                        .padding(.leading, 30)
                                    let avg = String(format: "%.1f", viewModel.response?.forecast.forecastday[1].day.avgtempC ?? 0)
                                    Text("\(avg)°")
                                    
                                    Spacer()
                                    Text("\(viewModel.response?.forecast.forecastday[1].day.condition?.text ?? "Unknown")")
                                        .font(.system(size: 14))
                                }
                                .font(.system(size: 24))
                                
                            }
                            .listRowBackground(Color.white.opacity(0.3))
                        }
                        if let forecast = viewModel.response?.forecast.forecastday[2] {
                            let det = DetailsViewModel(forecast: forecast)
                            NavigationLink(destination: DetailsScreen(detailsViewModel: det)) {
                                HStack(alignment: .center, spacing: nil) {
                                    Text("\(viewModel.dayName(from: viewModel.day3 ?? "2024-05-18").prefix(3))")
                                        .font(.custom("Menlo", size: 26))
                                    KFImage.url(URL(string: "https:\(viewModel.response?.forecast.forecastday[2].day.condition?.icon ?? "⛅️")"))
                                        .frame(width: 50, height: 37, alignment: .center)
                                        .padding(.leading, 30)
                                    let avg = String(format: "%.1f", viewModel.response?.forecast.forecastday[2].day.avgtempC ?? 0)
                                    Text("\(avg)°")
                                    
                                    Spacer()
                                    Text("\(viewModel.response?.forecast.forecastday[2].day.condition?.text ?? "Unknown")")
                                        .font(.system(size: 14))
                                }
                                .font(.system(size: 24))
                                
                            }
                            .listRowBackground(Color.white.opacity(0.3))
                        }
                    }
                    
                    .contentMargins(.vertical, 0)
                    .scrollContentBackground(.hidden)
                    
                    LazyVGrid(columns: columns, spacing: 40) {
                        VStack {
                            Text("VISIBILITY")
                                .font(.title3)
                                .foregroundColor(.gray)
                            Text("\(String(format: "%.0f", viewModel.response?.current.visKM ?? 0)) KM")
                                .font(.largeTitle)
                        }
                        VStack {
                            Text("HUMIDITY")
                                .font(.title3)
                                .foregroundColor(.gray)
                            Text("\(String(format: "%.0f", viewModel.response?.current.humidity ?? 0))%")
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
            if viewModel.isLoading {
                LoadingView()
            }
            if viewModel.failed {
                FailureView()
            }
        }
            
            .onAppear {
                viewModel.showLoading()
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
