
import SwiftUI

struct TabBarContainerView: View {
    @State private var selectedTab = 0
    @Namespace private var animation
    
    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationStack {
                Group {
                    switch selectedTab {
                    case 0:
                        HomeView()
                    case 1:
                        FeatureView()
                            // 🔧 优化：统一标题配置方式
                            .navigationBarTitleDisplayMode(.large)
                            .toolbar {
                                ToolbarItem(placement: .principal) {
                                    Text("功能页面")
                                        .font(.system(size: 18, weight: .semibold))
                                }
                            }
                    case 2:
                        ProfileView()
                            .navigationBarTitleDisplayMode(.large)
                            .toolbar {
                                ToolbarItem(placement: .principal) {
                                    Text("个人中心")
                                        .font(.system(size: 18, weight: .semibold))
                                }
                            }
                    default:
                        HomeView()
                    }
                }
                .toolbarBackground(.hidden, for: .navigationBar)
                .toolbarColorScheme(.light, for: .navigationBar)
            }
            
            CustomTabBar(
                selectedTab: $selectedTab,
                animation: animation
            )
        }
        .ignoresSafeArea(edges: .bottom)
    }
}
