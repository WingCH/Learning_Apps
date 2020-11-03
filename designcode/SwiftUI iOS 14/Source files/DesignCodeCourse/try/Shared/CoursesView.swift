//
//  CoursesView.swift
//  DesignCodeCourse
//
//  Created by CHAN Hong Wing on 1/11/2020.
//

import SwiftUI

struct CoursesView: View {
    @State var show = false
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            ScrollView{
                VStack(spacing: 20) {
                    ForEach(courses) { item in
                        CourseItem(course: item)
                            .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                            .frame(width: 335, height: 250, alignment: .center)
                    }

                }
                .frame(maxWidth: .infinity)
            }
            
            if show {
                ScrollView {
                    CourseItem(course: courses[0])
                        .matchedGeometryEffect(id: courses[0].id, in: namespace)
                        .frame(height: 300)
                    VStack {
                        ForEach(0 ..< 20) { item in
                            CourseRow()
                        }
                    }
                    .padding()
                }
                .background(Color("Background 1"))
                .transition(
                    .asymmetric(
                        insertion: AnyTransition
                            .opacity
                            .animation(Animation.spring().delay(0.3)),
                        removal: AnyTransition
                            .opacity
                            .animation(Animation.spring())
                    )
                )
                .edgesIgnoringSafeArea(.all)
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
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
