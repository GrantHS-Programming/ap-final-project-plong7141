//
//  ContentView.swift
//  app1
//
//  Created by Patchen Long on 3/19/24.
//

import SwiftUI

struct ContentView: View {
    
    // new variables here!
    @State var infoText: String = "Enter a time beow: "
    @State var infoText2: String = "Enter an amount of time below (in hours): "
    @State var hour: String = ""
    @State var time: String = ""
    @State var minute: String = ""
    @State var countDownTimer: Int = 5
    @State var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            Color.lightBlue
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text("Title to come!")
                    .font(.title).fontWeight(.bold).foregroundColor(Color("AccentColor")).dynamicTypeSize(/*@START_MENU_TOKEN@*/.xLarge/*@END_MENU_TOKEN@*/)
                Text("Discription/ info on how to use app/ what to do!! This is to check formating :)")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("LightPink"))
                    .multilineTextAlignment(.center)
                
                VStack{
                    HStack{
                        VStack{
                            Text(infoText)
                                .padding()
                                .background(Color.lightPink)
                                .multilineTextAlignment(.center)
                                .cornerRadius(10)
                            HStack{
                                TextField("Enter Hour", text: $hour)
                                    .background(Color.lightPink)
                                    .keyboardType(.decimalPad)
                                    .cornerRadius(10)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                Spacer()
                                TextField("Enter Minute", text: $minute)
                                    .background(Color.lightPink)
                                    .keyboardType(.decimalPad)
                                    .cornerRadius(10)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    
                                
                            }
                            Button(action: {checking()})
                            {Text("Submit")}
                        }
                        
                        
                    }
                  
                }
                .padding()
                .background(Rectangle().foregroundColor(.newGreen).cornerRadius(15)
                    .shadow(radius: 15))
                .padding()
                // edit this for a time picker! make it look diffrent too!!
                VStack{
                    HStack{
                        VStack{
                            // make another info text
                            Text(infoText2)
                                .padding()
                                .background(Color.newGreen)
                                .multilineTextAlignment(.center)
                                .cornerRadius(10)
                            HStack{
                                TextField("Enter a time", text: $time)
                                    .background(Color.newGreen)
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.center)
                                    .cornerRadius(10)
                                
                                    .padding()
                                
                                
                            }
                            Button(action: {checkingTime()})
                            {Text("Submit")}
                        }
                        
                        
                    }
                  
                }
                
                .padding()
                .background(Rectangle().foregroundColor(.lightPink).cornerRadius(15)
                    .shadow(radius: 15))
                .padding()
                VStack{
                    Text("\(countDownTimer)")
                        .onReceive(timer) {_ in
                            if countDownTimer > 0 && timerRunning{
                                countDownTimer -= 1
                            }
                            else{
                                timerRunning = false
                            }
                        }
                        .font(.system(size: 50, weight: .bold))
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    HStack(spacing: 30){
                        Button("Start"){
                            timerRunning = true
                        }
                        .foregroundColor(.newGreen)
                        Button("Reset"){
                            countDownTimer = countDownTimer + 5
                        }
                    }
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.lightOrange)
                    .cornerRadius(15))
                .padding()
            }
            
            .padding()
        }
    }
    // put functions here!!
    func checking() {
        if Int(hour) == nil {
            infoText = "Please enter an hour"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                infoText = "Enter a time below:"
            }
        }
        else if Int(minute) == nil {
            infoText = "Please enter a minute"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                infoText = "Enter a time below:"
            }
        }
        else{
            infoText = "Data inputed!!"
        }
    }
    func checkingTime() {
        if Int(time) == nil {
            infoText2 = "Please enter a time"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                infoText2 = "Enter an amount of time below (in hours):"
            }
        }
        else{
            // fix this to make it actually work
            // var intTime: Int = (Int(time))
            infoText2 = "Data inputed!!"
            // countDownTimer = (intTime * 60)
        }
    }
}

#Preview {
    ContentView()
}
