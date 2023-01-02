import SwiftUI

struct TimePicker: View {
    
    @Binding var hourSelection: Int
    @Binding var minuteSelection: Int
    @Binding var secondSelection: Int
    @Binding var bottomSheet: Bool
    
    var hours = [Int](0..<24)
    var minutes = [Int](0..<60)
    var seconds = [Int](0..<60)
    
    var body: some View {
        ZStack{
            Color.gray.opacity(0.4).edgesIgnoringSafeArea(.all)
            VStack{
                if #available(OSX 11.0, *) {
                    Text("Select Time ⏰")
                        .font(.title2)
                        .padding([.top], 32)
                } else {
                    EmptyView()
//                   "doesn't available for this version"
                }
                HStack {
                    Picker(selection: self.$hourSelection, label: Text("")){
                        ForEach(0..<self.hours.count) { index in
                            Text(hours[index] <= 9 ? "0\(self.hours[index]) h" : "\(self.hours[index]) h")
                                .tag(index)
                                .padding()
                        }
                    }
//                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 50, height: 100, alignment: .center)
                    .clipped()
                    .padding(.horizontal)
                    
                    Picker(selection: self.$minuteSelection, label: Text("")){
                        ForEach(0..<self.minutes.count) { index in
                            Text(minutes[index] <= 9 ? "0\(self.minutes[index]) m" : "\(self.minutes[index]) m")
                                .tag(index)
                                .padding()
                        }
                    }
//                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 50, height: 100, alignment: .center)
                    .clipped()
                    .padding(.horizontal)
                    
                    Picker(selection: self.$secondSelection, label: Text("")){
                        ForEach(0..<self.seconds.count) { index in
                            Text(seconds[index] <= 9 ? "0\(self.seconds[index]) s" : "\(self.seconds[index]) s")
                                .tag(index)
                                .padding()
                        }
                    }
//                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 50, height: 100, alignment: .center)
                    .clipped()
                    .padding(.horizontal)

                    let _ = print("\(hourSelection) h")
                    let _ = print("\(minuteSelection) m")
                    let _ = print("\(secondSelection) s")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                Button(action: {
                        bottomSheet = false
                }, label: {
                    Text("NewTime")
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color(.systemBlue).opacity(0.9))
                        .cornerRadius(6)
                        .padding()
                       
                })
                .padding()
            }
            .frame(width: 300, height: 250, alignment: .center)
            .background(Color.primary.colorInvert()).cornerRadius(24)
        }
    }
}

