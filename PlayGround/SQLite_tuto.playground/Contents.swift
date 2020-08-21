import UIKit
import SQLite3

struct Info : Codable{

    let grade : String
    let studentID : Int
    let general : String
    
}
class DBHelper {
    
    static let shared = DBHelper()
    
    var db : OpaquePointer?
    var path = "mySqlite.sqlite"
    init(){
        self.db = createDB()
        self.createTable()
    }
    
    func createDB() -> OpaquePointer? {
        
        var db : OpaquePointer? = nil
        do {
            
        let filePath = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathExtension(path)
            
            if sqlite3_open(filePath.path, &db) == SQLITE_OK {
                print("Succesfully create Database path : \(filePath.path)")
                return db
            }
            
        }
        catch{
            print("ERROR in CreateDB - \(error.localizedDescription)")
        }
        
        print("ERROR in CreateDB - sqlite3_open ")
        return nil
        
    }
    
    func disConectDB(){
        sqlite3_close(db)
    }
    
    func createTable(){
        //AUTOINCREMENT를 사용하기 위해서는 INT 가 아니라 INTEGER을 사용해야 한다.
        let query = "create table if not exists myDB(id INTEGER primary key autoincrement, name text not null, info text not null);"
        
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Create Table SuccessFully \(String(describing: db))")
            }
            else{
                let errorMessage = String(cString: sqlite3_errmsg(db))
                print("\n Create Table step fail :  \(errorMessage)")
            }
        }
        else{
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\n create Table sqlite3_prepare Fail ! :\(errorMessage)")
            
        }

        sqlite3_finalize(statement)
    }
    
    func deleteTable(){
        let query = "DROP TABLE myDB"
        
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Delete Table SuccessFully \(String(describing: db))")
            }
            else{
                let errorMessage = String(cString: sqlite3_errmsg(db))
                print("\n Delete Table step fail ! : \(errorMessage)")
                
            }
        }
        else{
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\n delete Table prepare fail! : \(errorMessage)")
            
        }
        
        sqlite3_finalize(statement)
    }
    
    
    func insertData(name : String, studentInfo: Info ){
        
        //autocrement일 경우에는 입력 부분에서는 컬럼을 추가 안해줘도 자동으로 추가가 되지만
        //쿼리 문에서는 이렇게 추가 해줘야합니다.
        let query = "insert into myDB (id, name, info) values (?,?,?);"
        
        var statement : OpaquePointer? = nil
        
        do {
            //이렇게 데이터를 인코등 해주고 그 데이터를 String으로 변형 해준다.
            //왜냐하면 bind 해줄 때 data 타입이 없기 때문이다.
        let data = try JSONEncoder().encode(studentInfo)
        let dataToString = String(data: data, encoding: .utf8)
        
            print(dataToString!)
            
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            //insert는 read와 다르게 컬럼의 순서의 시작을 1 부터 한다.
            //따라서 id가 없기 때문에 2로 시작한다.
            sqlite3_bind_text(statement, 2, NSString(string: name).utf8String , -1, nil)
            sqlite3_bind_text(statement, 3, NSString(string: dataToString!).utf8String , -1, nil)
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Insert data SuccessFully : \(String(describing: db))")
            }
            else{
                let errorMessage = String(cString: sqlite3_errmsg(db))
                print("\n insert Data sqlite3 step fail! : \(errorMessage)")
            }
        }
        else{
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\n insert Data prepare fail! : \(errorMessage)")
        }
            
        
        sqlite3_finalize(statement)
            
        }
        catch{
            print("JSONEncoder Error : \(error.localizedDescription)")
        }
    }
    
    func readData() {
        
        let query = "select * from myDB;"
        
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            
            while sqlite3_step(statement) == SQLITE_ROW{
                
                let id = sqlite3_column_int(statement, 0)
                
                
                //만약에 컬럼이 name 하나 뿐이 였다면 반환되는 결과물도 name 하나 뿐이기 때문에
                //이 부분이 1이 아니라 0이 되어야 한다.
                let name =  String(cString: sqlite3_column_text(statement, 1))
                let studentInfo = String(cString: sqlite3_column_text(statement, 2))
                
                do{
                    //sql에 data 타입이 아니라 String 타입으로 저장이 되어 있기 때문에, 반드시 String 타입을 data 타입으로 변경해서 디코드 해줘야한다.
                    let data = try JSONDecoder().decode(Info.self, from: studentInfo.data(using: .utf8)!)
                    print("readData Result : \(id) \(name) \(data)")
                }
                catch{
                    print("JSONDecoder Error : \(error.localizedDescription)")
                }
                
                
            }
            
//            if sqlite3_step(statement) == SQLITE_ROW{
//                let id = sqlite3_column_int(statement, 0)
//                               let name =  String(cString: sqlite3_column_text(statement, 1))
//
//                               print("readData Result : \(id) \(name)")
//            }
//            else{
//                let errorMessage = String(cString: sqlite3_errmsg(db))
//                print("\n insert Data prepare fail! : \(errorMessage)")
//            }
            
        }
        else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\n read Data prepare fail! : \(errorMessage)")
        }
        
        sqlite3_finalize(statement)
        
    }
    
    func deleteData(){
        let query = "delete from myDB where id >= 2;"
        
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            
            if sqlite3_step(statement) == SQLITE_DONE {
                 print("Delete data SuccessFully : \(String(describing: db))")
            }
            else{
                let errorMessage = String(cString: sqlite3_errmsg(db))
                print("\n delete Data prepare fail! : \(errorMessage)")
            }
            
        }
        else{
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\n delete Data prepare fail! : \(errorMessage)")
        }
        
        sqlite3_finalize(statement)
    }
    
    func updateData(){
        
        let query = "update myDB set id = 2 where id = 5;"
        
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            
            if sqlite3_step(statement) == SQLITE_DONE {
                 print("Update data SuccessFully : \(String(describing: db))")
            }
            else{
                let errorMessage = String(cString: sqlite3_errmsg(db))
                print("\n delete Data prepare fail! : \(errorMessage)")
            }
            
        }
        else{
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\n delete Data prepare fail! : \(errorMessage)")
        }
        
        sqlite3_finalize(statement)
    }
    
}

//싱글톤으로 이용하는 방법
let myDB = DBHelper.shared

//let myDB = DBHelper()
//myDB.insertData(name: "TaeSOO", studentInfo: Info(grade: "B+", studentID: 201520, general: "male"))
//myDB.updateData()
myDB.readData()
//myDB.deleteData()
//myDB.deleteTable()
//myDB.disConectDB()



//참고 사이트

//https://www.raywenderlich.com/6620276-sqlite-with-swift-tutorial-getting-started

//https://medium.com/@imbilalhassan/saving-data-in-sqlite-db-in-ios-using-swift-4-76b743d3ce0e
