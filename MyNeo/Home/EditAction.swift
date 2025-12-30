import SwiftUI

enum EditAction: String, CaseIterable {
    case rename = "重命名"
    case delete = "删除"
    case move = "移动"
    case copy = "复制"
    case share = "分享"
    
    // 根据功能选项过滤可用操作
    func availableFor(_ option: FeatureOption) -> Bool {
        switch self {
        case .rename, .delete, .share:
            return true // 所有选项都支持
        case .move, .copy:
            return option != .voice // 语音选项不支持移动和复制
        }
    }
}
