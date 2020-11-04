//
//  CoursesView.swift
//  DesignCodeCourse
//
//  Created by CHAN Hong Wing on 1/11/2020.
//

import SwiftUI

struct CoursesView: View {
    @Namespace var namespace
    @State var selectedItem: Course? = nil
    @State var isDisable = false
    
    var body: some View {
        ZStack {
            ScrollView(.vertical){
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
            }.zIndex(1)
            
            if selectedItem != nil {
                ZStack(alignment: .topTrailing) {
                    
                    VStack {
                        ScrollView {
                            CourseItem(course: selectedItem!)
                                .matchedGeometryEffect(id: selectedItem!.id, in: namespace)
                                .frame(height: 300)
                            VStack {
                                ForEach(0 ..< 20) { item in
                                    CourseRow()
                                }
                            }
                            .padding()
                        }
                    }
                    .background(Color("Background 1"))
                    .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                    .matchedGeometryEffect(id: "container\(selectedItem!.id)", in: namespace)
                    .edgesIgnoringSafeArea(.all)
                    
                    CloseButton()
                        .padding(.trailing, 16)
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
            }
        }
        //        .animation(.spring())
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
