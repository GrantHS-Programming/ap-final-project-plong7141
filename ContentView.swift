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
    @State var second: String = ""
    @State var countDownTimer: Int = 0
    @State var countDownTimerH: Int = 0
    @State var countDownTimerM: Int = 0
    @State var timerRunning = false
    @State var timerRunningH = false
    @State var timerRunningM = false
    @State var run = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let timerH = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let timerM = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            Color.lightBlue
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text("Welcome To My App!")
                    .font(.title).fontWeight(.bold).foregroundColor(Color("AccentColor")).dynamicTypeSize(/*@START_MENU_TOKEN@*/.xLarge/*@END_MENU_TOKEN@*/)
                Text("This is my timer app. Feel free to enter your time in the box below or manually then start your timer! (Note: the timer runs in seconds)")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("LightPink"))
                    .multilineTextAlignment(.center)
                
                VStack{
                    HStack{
                        VStack{
                            Text(infoText)
                                .padding()
                                .background(Color.newGreen)
                                .multilineTextAlignment(.center)
                                .cornerRadius(10)
                            HStack{
                                TextField("Hour", text: $hour)
                                    .background(Color.newGreen)
                                    .keyboardType(.decimalPad)
                                    .cornerRadius(10)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                Spacer()
                                TextField("Minute", text: $minute)
                                    .background(Color.newGreen)
                                    .keyboardType(.decimalPad)
                                    .cornerRadius(10)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                Spacer()
                                TextField("Second", text: $second)
                                    .background(Color.newGreen)
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
                .background(Rectangle().foregroundColor(.lightPink).cornerRadius(15)
                    .shadow(radius: 15))
                .padding()
                Text("Timer: ")
                    .font(.title).fontWeight(.bold).foregroundColor(Color.blue).dynamicTypeSize(/*@START_MENU_TOKEN@*/.xLarge/*@END_MENU_TOKEN@*/)
                
                VStack{
                        // Hours
                        HStack{
                            Text("\(countDownTimerH)")
                                .onReceive(timerH) {_ in
                                    if countDownTimerH > 0 && timerRunningH{
                                        countDownTimerH -= 1
                                    }
                                    else{
                                        timerRunningH = false
                                    }
                                }
                                .font(.system(size: 50, weight: .bold))
                                .opacity(0.8)
                            HStack(spacing: 30){
                                Button("+1 Hour"){
                                    countDownTimerH = countDownTimerH + 3600
                                }
                            }
                        }
                        .padding()
                        .background(Rectangle()
                            .foregroundColor(.lightOrange)
                            .cornerRadius(15))
                        // minutes
                    HStack{
                        VStack{
                            Text("\(countDownTimerM)")
                                .onReceive(timerM) {_ in
                                    if countDownTimerM > 0 && timerRunningM{
                                        countDownTimerM -= 1
                                    }
                                    else if countDownTimerM <= 0 && run{
                                        timerRunningM = false
                                        timerRunningH = true
                                    }
                                }
                                .font(.system(size: 50, weight: .bold))
                                .opacity(0.8)
                            HStack(spacing: 30){
                                Button("+1 Min"){
                                    countDownTimerM = countDownTimerM + 60
                                }
                            }
                        }
                        .padding()
                        .background(Rectangle()
                            .foregroundColor(.lightOrange)
                            .cornerRadius(15))
                        .padding()
                        Text(":")
                            .font(.system(size: 50, weight: .bold))
                            .opacity(0.8)
                        // seconds
                        VStack{
                            Text("\(countDownTimer)")
                                .onReceive(timer) {_ in
                                    if countDownTimer > 0 && timerRunning{
                                        countDownTimer -= 1
                                    }
                                    else if countDownTimer <= 0 && run{
                                        timerRunning = false
                                        timerRunningM = true
                                    }
                                }
                                .font(.system(size: 50, weight: .bold))
                                .opacity(0.8)
                            HStack(spacing: 30){
                                Button("+1 Sec"){
                                    countDownTimer = countDownTimer + 1
                                }
                            }
                        }
                        .padding()
                        .background(Rectangle()
                            .foregroundColor(.lightOrange)
                            .cornerRadius(15))
                        .padding()
                        
                    }
                    HStack{
                        Button("Start"){
                            timerRunning = true
                            run = true
                        }
                        .foregroundColor(.blue)
                        Text("   ")
                        Button("Reset"){
                            countDownTimerH = 0
                            countDownTimerM = 0
                            countDownTimer = 0
                            timerRunning = false
                            timerRunningH = false
                            timerRunningM = false
                            hour = ""
                            minute = ""
                            second = ""
                            infoText = "Enter a time below:"
                        }
                        .foregroundColor(.lightPink)
                    }
                }
                .padding()
                .background(Rectangle().foregroundColor(.newGreen).cornerRadius(15))
                // here
                
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
        else if Int(second) == nil {
            infoText = "Please enter a second"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                infoText = "Enter a time below:"
            }
        }
        else{
            infoText = "Data inputed!!"
            let convertHour = Int(hour)! * 3600
            countDownTimerH = convertHour
            let convertMinute = Int(minute)! * 60
            countDownTimerM = convertMinute
            let convertSecond = Int(second)! * 1
            countDownTimer = convertSecond
        }
    }
    func checkingTime() {
        if Int(time) == nil {
            infoText2 = "Please enter a time"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                infoText2 = "Enter an amount of time below (in hours):"
            }
        }
    }
}

#Preview {
    ContentView()
}
