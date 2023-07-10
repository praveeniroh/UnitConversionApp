//
//  DataTypeProtocol.swift
//  UnitConversion
//
//  Created by Praveenraj T on 10/07/23.
//

import Foundation

protocol DataTypeProtocol :CaseIterable,Equatable,Hashable{
//    associatedtype DataType:CaseIterable
    
    var name:String{get}
    var unitSymbol:String {get}
    
    static var defaultInputUnit:Self{get}
    static var defaultOutputUnit:Self{get}
    
    static func convert(from inputUnit:Self,to outputUnit:Self,value inputValue:Double)->Double
    
}
