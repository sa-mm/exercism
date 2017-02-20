//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

func hello(_ personName: String = "World") -> String {
    return "Hello, \(personName)!"
}

hello("Alice")