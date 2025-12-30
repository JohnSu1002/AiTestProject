import SwiftUI

struct EditMenuView: View {
    let option: FeatureOption
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 15) {
                Text("编辑 \(option.rawValue)")
                    .font(.headline)
                
                // 修复：过滤可用的编辑操作
                ForEach(availableActions, id: \.self) { action in
                    Button(action.rawValue) { 
                        handleAction(action) 
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                Button("取消") { 
                    isShowing = false 
                }
                .buttonStyle(.bordered)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .padding(.horizontal, 40)
        }
    }
    
    // 新增：计算可用的操作列表
    private var availableActions: [EditAction] {
        EditAction.allCases.filter { $0.availableFor(option) }
    }
    
    private func handleAction(_ action: EditAction) {
        // 具体编辑逻辑实现
        print("执行操作: \(action.rawValue) - 目标: \(option.rawValue)")
        
        // 根据不同的操作类型执行相应逻辑
        switch action {
        case .rename:
            // 重命名逻辑
            break
        case .delete:
            // 删除逻辑  
            break
        case .move:
            // 移动逻辑
            break
        case .copy:
            // 复制逻辑
            break
        case .share:
            // 分享逻辑
            break
        }
        
        isShowing = false
    }
}

