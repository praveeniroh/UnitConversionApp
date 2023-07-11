//
//  ContentView.swift
//  UnitConversion
//
//  Created by Praveenraj T on 09/07/23.
//

import SwiftUI

struct ContentView: View {
    let dataTypeArray:[any DataTypeProtocol.Type] = [TemperatureData.self,LengthData.self,TimeData.self]
    @State var selectedType: any DataTypeProtocol.Type = TemperatureData.self
    
    var body: some View {
        Picker("Select Type", selection: $selectedType, content: {
            ForEach(dataTypeArray,id: \.self, content: {option in
                Text(option.self.typeName)
            })
        })
        .pickerStyle(.segmented)
//        .onChange(of: selectedType, perform: {_ in
//            outputPickerValue = outputUnits.first ?? T.defaultOutputUnit
//        })
        ConverterView<selectedType>()
    }
}

#Preview {
    ContentView()
}
