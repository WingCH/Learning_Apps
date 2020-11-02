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
            CourseItem()
                .matchedGeometryEffect(id: "Card", in: namespace, isSource: !show)
                .frame(width: 335, height: 250, alignment: .center)
            
            if show {
                ScrollView {
                    CourseItem()
                        .matchedGeometryEffect(id: "Card", in: namespace)
                        .frame(height: 300)
                    ForEach(0 ..< 20) { item in
                        CourseRow()
                    }
                    .padding()
                }
                .transition(.opacity)
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
