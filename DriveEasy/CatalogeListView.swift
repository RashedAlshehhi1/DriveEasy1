import SwiftUI

// MARK: - Data Model for Catalog
struct CatalogVehicle: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let price: Int
    let rating: Double
    let reviewCount: Int
    let isFavorite: Bool
}

struct CatalogeListView: View {
    // MARK: - State Properties
    @Binding var selectedTab: Int // Connects to MainTabView
    
    @State private var searchText = ""
    @State private var selectedCategory = "All"
    
    let categories = ["All", "Economy", "Sedan", "SUV", "Luxury"]
    
    @State private var vehicles = [
        CatalogVehicle(name: "Volkswagen Polo", category: "Economy", price: 45, rating: 4.5, reviewCount: 120, isFavorite: true),
        CatalogVehicle(name: "Ford Fiesta", category: "Economy", price: 40, rating: 4.2, reviewCount: 85, isFavorite: false),
        CatalogVehicle(name: "Honda Civic", category: "Sedan", price: 60, rating: 4.8, reviewCount: 210, isFavorite: false),
        CatalogVehicle(name: "Toyota RAV4", category: "SUV", price: 80, rating: 4.7, reviewCount: 150, isFavorite: true)
    ]
    
    var filteredVehicles: [CatalogVehicle] {
        if selectedCategory == "All" {
            return vehicles
        } else {
            return vehicles.filter { $0.category == selectedCategory }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                // MARK: - Custom Navigation Bar
                HStack {
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .foregroundColor(.primary)
                    }
                    Spacer()
                    Text("Catalog")
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "slider.horizontal.3")
                            .font(.title3)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                .padding(.bottom, 15)
                
                // MARK: - Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search vehicles...", text: $searchText)
                }
                .padding(10)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                
                // MARK: - Horizontal Category Filters
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(categories, id: \.self) { category in
                            Button(action: {
                                selectedCategory = category
                            }) {
                                Text(category)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 8)
                                    .background(selectedCategory == category ? Color.blue : Color(UIColor.systemGray6))
                                    .foregroundColor(selectedCategory == category ? .white : .primary)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 15)
                }
                
                // MARK: - Vehicle List
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 16) {
                        ForEach(filteredVehicles) { vehicle in
                            NavigationLink(destination: VehicleDetailsView(vehicle: vehicle)) {
                                VehicleRowView(vehicle: vehicle)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
                
                // MARK: - Active Tab Bar
                Divider()
                HStack {
                    Button(action: { selectedTab = 0 }) {
                        TabBarIcon(iconName: "house.fill", label: "Home", isActive: selectedTab == 0)
                    }
                    Spacer()
                    Button(action: { selectedTab = 1 }) {
                        TabBarIcon(iconName: "list.bullet.rectangle.portrait", label: "Catalog", isActive: selectedTab == 1)
                    }
                    Spacer()
                    Button(action: {}) {
                        TabBarIcon(iconName: "magnifyingglass", label: "Search", isActive: false)
                    }
                    Spacer()
                    Button(action: {}) {
                        TabBarIcon(iconName: "person", label: "Profile", isActive: false)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 10)
                .padding(.bottom, 5)
                .background(Color(UIColor.systemBackground))
            }
            .navigationBarHidden(true)
        }
    }
    
    // MARK: - Vehicle Row Component
    struct VehicleRowView: View {
        let vehicle: CatalogVehicle
        
        var body: some View {
            HStack(spacing: 15) {
                Rectangle()
                    .fill(Color(UIColor.systemGray5))
                    .frame(width: 110, height: 80)
                    .cornerRadius(10)
                    .overlay(
                        Image(systemName: "car.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .foregroundColor(.gray)
                    )
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(vehicle.name)
                        .font(.headline)
                        .lineLimit(1)
                    
                    Text(vehicle.category)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(.yellow)
                        Text(String(format: "%.1f", vehicle.rating))
                            .font(.caption)
                            .fontWeight(.bold)
                        Text("(\(vehicle.reviewCount))")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Text("$\(vehicle.price) / day")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                VStack {
                    Button(action: {}) {
                        Image(systemName: vehicle.isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(vehicle.isFavorite ? .red : .gray)
                            .font(.title3)
                    }
                    Spacer()
                }
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
        }
    }
    
    struct CatalogeListView_Previews: PreviewProvider {
        static var previews: some View {
            CatalogeListView(selectedTab: .constant(1))
        }
    }
}
