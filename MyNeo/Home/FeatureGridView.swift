import SwiftUI

struct FeatureGridView: View {
    @Binding var showEditMenu: Bool
    @Binding var selectedOption: FeatureOption?
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // 添加欢迎提示替代移除的标题
                welcomeSection
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(FeatureOption.allCases, id: \.self) { option in
                        FeatureOptionCard(
                            option: option,
                            onEdit: { editOption in
                                selectedOption = editOption
                                withAnimation(.spring(response: 0.3)) {
                                    showEditMenu = true
                                }
                            }
                        )
                        .padding(4)
                    }
                }
                .padding(.horizontal, 16)
            }
            .padding(.vertical, 20)
        }
    }
    
    // 新增欢迎区域，提供更好的用户体验
    private var welcomeSection: some View {
        VStack(spacing: 8) {
            Text("欢迎使用")
                .font(.system(size: 22, weight: .semibold))
                .foregroundColor(.primary)
            
            Text("选择下方功能开始体验")
                .font(.system(size: 16))
                .foregroundColor(.secondary)
        }
    }
}


