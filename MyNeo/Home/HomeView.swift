//
//  ContentView.swift
//  MyNeo
//
//  Created by suq on 2025/12/22.
//

import SwiftUI

struct HomeView: View {
    @State private var showEditMenu = false
    @State private var selectedOption: FeatureOption?
    
    var body: some View {
        ZStack {
            // 背景色保持不变
            LinearGradient(
                colors: [
                    Color(.systemBackground),
                    Color(.systemGray6).opacity(0.3)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            FeatureGridView(
                showEditMenu: $showEditMenu,
                selectedOption: $selectedOption
            )
            .padding(.top, 0)
        }
        .overlay(editMenuOverlay)
        .navigationBarTitleDisplayMode(.automatic)
        .navigationTitle("功能中心")
    }
    
    private var editMenuOverlay: some View {
        Group {
            if showEditMenu, let option = selectedOption {
                EditMenuView(
                    option: option,
                    isShowing: $showEditMenu
                )
            }
        }
    }
}
