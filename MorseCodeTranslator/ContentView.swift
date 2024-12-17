//This is Main branch

import SwiftUI

struct ContentView: View {
    @State private var englishText: String = ""
    @State private var morseText: String = ""
    @State private var decodedMessage: String = ""
    
    // Dizionario Morse
    let letterToMorse: [String: String] = [
        "a": ".-", "b": "-...", "c": "-.-.", "d": "-..", "e": ".", "f": "..-.",
        "g": "--.", "h": "....", "i": "..", "j": ".---", "k": "-.-", "l": ".-..",
        "m": "--", "n": "-.", "o": "---", "p": ".--.", "q": "--.-", "r": ".-.",
        "s": "...", "t": "-", "u": "..-", "v": "...-", "w": ".--", "x": "-..-",
        "y": "-.--", "z": "--..", " ": "   "
    ]
    
    let morseToLetter: [String: String] = {
        var reverseDict: [String: String] = [:]
        for (letter, morse) in [
            "a": ".-", "b": "-...", "c": "-.-.", "d": "-..", "e": ".", "f": "..-.",
            "g": "--.", "h": "....", "i": "..", "j": ".---", "k": "-.-", "l": ".-..",
            "m": "--", "n": "-.", "o": "---", "p": ".--.", "q": "--.-", "r": ".-.",
            "s": "...", "t": "-", "u": "..-", "v": "...-", "w": ".--", "x": "-..-",
            "y": "-.--", "z": "--..", " ": "   "
        ] {
            reverseDict[morse] = letter
        }
        return reverseDict
    }()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Morse Code Translator")
                .font(.title)
                .bold()
            
            TextField("Enter English Text", text: $englishText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Convert to Morse") {
                morseText = convertToMorse(englishText)
            }
            .buttonStyle(.borderedProminent)
            
            Text("Morse Code: \(morseText)")
                .padding()
            
            TextField("Enter Morse Code", text: $decodedMessage)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Decode Morse") {
                englishText = decodeMorse(decodedMessage)
            }
            .buttonStyle(.borderedProminent)
            
            Text("Decoded Message: \(englishText)")
                .padding()
            
            Spacer()
        }
        .padding()
    }
    
    // Funzione per convertire in Morse
    func convertToMorse(_ text: String) -> String {
        var morseText = ""
        for char in text.lowercased() {
            if let morseChar = letterToMorse[String(char)] {
                morseText += morseChar + " "
            } else {
                morseText += "   "
            }
        }
        return morseText
    }
    
    // Funzione per decodificare Morse
    func decodeMorse(_ morse: String) -> String {
        let morseCodeArray = morse.split(separator: " ").map { String($0) }
        var decodedMessage = ""
        for morseValue in morseCodeArray {
            if let letter = morseToLetter[morseValue] {
                decodedMessage += letter
            } else {
                decodedMessage += " "
            }
        }
        return decodedMessage
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
