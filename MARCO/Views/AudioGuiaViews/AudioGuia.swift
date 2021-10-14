//
//  AudioGuia.swift
//  MARCO
//
//  Created by Agustin Blanco on 12/10/21.
//

import SwiftUI
import AVFoundation

var player: AVAudioPlayer!

struct AudioGuia: View {
    private var numberOfImages = 5
    var body: some View {
        ZStack {
            Color("Beige")
                .edgesIgnoringSafeArea(.all)
            VStack {
                GeometryReader { proxy in
                    TabView {
                        ForEach(0..<numberOfImages) { num in
                            Image("RM No. "+"\(num)")
                                .resizable()
                                .scaledToFill()
                                .tag(num)
                        }
                    }.tabViewStyle(PageTabViewStyle())
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .padding()
                        .frame(width: proxy.size.width, height: proxy.size.height)
                }
                Text("Restablecer Memorias")
                    .font(.system(size: 24, weight: .semibold))
                    .frame(width: 380, height: 50, alignment: .leading)
                Text("Esta exposición presenta dos temas muy controversiales en la actualidad, la antigüedad asiática y la desaparición forzada de 43 estudiantes de Ayotzinapa.")
                    .frame(width: 380, alignment: .leading)
                    .padding(.bottom)
                HStack {
                    Image("Ai Weiwei")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                        .padding(.top)
                    Text("Ai WeiWei")
                        .font(.system(size: 24, weight: .semibold))
                        .frame(width: 100, height: 75, alignment: .center)
                        .padding(.top)
                }.frame(width: 380, height: 100, alignment: .leading)
                HStack {
                    Button(action: {
                        self.playSound()
                    }, label: {
                        HStack {
                            Image(systemName: "headphones")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                            Text("Audioguía")
                                .font(.system(size: 24))
                        }
                    }).frame(width: 200, height: 50, alignment: .center)
                    Button(action: {
                        self.stopSound()
                    }, label: {
                        HStack {
                            Image(systemName: "pause")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20)
                            Text("Detener")
                                .font(.system(size: 24))
                        }
                    }).frame(width: 200, height: 50, alignment: .center)
                }.padding(.top,50)
            }
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "AiWeiwei", withExtension: "mp3")
        guard url != nil else {
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player?.play()
        } catch {
            print("Error")
        }
    }
    
    func stopSound() {
        player.stop()
    }
}

struct AudioGuia_Previews: PreviewProvider {
    static var previews: some View {
        AudioGuia()
    }
}
