//
//  HomeScreen.swift
//  WeatherApp
//
//  Created by Mina on 17/05/2024.
//

import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        let hour = Calendar.current.component(.hour, from: Date())
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        NavigationView {
            VStack {
                
                
                Text("Cairo")
                    .bold()
                    .font(.system(size: 50))
                Text("16°")
                    .bold()
                    .font(.system(size: 50))
                Text("Partly Cloudy")
                HStack {
                    Text("H: 20°")
                    Text("L: 12°")
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
                            
                            Text("⛅️")
                            
                            Text("20°")
                            
                            Spacer()
                            Text("Mostly Cloudy")
                                .font(.system(size: 14))
                        }
                        .font(.system(size: 24))
                        
                    }
                    .listRowBackground(Color.white.opacity(0.3))
                    
                    NavigationLink(destination: DetailsScreen()) {
                        HStack(alignment: .center, spacing: nil) {
                            Text("Today")
                            
                            Text("⛅️")
                            
                            Text("20°")
                            
                            Spacer()
                            Text("Mostly Cloudy")
                                .font(.system(size: 14))
                        }
                        .font(.system(size: 24))
                        
                    }
                    .listRowBackground(Color.white.opacity(0.3))
                    NavigationLink(destination: DetailsScreen()) {
                        HStack(alignment: .center, spacing: nil) {
                            Text("Today")
                            
                            Text("⛅️")
                            
                            Text("20°")
                            
                            Spacer()
                            Text("Mostly Cloudy")
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
                        Text("10 KM")
                            .font(.largeTitle)
                    }
                    VStack {
                        Text("HUMIDITY")
                            .font(.title3)
                            .foregroundColor(.gray)
                        Text("36%")
                            .font(.largeTitle)
                    }
                    VStack {
                        Text("FEELS LIKE")
                            .font(.title3)
                            .foregroundColor(.gray)
                        Text("16°")
                            .font(.largeTitle)
                    }
                    VStack {
                        Text("PRESSURE")
                            .font(.title3)
                            .foregroundColor(.gray)
                        Text("1,021")
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
    }
    
}


#Preview {
    HomeScreen()
}
