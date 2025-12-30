import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let tag: Int
    var badgeCount: Int? = nil  // 新增徽章支持
}
