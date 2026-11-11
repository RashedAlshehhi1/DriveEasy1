//
//  VehicleDetailsView.swift
//  H00445096_FinalProject
//
//  Created by Rashid Alshehhi on 11/11/2026.
//
import SwiftUI

struct VehicleDetailsView: View {
    // Dismiss action to go back to the previous screen
    @Environment(\.dismiss) var dismiss
    
    // We pass the vehicle data into this view
    let vehicle: CatalogVehicle
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // MARK: - Custom Header & Hero Image
                    ZStack(alignment: .top) {
                        // Placeholder for the large car image
                        Rectangle()
                            .fill(Color(UIColor.systemGray5))
                            .frame(height: 300)
                            .overlay(
                                Image(systemName: "car.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150)
                                    .foregroundColor(.gray)
                            )
                        
                        // Custom Navigation Buttons
                        HStack {
                            Button(action: {
                                dismiss()
                            }) {
                                Image(systemName: "chevron.left")
                                    .font(.title3)
                                    .padding(12)
                                    .background(Color(UIColor.systemBackground))
                                    .clipShape(Circle())
                                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                // Favorite action
                            }) {
                                Image(systemName: vehicle.isFavorite ? "heart.fill" : "heart")
                                    .font(.title3)
                                    .foregroundColor(vehicle.isFavorite ? .red : .gray)
                                    .padding(12)
                                    .background(Color(UIColor.systemBackground))
                                    .clipShape(Circle())
                                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 50) // Adjust for safe area
                    }
                    .ignoresSafeArea(edges: .top)
                    
                    // MARK: - Vehicle Title & Rating
                    VStack(alignment: .leading, spacing: 8) {
                        Text(vehicle.name)
                            .font(.system(size: 28, weight: .bold))
                        
                        Text(vehicle.category)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(String(format: "%.1f", vehicle.rating))
                                .fontWeight(.bold)
                            Text("(\(vehicle.reviewCount) reviews)")
                                .foregroundColor(.gray)
                        }
                        .font(.subheadline)
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Key Specifications
                    HStack(spacing: 15) {
                        SpecCard(icon: "person.2.fill", title: "5 Seats")
                        SpecCard(icon: "fuelpump.fill", title: "Petrol")
                        SpecCard(icon: "gearshift.layout.sixspeed", title: "Auto")
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Description
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Description")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text("Experience the perfect blend of comfort and performance with the \(vehicle.name). Ideal for both city driving and long road trips, this vehicle offers top-tier fuel efficiency and advanced safety features.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .lineSpacing(4)
                    }
                    .padding(.horizontal)
                    
                    // Extra space at the bottom so content isn't hidden behind the fixed checkout bar
                    Spacer().frame(height: 100)
                }
            }
            .ignoresSafeArea(edges: .top)
            
            // MARK: - Fixed Bottom Checkout Bar
            VStack {
                Divider()
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Total Price")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("$\(vehicle.price)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        Text(" / day")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Action to navigate to the Checkout Screen
                    }) {
                        Text("Book Now")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 15)
                            .background(Color.blue)
                            .cornerRadius(12)
                            .shadow(color: Color.blue.opacity(0.3), radius: 5, x: 0, y: 3)
                    }
                }
                .padding(.horizontal, 25)
                .padding(.vertical, 15)
                .background(Color(UIColor.systemBackground))
            }
        }
        .navigationBarHidden(true) // We use our custom back button instead
    }
}

// MARK: - Helper Component for Specs
struct SpecCard: View {
    let icon: String
    let title: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.blue)
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 15)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(12)
    }
}

// MARK: - Preview
struct VehicleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        // Passing sample data to make the preview work
        VehicleDetailsView(vehicle: CatalogVehicle(
            name: "Volkswagen Polo",
            category: "Economy",
            price: 45,
            rating: 4.5,
            reviewCount: 120,
            isFavorite: true
        ))
    }
}
