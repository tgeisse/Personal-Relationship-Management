//
//  MainWindowTabs.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/20/23.
//

import SwiftUI

enum TabViews: String, CaseIterable, Hashable {
    case contacts
    case activity
    case events
    //case sources
    case settings
    
    var view: AnyView {
        switch self {
        case .contacts: return AnyView(ContactEntry())
        case .activity: return AnyView(ActivityEntry())
        case .events: return AnyView(EventEntry())
        case .settings: return AnyView(SettingsEntry())
        //case .sources: return AnyView(SourcesEntry())
        }
    }
    
    var title: String {
        self.rawValue.capitalized
    }
    
    var systemImage: String {
        switch self {
        case .contacts: return "person.fill"
        case .activity: return "person.line.dotted.person.fill"
        case .events: return "calendar"
        case .settings: return "gearshape"
        //case .sources: return "tray.and.arrow.down.fill"
        }
    }
    
    var tag: String { rawValue }
}

struct MainWindowTabs: View {
    @State private var selection: TabViews
    
    init(selection: TabViews = .contacts) {
        _selection = State(initialValue: selection)
    }
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(TabViews.allCases, id: \.self) { tabView in
                tabView.view
                    .tabItem {
                        Label(tabView.title, systemImage: tabView.systemImage)
                    }
                    .tag(tabView.tag)
            }
        }
    }
}

#if DEBUG
struct MainWindowTabs_Previews: PreviewProvider {
    static var previews: some View {
        MainWindowTabs()
    }
}
#endif
