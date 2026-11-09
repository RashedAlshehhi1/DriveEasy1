//
//  HomeMapView.swift
//  DriveEasy
//
//  Created by Rashid Alshehhi.
//

import SwiftUI
import MapKit

// MARK: - Data Model for Map Pins
struct VehicleLocation: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct HomeMapView: View {
    // MARK: - State Properties
    // iOS 17+ Map Camera Position centered on Sharjah/Dubai area
    @State private var position: MapCameraPosition = .region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 25.3463, longitude: 55.4209),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    ))
    
    @State private var searchText = ""
    
    // Sample map pins
    let availableVehicles = [
        VehicleLocation(name: "chevrolet silverado", coordinate: CLLocationCoordinate2D(latitude: 25.3463, longitude: 55.4209)),
        VehicleLocation(name: "Nissan", coordinate: CLLocationCoordinate2D(latitude: 25.3500, longitude: 55.4100)),
        VehicleLocation(name: "Civic", coordinate: CLLocationCoordinate2D(latitude: 25.3400, longitude: 55.4300))
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            // MARK: - Background Map (iOS 17+)
            Map(position: $position) {
                ForEach(availableVehicles) { vehicle in
                    Annotation(vehicle.name, coordinate: vehicle.coordinate) {
                        Image(systemName: "car.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                            .background(Circle().fill(Color.white))
                            .shadow(radius: 3)
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
            
            // MARK: - Top Overlays (Header & Search)
            VStack {
                // Custom Navigation Bar
                HStack {
                    Button(action: {
                        // Menu action
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    Spacer()
                    Text("DriveEasy")
                        .font(.headline)
                    Spacer()
                    Button(action: {
                        // Notifications action
                    }) {
                        Image(systemName: "bell")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Search & Filter Bar
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search location or car", text: $searchText)
                    }
                    .padding(10)
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(8)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                    
                    Button(action: {
                        // Filter action
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .padding(10)
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(8)
                            .foregroundColor(.primary)
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 5)
                
                Spacer()
            }
            
            // MARK: - Bottom Vehicle Preview Card & Tab Bar
            VStack(spacing: 0) {
                // Vehicle Quick Preview
                HStack(alignment: .center, spacing: 15) {
                    // Placeholder for vehicle image
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 100, height: 70)
                        .cornerRadius(8)
                        .overlay(
                            Image(systemName: "car.fill")
                                .foregroundColor(.gray)
                        )
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Volkswagen Polo")
                            .font(.headline)
                        
                        HStack(spacing: 2) {
                            ForEach(0..<5) { _ in
                                Image(systemName: "star.fill")
                                    .font(.caption)
                                    .foregroundColor(.yellow)
                            }
                            Text("(9)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Text("$45 / day")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Action to navigate to details or checkout
                    }) {
                        Text("Book")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                }
                .padding()
                .background(Color(UIColor.systemBackground))
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: -2)
                .padding(.horizontal)
                .padding(.bottom, 20)
                
                // MARK: - Mock Tab Bar
                Divider()
                HStack {
                    TabBarIcon(iconName: "house.fill", label: "Home", isActive: true)
                    Spacer()
                    TabBarIcon(iconName: "list.bullet.rectangle.portrait", label: "Bookings", isActive: false)
                    Spacer()
                    TabBarIcon(iconName: "magnifyingglass", label: "Search", isActive: false)
                    Spacer()
                    TabBarIcon(iconName: "person", label: "Profile", isActive: false)
                }
                .padding(.horizontal, 30)
                .padding(.top, 10)
                .padding(.bottom, 5)
                .background(Color(UIColor.systemBackground))
            }
        }
    }
}

// MARK: - Helper View for Tab Bar Icons
struct TabBarIcon: View {
    let iconName: String
    let label: String
    let isActive: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: iconName)
                .font(.system(size: 24))
                .foregroundColor(isActive ? .blue : .gray)
            Text(label)
                .font(.caption2)
                .foregroundColor(isActive ? .blue : .gray)
        }
    }
}

// MARK: - Preview
struct HomeMapView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMapView()
    }
}
