import UIKit


// ---- 첫번째 질문 ----
// 요약:
// Map은 A object 리스트에서  B object 리스트로 변환시 사용
// - B로 변환 실패하면 nil을 넘김
// - 변환 결과에 nil 포함
// CompactMap은 nil을 넘기지 않음


let stringValues = ["hi", "1", "3", "hello"]

/// Map vs CompactMap

let intValuesWithMap = stringValues.map { string in
    return Int(string)
}
intValuesWithMap
// [nil, 1, 3, nil]

let intValueWithCompactMap = stringValues.compactMap { string in
    return Int(string)
}
intValueWithCompactMap
// [1, 3]


/// for loop로 위에 map과 compact  map을 생각해보면

// Map 을 for loop로
var listCanContainNil: [Int?] = []
for string in stringValues {
    let int = Int(string)
    listCanContainNil.append(int)
}
listCanContainNil
// [nil, 1, 3, nil]


// CompactMap을 for loop로
var listDoNotContainNil: [Int] = []
for string in stringValues {
    if let int = Int(string) {
        listDoNotContainNil.append(int)
    }
}
listDoNotContainNil
// [1, 3]






// --- 두번째 질문 ----

// 요약:
// Dictionary(group:)은 A object 리스트를 특정 기준에 따라서 나눠서 담고 싶을때 사용

struct Track {
    let title: String
    let artist: String
    let albumTitle: String
}


let track1 = Track(title: "아무노래", artist: "지코", albumTitle: "8집")
let track2 = Track(title: "터프쿠키", artist: "지코", albumTitle: "8집")
let track3 = Track(title: "거북선", artist: "송민호", albumTitle: "쇼미더6")

let tracks = [track1, track2, track3]

// tracks를 앨범명 대로 다시 묵어주고 싶다
let albumDic = Dictionary(grouping: tracks) { track in
    return track.albumTitle
}
albumDic
//["쇼미더6": [track3], "8집": [track1, track2]]


// --- 두번째 추가 질문 ---
// https://docs.swift.org/swift-book/LanguageGuide/Functions.html
// (Swift 공식 Doc - Function Argument Labels and Parameter Names)

// 요약:
// 함수를 실제 사용할때, 외부에서 보여지는 argument이름을 특정 지어주고 싶을때 argument 이름을 추가로 써줌


func track(index: Int) -> Track {
    return tracks[index]
}
track(index: 0)

func track(at index: Int) -> Track {
    return tracks[index]
}
track(at: 0)

// 위에 함수 둘다 track리스트에서 n번째 해당하는 것을 가져오는 것인데요
// 코드도 사람이 읽는 글이라고 생각했을 때, track(at:) 이 track(index:) 보다 더 읽기가 편해서 argument name을 추가로 작성했습니다.


var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
