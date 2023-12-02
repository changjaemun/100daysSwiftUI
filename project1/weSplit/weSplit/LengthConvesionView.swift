//
//  LengthConvesionView.swift
//  weSplit
//
//  Created by 문창재 on 2023/11/18.
//

import SwiftUI

struct LengthConvesionView: View {
    @State private var inputUnit = "m"
    @State private var outputUnit = "m"
    @State private var inputValue:Double = 0
    var outputValue:Double {
        var meterToValue:Double = 0
        var kmToValue:Double = 0
        var feetToValue:Double = 0
        var yardToValue:Double = 0
        var milesToValue:Double = 0
        var returnValue:Double = 0
        
        switch outputUnit{
        case "km": meterToValue = inputValue / 1000
        case "feet": meterToValue = inputValue * 3.281
        case "yard": meterToValue = inputValue * 1.094
        case "miles": meterToValue = inputValue / 1609
        default: meterToValue = inputValue
        }
        switch outputUnit{
        case "m": kmToValue = inputValue * 1000
        case "feet": kmToValue = inputValue * 3281
        case "yard": kmToValue = inputValue * 1094
        case "miles": kmToValue = inputValue / 1.609
        default: kmToValue = inputValue
        }
        switch outputUnit{
        case "m": feetToValue = inputValue / 3.281
        case "km": feetToValue = inputValue / 3281
        case "yard": feetToValue = inputValue / 3
        case "miles": feetToValue = inputValue / 5280
        default: feetToValue = inputValue
        }
        switch outputUnit{
        case "m": yardToValue = inputValue / 1.094
        case "km": yardToValue = inputValue / 1094
        case "feet": yardToValue = inputValue * 3
        case "miles": yardToValue = inputValue / 1760
        default: yardToValue = inputValue
        }
        switch outputUnit{
        case "m": milesToValue = inputValue / 1609
        case "km": milesToValue = inputValue / 1.609
        case "feet": milesToValue = inputValue * 5280
        case "yard": milesToValue = inputValue * 1760
        default: milesToValue = inputValue
        }
        switch inputUnit{
        case "m": returnValue = meterToValue
        case "km": returnValue = kmToValue
        case "feet": returnValue = feetToValue
        case "yard": returnValue = yardToValue
        case "miles": returnValue = milesToValue
        default:
            inputValue
        }
        return returnValue
    }
    
    let units:[String] = ["m", "km", "feet", "yard", "miles"]
    var body: some View {
        NavigationStack{
            Form{
                Section("input value"){
                    TextField("", value: $inputValue, format: .number).keyboardType(.decimalPad)
                }
                Section("input unit"){
                    Picker("",selection: $inputUnit){
                        ForEach(units, id:\.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                }
                Section("output unit"){
                    Picker("",selection: $outputUnit){
                        ForEach(units, id:\.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                }
                Section("conversion result"){
                    Text("\(outputValue)")
                }
                
            }
        }
     
    }
}

struct LengthConvesionView_Previews: PreviewProvider {
    static var previews: some View {
        LengthConvesionView()
    }
}
