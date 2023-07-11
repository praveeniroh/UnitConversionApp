//
//  ConverterView.swift
//  UnitConversion
//
//  Created by Praveenraj T on 09/07/23.
//

import SwiftUI


struct ConverterView<T:DataTypeProtocol>: View {
    
    let inputTitle:String = "input Unit"
    let outputTitle:String = "ouput unit"
    
    let inputUnits = T.allCases.map({$0})
    var outputUnits : [T]{
        T.allCases.filter({unit in
            if inputPickerValue == unit{
                return false
            }else{
                return true
            }
        })
    }
    
    var calculateOuputValueUnit:T{
        outputUnits.first ?? T.defaultOutputUnit
    }
    
    @State var inputPickerValue :T = T.defaultInputUnit
    @State var outputPickerValue:T = T.defaultOutputUnit
    
    @State var inputValue:Double = 0
    
    
    init(){
        outputPickerValue = calculateOuputValueUnit
    }
    
    var body: some View {
        Form{
            Section(inputTitle){
                Picker(inputTitle, selection: $inputPickerValue, content: {
                    ForEach(inputUnits,id: \.self, content: {option in
                        Text(option.name)
                    })
                })
                .pickerStyle(.segmented)
                .onChange(of: inputPickerValue, perform: {_ in
                    outputPickerValue = outputUnits.first ?? T.defaultOutputUnit
                })
            }
            
            Section(outputTitle){
                Picker(outputTitle, selection: $outputPickerValue, content: {
                    ForEach(outputUnits,id: \.self, content: {option in
                        Text(option.name)
                    })
                })
                .pickerStyle(.segmented)
            }
            
            Section{
                HStack{
                    Text("input value")
                    Spacer()
                    TextField("", value: $inputValue, format:.number)
                        .fixedSize()
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.decimalPad)
                    Text(inputPickerValue.unitSymbol)
                }
                
                HStack{
                    Text("Output value")
                    Spacer()
                    Text(T.convert(from: inputPickerValue, to: outputPickerValue, value: inputValue),format: .number)
                    Text(outputPickerValue.unitSymbol)
                }
            }
        }

    }
}

struct ConverterPreview:PreviewProvider{
    static var previews: some View{
        ConverterView<TemperatureData>()
    }
}
