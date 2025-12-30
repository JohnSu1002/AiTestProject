import SwiftUI

struct ModernTabButton: View {
    let tab: TabItem
    @Binding var selectedTab: Int
    var animation: Namespace.ID
    @State private var isPressed = false
    
    private var isSelected: Bool {
        selectedTab == tab.tag
    }
    
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                selectedTab = tab.tag
            }
            // 触感反馈
            let impact = UIImpactFeedbackGenerator(style: .light)
            impact.impactOccurred()
        }) {
            VStack(spacing: 6) {
                // 图标容器 - 动态渐变
                ZStack {
                    if isSelected {
                        Circle()
                            .fill(selectedGradient)
                            .matchedGeometryEffect(id: "TAB_\(tab.tag)", in: animation)
                            .frame(width: 42, height: 42)
                            .shadow(
                                color: tabColor.opacity(0.4),
                                radius: 8,
                                x: 0,
                                y: 3
                            )
                    } else {
                        Circle()
                            .fill(Color.clear)
                            .frame(width: 42, height: 42)
                    }
                    
                    Image(systemName: tab.icon)
                        .font(.system(size: isSelected ? 20 : 18, weight: .medium))
                        .foregroundColor(isSelected ? .white : .secondary)
                        .scaleEffect(isSelected ? 1.15 : 1.0)
                }
                .frame(height: 42)
                
                // 标题文字 - 动态字体
                Text(tab.title)
                    .font(.system(
                        size: isSelected ? 13 : 12,
                        weight: isSelected ? .semibold : .medium
                    ))
                    .foregroundColor(isSelected ? tabColor : .secondary)
                    .scaleEffect(isSelected ? 1.05 : 1.0)
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(ScaleButtonStyle(isPressed: $isPressed))
        .scaleEffect(isPressed ? 0.92 : 1.0)
    }
    
    // 根据标签返回不同的渐变颜色
    private var selectedGradient: LinearGradient {
        LinearGradient(
            colors: gradientColors,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    private var gradientColors: [Color] {
        switch tab.tag {
        case 0: return [.blue, .purple]      // 首页 - 蓝紫色
        case 1: return [.green, .teal]       // 功能 - 青绿色
        case 2: return [.orange, .pink]      // 我的 - 橙粉色
        default: return [.blue, .purple]
        }
    }
    
    private var tabColor: Color {
        switch tab.tag {
        case 0: return .blue
        case 1: return .green
        case 2: return .orange
        default: return .blue
        }
    }
}

// 自定义按钮样式 - 按压效果
struct ScaleButtonStyle: ButtonStyle {
    @Binding var isPressed: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .onChange(of: configuration.isPressed) { oldValue, newValue in
                withAnimation(.easeInOut(duration: 0.1)) {
                    isPressed = newValue
                }
            }
    }
}
