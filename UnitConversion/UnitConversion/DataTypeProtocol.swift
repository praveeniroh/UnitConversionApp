//
//  DataTypeProtocol.swift
//  UnitConversion
//
//  Created by Praveenraj T on 10/07/23.
//

import Foundation

protocol DataTypeProtocol :CaseIterable{
    associatedtype DataType
    
    var name:String{get}
    var unitSymbol:String {get}
    
    static var defaultInputUnit:DataType{get}
    static var defaultOutputUnit:DataType{get}
    
    static func convert(from inputUnit:DataType,to outputUnit:DataType,value inputValue:Double)->Double
    
}
