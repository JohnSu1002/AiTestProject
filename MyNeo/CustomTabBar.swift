import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    var animation: Namespace.ID
    @State private var tabItems = [
        TabItem(title: "首页", icon: "house.fill", tag: 0),
        TabItem(title: "功能", icon: "square.grid.2x2", tag: 1),
        TabItem(title: "我的", icon: "person.circle.fill", tag: 2)
    ]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabItems) { tab in
                ModernTabButton(
                    tab: tab,
                    selectedTab: $selectedTab,
                    animation: animation
                )
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            // 调整为半透明背景，与页面内容更好融合
            RoundedRectangle(cornerRadius: 30)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                )
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 2)
        )
        .padding(.horizontal, 20)
        .padding(.bottom, 8)
    }
}
