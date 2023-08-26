import SwiftUI

struct ContentView: View {
    
   // var myArray = [String]()
  //  let myLargeDic = myDic(myArray: myArray1)
    
    
    var body: some View {
        VStack {
          //  Button("Print Dictionary", action: myFunc)
        }
    }
    
    var MyDic: [String]  {
        var myArray = [String]()
        guard let url = Bundle.main.url(forResource: "es_ANY", withExtension: "dic") else {
            fatalError("Cannot find dictionary.txt")
        }
        
        guard let contents = try? String(contentsOf: url) else {
            fatalError("Couldn't load dictionary.txt")
        }
        print(contents)
        let myTempArray = contents.components(separatedBy: .newlines)
        
        for var str in myTempArray {
            if let dotRange = str.range(of: "/") {
                str.removeSubrange(dotRange.lowerBound..<str.endIndex)
                myArray.append(str)
            } else {
                myArray.append(str)
            }
            
        }
        print(myArray)
        return myArray
    }
}
