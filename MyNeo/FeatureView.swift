
import SwiftUI

struct FeatureView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("功能页面")
                    .font(.title)
                // 功能模块内容...
                Text("功能页面")
                    .font(.title)
            }
            .navigationTitle("功能")
        }
    }
}

#Preview {
    FeatureView()
}


