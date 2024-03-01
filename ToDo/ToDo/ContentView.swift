//
//  ContentView.swift
//  ToDo
//
//  Created by StudentAM on 2/27/24.
//

import SwiftUI

struct ContentView: View {
//    data variable to store the string that are going to appear in the list
    @State var data : [String] = []
    @State var userInput : String = ""
    @State var count : Int = 0
    var body: some View {
        
        NavigationView{
            VStack{
               Text("Number of tasks: \(count)")
//                .frame and . padding to align the zero to the left
                    .frame(maxWidth:  .infinity, alignment: .leading)
                    .padding()
//                text: $userInput to add the text the user types into the user input variable
                TextField("Type here...",text: $userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                HStack{
                    //            action is a calling or a paremeter
                    Button("Add Task", action:{
//                        exlamation point means not
//                        if the user doesnt type anything,meaning its empty, then dont run this code
                        if !userInput.isEmpty{
                            data.append(userInput)
                            count += 1
//                            empty array so that after the user adds the task, clear the input
                            userInput = ""
                        }
                       
                    })
//                    modifiers:
                    .padding()
//                    if the userInput is not empty, make the buttons background color gray
//                    if not make it blue
                    .background(!userInput.isEmpty ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Button("Remove All Tasks", action:{
                        count = 0
                        //                empty array so that it doesn't print anything
                        data = []
                        
                    })
                    .padding()
//                    if there is nothing on the list make the remove all taks button gray, if it is not empty, make it blue
                    .background(!data.isEmpty ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                Divider()
                    .padding()
//                creating a list
                List{
                    ForEach(data, id: \.self){item in
                        Text("\(item)")
                    }
                    .onDelete(perform: deleteItem)
                    
                }
            }.navigationTitle("To-Do List")
        }
    }
//    function so that you remove a task from the list and the count will go down 
    func deleteItem(offset: IndexSet){
        data.remove(atOffsets: offset)
        count -= 1
    }
    }

    #Preview {
        ContentView()
    }

