import SwiftUI

enum FeatureOption: String, CaseIterable {
    case photo = "相册"
    case voice = "语音" 
    case text = "文本"
    
    var icon: String {
        switch self {
        case .photo: return "photo"
        case .voice: return "mic"
        case .text: return "doc.text"
        }
    }
}
