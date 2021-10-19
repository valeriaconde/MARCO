//
//  Script.swift
//  prueba
//
//  Created by user192207 on 10/13/21.
//

import SwiftUI

struct Script: View {
    @State private var texto: String = "Ai Weiwei (28 de agosto de 1957, Beijing) es un activista y artista contemporáneo chino. Colaboró con los arquitectos suizos Herzog & de Meuron como asesor artístico en el Estadio Nacional de Pekín para los Juegos Olímpicos de 2008. Como activista, ha criticado constantemente al gobierno chino por su postura respecto a la democracia y los derechos humanos. También ha investigado corrupción gubernamental y encubrimientos en China, particularmente el caso del derrumbe de escuelas en Sichuan tras el terremoto de 2008. El 3 de abril de 2011 fue detenido en el aeropuerto internacional de Pekín, estuvo bajo arresto durante 81 días sin cargos oficiales. Desde que se le permitió salir de China en 2015, ha vivido en Berlín, Alemania."
    var body: some View {
        VStack(alignment: .leading, spacing: 200){
            ExpandableText(texto, lineLimit: 6)
        }
        .frame(width: 350)
        
        
         /*   .multilineTextAlignment(.leading)
            .frame(width: 330, height: 100, alignment: .leading)
            .padding() */
    
    }
}

struct Script_Previews: PreviewProvider {
    static var previews: some View {
        Script()
    }
}
