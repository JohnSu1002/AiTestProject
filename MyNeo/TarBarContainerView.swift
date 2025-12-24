import SwiftUI

struct TabBarContainerView: View {
    @State private var selectedTab = 0
    @Namespace private var animation
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // 内容区域
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                FeatureView()
                    .tag(1)
                SearchView()
                    .tag(2)
                ProfileView()
                    .tag(3)
            }
            
            // 自定义TabBar
            HStack(spacing: 0) {
                ForEach(tabItems) { tab in
                    TabBarButton(
                        tab: tab,
                        selectedTab: $selectedTab,
                        animation: animation
                    )
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 30)
                                        .fill(.ultraThinMaterial)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                        )
                                        .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: -5)
            )
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

// TabBar 数据模型
struct TabItem: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let tag: Int
}

let tabItems = [
    TabItem(title: "首页", icon: "house.fill", tag: 0),
    TabItem(title: "功能", icon: "square.grid.2x2", tag: 1),
    TabItem(title: "搜索", icon: "square.grid.2x2", tag: 2),
    TabItem(title: "我的", icon: "person.circle.fill", tag: 3)
]

// 自定义TabBar按钮
struct TabBarButton: View {
    let tab: TabItem
    @Binding var selectedTab: Int
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                selectedTab = tab.tag
            }
        }) {
            VStack(spacing: 4) {
                ZStack {
                    if selectedTab == tab.tag {
                        Circle()
                            .fill(Color.blue.gradient)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .frame(width: 40, height: 40)
                    }
                    
                    Image(systemName: tab.icon)
                        .font(.system(size: selectedTab == tab.tag ? 18 : 20))
                        .foregroundColor(selectedTab == tab.tag ? .white : .gray)
                        .scaleEffect(selectedTab == tab.tag ? 1.1 : 1.0)
                }
                .frame(height: 40)
                
                Text(tab.title)
                    .font(.system(size: 12, weight: selectedTab == tab.tag ? .semibold : .medium))
                    .foregroundColor(selectedTab == tab.tag ? .blue : .gray)
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    TabBarContainerView()
}
