import SwiftUI

struct FeatureOptionCard: View {
    let option: FeatureOption
    let onEdit: (FeatureOption) -> Void
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {}) {
            VStack(spacing: 12) {
                // 图标容器 - 渐变背景
                ZStack {
                    Circle()
                        .fill(iconGradient)
                        .frame(width: 70, height: 70)
                    
                    Image(systemName: option.icon)
                        .font(.system(size: 30, weight: .medium))
                        .foregroundColor(.white)
                }
                
                // 标题区域
                Text(option.rawValue)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.primary)
                
                // 编辑按钮 - 悬浮样式
                EditButton(onTap: { onEdit(option) })
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(
                        color: .black.opacity(0.1),
                        radius: 8,
                        x: 0,
                        y: 2
                    )
            )
        }
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.easeInOut(duration: 0.1), value: isPressed)
        .onLongPressGesture(
            minimumDuration: 0.1,
            maximumDistance: 10,
            pressing: { pressing in
                isPressed = pressing
            },
            perform: { onEdit(option) }
        )
    }
    
    // 根据选项类型返回不同的渐变
    private var iconGradient: LinearGradient {
        switch option {
        case .photo:
            return LinearGradient(
                colors: [.blue, .purple],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .voice:
            return LinearGradient(
                colors: [.green, .teal],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .text:
            return LinearGradient(
                colors: [.orange, .red],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
    }
}

// 独立的编辑按钮组件
struct EditButton: View {
    let onTap: () -> Void
    @State private var isHovered = false
    
    var body: some View {
        Button("编辑", action: onTap)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(isHovered ? .white : .blue)
            .padding(.horizontal, 16)
            .padding(.vertical, 6)
            .background(
                Capsule()
                    .fill(isHovered ? Color.blue : Color.blue.opacity(0.1))
            )
            .onHover { hovering in
                withAnimation(.easeInOut(duration: 0.2)) {
                    isHovered = hovering
                }
            }
    }
}
