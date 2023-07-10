//
//  TextFieldWithClear.swift
//  UnitConversion
//
//  Created by Praveenraj T on 10/07/23.
//

import Foundation
import SwiftUI

//struct ClearButton: ViewModifier{
//    @Binding var text: String
//
//    public func body(content: Content) -> some View{
//        ZStack(alignment: .trailing){
//            content
//            if !text.isEmpty{
//                Button(action:{
//                    self.text = ""
//                }){
//                    Image(systemName: "multiply.circle.fill")
//                        .foregroundColor(Color(UIColor.opaqueSeparator))
//                }
//                .padding(.trailing, 8)
//            }
//        }
//    }
//}
//
//struct TextFieldWithClear:View {
//    var title:String
//    @Binding var text: String
//    var format:any ParseableFormatStyle
//    var body: some View {
//        TextField(title, value: $text, format:format)
//    }
//}
