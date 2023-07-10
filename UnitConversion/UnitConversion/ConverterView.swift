//
//  ConverterView.swift
//  UnitConversion
//
//  Created by Praveenraj T on 09/07/23.
//

import SwiftUI


struct ConverterView: View {
    let inputTitle:String = "input temperature"
    let outputTitle:String = "ouput temperature"
    
    let inputUnits = Temperatures.allCases.map({$0})
    var outputUnits : [Temperatures]{
        Temperatures.allCases.filter({temperature in
            if inputPickerValue == temperature{
                return false
            }else{
                return true
            }
        })
    }
    
    var calculateOuputValueUnit:Temperatures{
        outputUnits.first ?? Temperatures.defaultOutputUnit
    }
    
    @State var inputPickerValue :Temperatures = Temperatures.defaultInputUnit
    @State var outputPickerValue:Temperatures = Temperatures.defaultOutputUnit
    
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
                    outputPickerValue = outputUnits.first ?? Temperatures.defaultOutputUnit
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
                    Text(Temperatures.convert(from: inputPickerValue, to: outputPickerValue, value: inputValue),format: .number)
                    Text(outputPickerValue.unitSymbol)
                }
            }
        }

    }
}

struct ConverterPreview:PreviewProvider{
    static var previews: some View{
        ConverterView()
    }
}
