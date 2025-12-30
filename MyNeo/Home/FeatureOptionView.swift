import SwiftUI

struct FeatureOptionView: View {
    let option: FeatureOption
    let onEdit: (FeatureOption) -> Void
    
    var body: some View {
        VStack {
            Image(systemName: option.icon)
                .font(.system(size: 40))
            Text(option.rawValue)
            
            // 编辑按钮
            Button("编辑") { onEdit(option) }
                .buttonStyle(.bordered)
        }
        .frame(height: 120)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
        .onLongPressGesture { onEdit(option) } // 长按触发
    }
}
