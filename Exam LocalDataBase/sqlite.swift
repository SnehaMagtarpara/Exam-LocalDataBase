//
//  sqlite.swift
//  Exam LocalDataBase
//
//  Created by R94 on 12/04/23.
//

import Foundation
import SQLite3
struct Model {
    var id:Int
    var name: String
}
class Sqlite{
    static var file: OpaquePointer?
    
    static func createfile()
    {
        var x = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        x.appendPathComponent("My Sqlite File1.db")
        sqlite3_open(x.path, &file)
        print(x.path)
        print("create file")
       createTable()
    }
    
    static func createTable()
    {
        let q = "Create table if not exists Students (name text,id integer)"
        var table: OpaquePointer?
        sqlite3_prepare(file, q, -1, &table, nil)
        print("create table")
        sqlite3_step(table)
    }

    static func addData(id:Int,name:String)
    {
        let q = "insert into students values('\(name)',\(id))"
        var data: OpaquePointer?
        sqlite3_prepare(file, q, -1, &data, nil)
        print("add data")
        sqlite3_step(data)
    }

    static func getData()->[Model]
    {
        var arr = [Model]()
        let q = "select name,id from students"
        var get:OpaquePointer?
        sqlite3_prepare(file, q, -1, &get, nil)
        
        while sqlite3_step(get) == SQLITE_ROW
        {
            let id = sqlite3_column_int64(get, 1)
            print("id = \(id);",terminator: "")
            if let cString = sqlite3_column_text(get, 0){
                let name = String(cString: cString)
                arr.append(Model(id: Int(id), name: name))
            }
        }
        print("Get data")
        return arr
    }
    
    static func deleteData(id:Int,name:String)
    {
        let q = "DELETE FROM students WHERE id = \(id)"
        var delete: OpaquePointer?
        sqlite3_prepare(file, q, -1, &delete, nil)
        print("delete data")
        sqlite3_step(delete)
    }
}

      
