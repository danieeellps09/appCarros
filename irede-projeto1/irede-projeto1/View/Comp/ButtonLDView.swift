//
//  ButtonLDView.swift
//  irede-projeto1
//
//  Created by levi soares on 05/07/24.
//

import SwiftUI

struct ButtonLDView: View {
    @Binding var isDark : Bool
    var body: some View {
        Button(action:{isDark.toggle()},label:{ isDark ? Image(systemName: "moon.fill").foregroundStyle(.white): Image(systemName: "sun.max.fill").foregroundStyle(.black)
                })
            }
    }

            

struct ButtonLDView_Previews: PreviewProvider {
    static var previews: some View{
        ButtonLDView(isDark: .constant(false))
    }
    }


