//
//  AlignmentControl.swift
//  SwiftUI_Component
//
//  Created by CHAN Hong Wing on 11/12/2020.
//

import SwiftUI

// https://trailingclosure.com/micro-interactions-alignment-control/
struct AlignmentControl: View {

    @Binding var textAlignment: TextAlignment
    @State private var alignment: HorizontalAlignment

    var tintColor: Color
    var baseColor: Color


    init(alignment: Binding<TextAlignment>, tintColor: Color = Color.blue, baseColor: Color = Color.gray) {
        self._textAlignment = alignment

        switch alignment.wrappedValue {
            case .leading:
                self._alignment = .init(initialValue: .leading)
            case .center:
                self._alignment = .init(initialValue: .center)
            case .trailing:
                self._alignment = .init(initialValue: .trailing)
        }

        self.tintColor = tintColor
        self.baseColor = baseColor
    }

    var body: some View {
        ZStack(alignment: Alignment(horizontal: alignment, vertical: .center)) {

            HStack (spacing: 20) {
                AlignmentButton(alignment: .leading) {
                    alignment = .leading
                    textAlignment = .leading
                }

                AlignmentButton(alignment: .center) {
                    alignment = .center
                    textAlignment = .center
                }
                AlignmentButton(alignment: .trailing) {
                    alignment = .trailing
                    textAlignment = .trailing
                }
            }
            .foregroundColor(baseColor)

            VStack(alignment: alignment, spacing: 4) {
                AlignmentLine()
                    .animation(Animation.easeOut)
                AlignmentLine()
                    .frame(width: 14, height: 3, alignment: .center)
                    .cornerRadius(1.5)
                    .animation(Animation.easeOut.delay(0.03))
                AlignmentLine()
                    .animation(Animation.easeOut.delay(0.06))
                AlignmentLine()
                    .frame(width: 14, height: 3, alignment: .center)
                    .cornerRadius(1.5)
                    .animation(Animation.easeOut.delay(0.09))
            }.foregroundColor(tintColor)

        }
    }
}

struct AlignmentControl_Previews: PreviewProvider {
    @State static var alignment: TextAlignment = .leading
    static var previews: some View {
        ZStack {
            Color(red: 35/255, green: 45/255, blue: 50/255)
            VStack(spacing: 200) {
                AlignmentControl(alignment: $alignment)
                AlignmentButton(alignment: .leading) {

                }.foregroundColor(.white)
            }
        }
    }
}

struct AlignmentLine: View {
    var body: some View {
        Rectangle()
            .frame(width: 25, height: 3, alignment: .center)
            .cornerRadius(1.5)
    }
}

struct AlignmentButton : View {

    var alignment: HorizontalAlignment
    var action: ()->()

    var body: some View {
        Button(action: action, label: {
            VStack(alignment: alignment, spacing: 4) {
                AlignmentLine()
                AlignmentLine()
                    .frame(width: 14, height: 3, alignment: .center)
                    .cornerRadius(1.5)
                AlignmentLine()
                AlignmentLine()
                    .frame(width: 14, height: 3, alignment: .center)
                    .cornerRadius(1.5)
            }
        })
    }
}
