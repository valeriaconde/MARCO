//
//  ReservacionesView.swift
//  MARCO
//
//  Created by Valeria Conde on 10/15/21.
//
//

import SwiftUI
import UIKit

struct ReservacionesView: View {
    
    @State private var fecha = Date()
    @State private var personas = 0
    @State private var name = String()
    @State private var opcion = 2
    @State private var showAlert = false
    @State private var selectorIndex = 0
    @State private var guias = ["Aylin", "Valeria", "Rodrigo"]
    @State private var horariosDisponibles = [HorarioModel]()
    @State private var guia = String()
    @State private var horario = String()
    @State private var guiasDisponibles = [String]()
    
    @EnvironmentObject private var reservaVM : ReservaViewModel
    
    private var dateProxy:Binding<Date> {
        
        Binding<Date>(get: {self.fecha }, set: {
            self.fecha = $0
            print(fecha)
            
        })
    }
    
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: Date())!
        return min...max
    }
    
    var body: some View {
        
        
        NavigationView{
        ZStack{
            Color("White")
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack{
                    VStack{
                        Head(title: "#Reservaciones")
                            .padding(.bottom, 50)
                        
                        ZStack{
                            HStack{
                                Link(destination: URL(string: "https://www.marco.org.mx//boletos/")!){
                                    VStack{
                                        Image(systemName: "ticket.fill")
                                            .foregroundColor(.black)
                                            .font(.largeTitle)
                                            .padding(.bottom, -3)
                                        Text("Compra boletos").foregroundColor(Color("Rose"))
                                    }
                                }
                                .padding(.horizontal, 30)
                                    
                                Link(destination: URL(string: "https://www.marco.org.mx/restaurante/")!){
                                    VStack{
                                        Image("icono_restaurante").foregroundColor(Color("Rose"))
                                        Text("Restaurantes").foregroundColor(Color("Rose"))
                                    }
                                } // link
                                .padding(.horizontal, 30)
                                    
                            } //hstack
                        } // zstack
                    
                        
                        VStack(alignment: .leading){
                            // Calendario
                            Text("Reserva una visita guiada")
                                .font(.title2)
                                .padding(.top, 15)
                                .padding(.bottom, 15)
                                .foregroundColor(Color("Rose"))

                            DatePicker("Reservaciones", selection: $fecha, in: Date()..., displayedComponents: [.date])
                                 .datePickerStyle(GraphicalDatePickerStyle())
                                 .accentColor(Color("Rose"))
                                 .environment(\.locale, Locale.init(identifier: "es"))
                                 .onChange(of: fecha, perform: { value in
                                    //Modifique la funcion para que regrese los horarios en cuanto termine la función
                                    reservaVM.getHorariosDisponibles(date: fecha) { (horarios) in
                                        DispatchQueue.main.async {
                                            self.horariosDisponibles = horarios
                                        }
                                    }
                                })

                            // FECHAS CON HORARIOS
                            // 21 de octubre y 2 de noviembre
                            // Botones de horarios
                            Text("Horarios disponibles")
                                .bold()
                                
                            VStack(alignment: .leading){
                                
                                if horariosDisponibles.isEmpty {
                                    Text("No hay horarios disponibles en esta fecha")
                                }
                                
                                // Para generar los botones de las horas
                                ForEach(horariosDisponibles) { item in
                                    
                                    Button(action: {
                                        // Guarda la hora seleccionada
                                        horario = item.hora
                                        
                                        // Lo que hariamos si supieramos programar
                                        getGuias(item: item.hora, date: fecha)
                                        ForEach(guiasDisponibles, id: \.self) { it in
                                            Text(it)
                                        }
                                        
                                        // Success print nomas pa saber
                                        print("boton picado")
                                    
                                    }, label: {
                                        Text(item.hora)
                                            .foregroundColor(Color("Rose"))
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 12)
                                                    .stroke(Color("Rose"), lineWidth: 4)
                                            )
                                    }) // button
                                } // foreach
                                
                                Text("Elige tu guía")
                                    .bold()
                                    .padding(.top)
                                
                                // Botones de guias
                                VStack{
                                    if !horariosDisponibles.isEmpty {
                                        
                                        ForEach(0..<guias.count) { index in
                                            Button(action: {
                                                guia = (self.guias[index])
                                            }, label: {
                                            Text(self.guias[index]).tag(index)
                                            })
                                            .foregroundColor(Color("Rose"))
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 12)
                                                    .stroke(Color("Rose"), lineWidth: 2)
                                                //.frame(width: 100)
                                            ) // overlay of button
                                        } // for each
                                    } // if
                                } // vstack botones guias
                                .padding(.bottom)
                            } // vstack
                            
                            
                            // Picker para numero de personas en la reserva
                            Text("Reservacion para \(personas) personas")
                                .bold()
                            Picker("", selection: $personas){
                                ForEach(1...10, id: \.self){
                                    Text("\($0)")
                                }
                            }
                            
                            // Textfield para recibir nombre de la persona de la reserva
                            Text("Reservacion a nombre de: \(name) ")
                                .bold()
                            TextField("Enter your name", text: $name)
                                         
                                
                            // boton para concluir la reserva
                            Button(action: {
                                // Call to view model
                                 reservaVM.reservarVisita(date: fecha, horario: horario, guia: guia, personas: personas, usuario: name)
                                
                                // Confirmation alert
                                showAlert = true
                            }) {
                                Text("Reservar")
                                    .frame(width: 200 , height: 50, alignment: .center)
                            }
                                .foregroundColor(.white)
                                .background(Color("Rose"))
                                .frame(width: 100)
                                .position(x: 185, y: 50)
                                .alert(isPresented: $showAlert) {
                                    Alert(title: Text("Reservado"), message: Text("Reservacion a nombre de \(name) para \(personas) personas el \(fecha) en el \(horario) guiados por \(guia)"), dismissButton: .default(Text("Ok")))
                                }
                                
                            } // vstack
                            .padding(28)
                        } // vstack
                    } // vstack
                } // scrollview
            } // zstack
        } // navigation view
    } // body
    
    func getGuias(item: String, date: Date) {
        
        reservaVM.getGuiasDisponibles(date: fecha, horario: item, completion: { (result) -> Void in
            print("Second line of code executed")
            if !result.isEmpty { // this will be equal to whatever value is set in this method call
                self.guiasDisponibles = result
                
                print("true")
            } else {
                 print("false")
            }
        })
       
    }
    
} // struct

struct ReservacionesView_Previews: PreviewProvider {
    static var previews: some View {
        ReservacionesView()
    }
}
