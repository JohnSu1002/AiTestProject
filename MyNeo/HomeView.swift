//
//  ContentView.swift
//  MyNeo
//
//  Created by suq on 2025/12/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("首页页面")
                    .font(.title)
                Text("首页页面")
                    .font(.title)
                Text("首页页面")
                    .font(.title)
                Text("首页页面")
                    .font(.title)
                Text("首页页面")
                    .font(.title)
                // 功能模块内容...
            }
            .navigationTitle("首页")
        }
    }
}

#Preview {
    HomeView()
}
