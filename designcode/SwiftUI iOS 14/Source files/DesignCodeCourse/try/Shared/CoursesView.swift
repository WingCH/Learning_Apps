//
//  CoursesView.swift
//  DesignCodeCourse
//
//  Created by CHAN Hong Wing on 1/11/2020.
//

import SwiftUI

struct CoursesView: View {
    @Namespace var namespace
    @Namespace var namespace2
    @State var selectedItem: Course? = nil
    @State var isDisable = false
    
    var body: some View {
        ZStack {
            #if os(iOS)
            content
                .navigationBarHidden(true)
            fullContent
                .background(VisualEffectBlur(blurStyle: .systemMaterial).edgesIgnoringSafeArea(.all))
            #else
            content
            fullContent
                .background(VisualEffectBlur().edgesIgnoringSafeArea(.all))
            #endif
        }
        .navigationTitle("Courses")
    }
    
    var content: some View {
        ScrollView(.vertical){
            VStack( spacing: 0) {
                Text("Courses")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .padding(.top, 54)
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 160), spacing: 16)],
                    spacing: 16
                ) {
                    ForEach(courses) { item in
                        VStack {
                            CourseItem(course: item)
                                .matchedGeometryEffect(id: item.id, in: namespace, isSource: selectedItem != item)
                                .frame(height: 200, alignment: .center)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0))  {
                                        selectedItem = item
                                        isDisable = true
                                    }
                                }
                                .disabled(isDisable)
                        }
                        .matchedGeometryEffect(id: "container\(item.id)", in: namespace, isSource: selectedItem != item)
                    }
                    
                }
                .padding(16)
                .frame(maxWidth: .infinity)
                
                Text("Latest sections")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 240))]) {
                    ForEach(courseSections) { item in
                        #if os(iOS)
                        NavigationLink(
                            destination: CourseDetail(namespace: namespace2)) {
                            CourseRow(item: item)
                        }
                        #else
                        CourseRow(item: item)
                        #endif
                    }
                }
                .padding()
            }
            
        }.zIndex(1)
    }
    
    
    @ViewBuilder
    var fullContent: some View {
        if selectedItem != nil {
            ZStack(alignment: .topTrailing) {
                
                CourseDetail(course: selectedItem!, namespace: namespace)
                
                CloseButton()
                    .padding(16)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedItem = nil
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                isDisable = false
                            }
                            
                        }
                    }
            }
            .zIndex(2)
            .frame( maxWidth: 712)
            .frame( maxWidth: .infinity)
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
        
        
    }
}
