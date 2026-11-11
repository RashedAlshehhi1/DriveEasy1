import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(spacing: 0) {
            if selectedTab == 0 {
                HomeView(selectedTab: $selectedTab)
            } else if selectedTab == 1 {
                CatalogeListView(selectedTab: $selectedTab)
            }
        }
    }
}

#Preview {
    MainTabView()
}
