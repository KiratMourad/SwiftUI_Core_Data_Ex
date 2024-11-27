//
//  ContentView.swift
//  CoreDataExampleApp
//
//  Created by Mourad KIRAT on 18/02/2024.
//

import SwiftUI

import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [])
    private var people: FetchedResults<Person>

    @State private var name = ""
    @State private var age = ""
    @State private var address = ""
    @FocusState private var isFocused: Bool
    @FocusState private var isFocused1: Bool
    @FocusState private var isFocused2: Bool

    var body: some View {
        VStack {
            VStack {
                // Title
                if #available(iOS 16.0, *) {
                Form {
                    Section(header:Text("Add Person")
                    
                        .foregroundColor(Color.gray)
                        .font(.headline)){
                        
                        
                            
                             TextField("Name", text: Binding(
                                 get: { name },
                                 set:
                                     { (newValue, _) in
                                         if let _ = newValue.lastIndex(of: "\n") {
                                             isFocused = false
                                         } else {
                                             name = newValue
                                         }
                                     }
                               ), axis: .vertical)
                             .foregroundColor(Color.black)
                             .font(.system(size: 18))
                                 .frame(maxWidth: .infinity, alignment: .leading)
                                 .textFieldStyle(.plain)
                                 .submitLabel(.done)
                                 .focused($isFocused)

                                 .multilineTextAlignment(.leading)
                              
                                 .padding(.leading, 17)
                               
                                
                                
                         
                  
                    } .listRowBackground(Color.white)
                    Section{
                   
                           
                            TextField("Age", text: Binding(
                                get: { age },
                                set:
                                    { (newValue, _) in
                                        if let _ = newValue.lastIndex(of: "\n") {
                                            isFocused1 = false
                                        } else {
                                            age = newValue
                                        }
                                    }
                              ), axis: .vertical)
                            
                            .font(.system(size: 18))
                            

                                .frame(maxWidth: .infinity, alignment: .leading)
                                .textFieldStyle(.plain)
                                .submitLabel(.done)
                                .focused($isFocused1)

                                .multilineTextAlignment(.leading)
                             
                                .padding(.leading, 17)
                              
                               
                               
                        
                    } .listRowBackground(Color.white)
                    
                    Section{
                       
                           
                            TextField("address", text: Binding(
                                get: { address },
                                set:
                                    { (newValue, _) in
                                        if let _ = newValue.lastIndex(of: "\n") {
                                            isFocused2 = false
                                        } else {
                                            address = newValue
                                        }
                                    }
                              ), axis: .vertical)
                            
                            .font(.system(size: 18))
                            

                                .frame(maxWidth: .infinity, alignment: .leading)
                                .textFieldStyle(.plain)
                                .submitLabel(.done)
                                .focused($isFocused2)

                                .multilineTextAlignment(.leading)
                             
                                .padding(.leading, 17)
                              
                               
                               
                        
                    } .listRowBackground(Color.white)
                    Section{
                        Button(action: {
                            savePerson()
                        } ) {
                            HStack(spacing: 10){
                                Text("Save")
                                    .foregroundColor(Color.black)
                                   
                                    .font(.system(size: 22))
                            
                            Label("", systemImage: "folder.fill.badge.plus")
                                    .foregroundColor(Color.black)
                                   
                                    .font(.system(size: 22))
                            
                            } .frame(maxWidth: .infinity, alignment: .center)
                        }
                  
                    } .listRowBackground(Color.cyan) // End section
                }.tint( Color.white)
                    .background( Color.black)
                    .scrollContentBackground(.hidden)// End Form
                }
            }.background( Color.init(UIColor(hexString:  "#FCFCFC")))
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .cornerRadius(15)
                    .shadow(color: Color.init(UIColor(hexString: "#000000" )).opacity(0.2), radius: 10.0, x: -10.0, y: -10.0)
                    .padding(10)
           
            

            List {
                ForEach(people) { person in
                    VStack(spacing: 10) {
                    Text("Name :" + "\(person.name ?? "")").frame(maxWidth: .infinity,alignment: .leading)
                    Text("Age :" + "\(person.age ?? 1)" ) .frame(maxWidth: .infinity,alignment: .leading)
                    Text("Address :" + "\(person.address ?? "")").frame(maxWidth: .infinity,alignment: .leading)
                    }
                }
                .onDelete(perform: deletePerson)
            }.background( Color.init(UIColor(hexString:  "#FCFCFC")))
                .frame(maxWidth: .infinity)
                    .cornerRadius(15)
                    .shadow(color: Color.init(UIColor(hexString: "#000000" )).opacity(0.2), radius: 10.0, x: -10.0, y: -10.0)
                    .padding(10)
        }
    }
// Add Person
    private func savePerson() {
        withAnimation {
            let newPerson = Person(context: viewContext)
            newPerson.name = name
            newPerson.age = Int64(age) ?? 0
            newPerson.address = address

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }

            // Reset fields after saving
            name = ""
            age = ""
            address = ""
        }
    }
// delete Person
    private func deletePerson(offsets: IndexSet) {
        withAnimation {
            offsets.map { people[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
