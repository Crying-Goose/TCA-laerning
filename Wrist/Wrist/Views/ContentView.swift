//
//  ContentView.swift
//  Wrist
//
//  Created by 라주영 on 2023/03/26.
//

import ComposableArchitecture
import SwiftUI

private let title = "시계 찾기"
private let summary = "찾고 싶은 시계를 이름 또는 제조사명으로 검색할 수 있습니다."

struct Content: ReducerProtocol {
    struct State: Equatable {
        var results: [WatchSearch.Result] = []
        var resultWatchRequest: WatchSearch.Result?
        var searchQuery = ""
    }
    
    enum Action: Equatable {
        case searchQueryChanged(String)
    }
    
//    @Dependency(\.watchClient) var watchClient
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        return .none
    }
}

struct ContentView: View {
    
    let store: StoreOf<Content>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationView {
                VStack(alignment: .leading) {
                    Text(summary).padding()
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("시계 이름을 검색해보세요.",
                                  text: viewStore.binding(
                                    get: \.searchQuery, send: Content.Action.searchQueryChanged
                        ))
                        .textFieldStyle(.roundedBorder)
                        .disableAutocorrection(true)
                    }
                    .padding(.horizontal, 16)
                    
                    List {
                        ForEach(viewStore.results) { watch in
                            VStack(alignment: .leading) {
                                Text(watch.name)
                                Text("\(String(watch.weight))g")
                            }
                        }
                    }
                }
            }
            .navigationTitle(title)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store(initialState: Content.State(), reducer: Content()))
    }
}
