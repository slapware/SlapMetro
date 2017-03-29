//
//  MtaData.swift
//  SlapMetro
//
//  Created by Stephen La Pierre on 3/21/17.
//  Copyright © 2017 Stephen La Pierre. All rights reserved.
//

import UIKit

class MtaData {
    // class definition goes here
    var xml: String
    var subwayArray: [Line] = []
    var lirrArray: [Line] = []
    var metroArray: [Line] = []
    var bridgeArray: [Line] = []
    
    init() {
        // perform some initialization here
        xml = ""
        getData()
    }
// MARK: Get the data to parse -
    func getData() {
    let url = URL(string: "http://mta.info/status/serviceStatus.txt")
    let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
        if let data = data,
             let pxml = String(data: data, encoding: String.Encoding.utf8) {
              self.xml = "<doc>" + pxml + "</doc>"
            self.parseData()
        }
    }
    task.resume()
  } // getData
// MARK: XML Parsing -
    func parseData() {
        if let data = self.xml.data(using: .utf16) { // Get the NSData
            let xmlParser = XMLParser(data: data)
            let delegate = MtaDelegate() // This is your own delegate - see below
            xmlParser.delegate = delegate
            if xmlParser.parse() {
                self.subwayArray = delegate.subwayArray
                self.lirrArray = delegate.lirrArray
                self.metroArray = delegate.metroArray
                self.bridgeArray = delegate.bridgeArray
            }
        }
    } // parseData
    
// MARK: Refresh data -
    func refresh() {
        self.subwayArray.removeAll()
        self.lirrArray.removeAll()
        self.metroArray.removeAll()
        self.bridgeArray.removeAll()
        self.getData()
    }

} // MtaData

class MtaDelegate: NSObject, XMLParserDelegate {
    // Simple state machine to capture fields and add completed Line to array
    var subwayArray: [Line] = []
    var lirrArray: [Line] = []
    var metroArray: [Line] = []
    var bridgeArray: [Line] = []
    enum State { case none, name, status, text, Date, Time }
    var state: State = .none
    var newLine: Line? = nil
    var lineType: String?
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        switch elementName {
        case "subway":
            self.lineType = "subway"
            self.state = .none
        case "LIRR":
            self.lineType = "LIRR"
            self.state = .none
        case "MetroNorth":
            self.lineType = "MetroNorth"
            self.state = .none
        case "BT":
            self.lineType = "BT"
            self.state = .none
        case "line":
            self.newLine = Line()
            self.state = .none
        case "name":
            self.state = .name
        case "status":
            self.state = .status
        case "text":
            self.state = .text
        case "Date":
            self.state = .Date
        case "Time":
            self.state = .Time
        default:
            self.state = .none
        }
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
         if let newLine = self.newLine, elementName == "line", lineType == "subway"  {
            self.subwayArray.append(newLine)
            self.newLine = nil
        }
         if let newLine = self.newLine, elementName == "line", lineType == "LIRR" {
            self.lirrArray.append(newLine)
            self.newLine = nil
        }
        if let newLine = self.newLine, elementName == "line" && lineType == "MetroNorth" {
            self.metroArray.append(newLine)
            self.newLine = nil
        }
        if let newLine = self.newLine, elementName == "line" && lineType == "BT" {
            self.bridgeArray.append(newLine)
            self.newLine = nil
        }
        if elementName == "subway" {
            self.lineType = ""
        }
        if elementName == "LIRR" {
            self.lineType = ""
        }
        if elementName == "MetroNorth" {
            self.lineType = ""
        }
        if elementName == "BT" {
            self.lineType = ""
        }

        self.state = .none
    }
// MARK: note text fied is appened as long -
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        guard let _ = self.newLine else { return }
        switch self.state {
        case .name:
            self.newLine!.name = string
        case .status:
            self.newLine!.status = string
        case .text:
            self.newLine!.text += string
        case .Date:
            self.newLine!.Date = string
        case .Time:
            self.newLine!.Time = string
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
    }
    
}
