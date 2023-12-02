//youtube solution
//https://www.youtube.com/watch?v=u0bmlhqhDdk
// Steps
// 1. make 3 @State variable measurement, inputUnit, outputUnit
// 2. make Array involving LengthUnit
// 3. make calculated result with computed property / measurement type
// 4. formatter

import SwiftUI

struct LengthConversionViewSolution: View {
    @State private var measurement = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    //picker로 받을 때 인덱스로 취급하도록
    
    let units = [UnitLength.meters, UnitLength.kilometers, UnitLength.inches, UnitLength.feet, UnitLength.yards]
    
    var convertedAmount:Measurement<UnitLength>{
        // <> 꺽쇠의 의미가 뭐지 -> swift가 가진 측정 단위 중 하나 고르는거임
        let inputAmount = Measurement(value: Double(measurement) ?? 0, unit: units[inputUnit])
        var outputAmount = inputAmount.converted(to: units[outputUnit])
        
        return outputAmount
    }
    
    var fomatter:MeasurementFormatter {
        let newFormat = MeasurementFormatter()
        newFormat.unitStyle = .long // 소수점 3자리까지 표기
        newFormat.unitOptions = .providedUnit // 제공된 유닛으로 사용하도록 지정

        return newFormat
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("\(fomatter.string(from: units[inputUnit]))", text: $measurement).keyboardType(.decimalPad)
                    Picker("input unit", selection: $inputUnit) {
                        ForEach(0..<units.count){
                            let formatterOutput =
                            fomatter.string(from: units[$0])
                            Text(formatterOutput)
                        }
                    }
                    Picker("output unit", selection: $outputUnit){ForEach(0..<units.count){
                        let formatterOutput = fomatter.string(from: units[$0])
                        Text(formatterOutput)
                    }
                        
                    }
                }
                Section{
                    let convertedOutput = fomatter.string(from: convertedAmount)
                    Text(convertedOutput)
                }
            }
        }
    }
}

struct LengthConversionViewSolution_Previews: PreviewProvider {
    static var previews: some View {
        LengthConversionViewSolution()
    }
}
