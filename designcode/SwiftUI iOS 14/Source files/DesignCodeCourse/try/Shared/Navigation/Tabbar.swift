//
//  Tabbar.swift
//  DesignCodeCourse
//
//  Created by CHAN Hong Wing on 5/11/2020.
//

import SwiftUI

struct Tabbar: View {
    var body: some View {
        TabView{
            NavigationView {
                CoursesView()
            }
            .tabItem {
                Image(systemName: "book.closed")
                Text("Courses")
            }
            NavigationView {
                CourseList()
            }
            .tabItem {
                Image(systemName: "list.bullet.rectangle")
                Text("Tutorials")
            }
            NavigationView {
                    CourseList()
                }
                .tabItem {
                    Image(systemName: "tv")
                    Text("Livestreams")
                }
                
                NavigationView {
                    CourseList()
                }
                .tabItem {
                    Image(systemName: "mail.stack")
                    Text("Certificates")
                }
                
                NavigationView {
                    CourseList()
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
