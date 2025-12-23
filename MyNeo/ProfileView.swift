import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("个人中心")
                    .font(.title)
                // 用户信息设置...
            }
            .navigationTitle("我的")
        }
    }
}

#Preview {
    ProfileView()
}
