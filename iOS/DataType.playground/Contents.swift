import UIKit

// 데이터타입
// Bool : 참 거짓을 표현하기 위한 타입
var isChecked: Bool = false
isChecked = true

// Int : 64비트 정수형 타입
var temperature: Int = -100
temperature = 100

// UInt(Unsigned Integer) : 64비트 양의 정수형 타입
var cakes: UInt = 100
//cakes = -100 음수로 하면 에러 뜸

// Float : 32비트 부동소수형
var pi: Float = 3.14
pi = 314

// Double : 64비트 부동소수형
var pi2: Double = 3.14
pi2 = 314

// Character : 한 문자를 표현하기 위한 타입
var sampleCharacter: Character = "A"
sampleCharacter = "가"
// sampleCharacter = "가나다라" 문자열로 쓰면 에러 뜸

// String : 여러 문자를 표현하기 위한 타입
var sampleString: String = "Hi"
sampleString = "안녕하세요"

// 데이터 타입 지정 안했을 때
var test = 100
type(of: test)

var testString = "타입추론"
type(of: testString)

// Any : 모든 타입을 지칭하는 키워드
var sampleAny: Any = "any"
sampleAny = 10000
sampleAny = 3.14

// nil : 없음, 존재하지 않음-> 옵셔널 변수(?)로 선언해줘야 함
var sampleInt: Int? = nil
type(of: sampleInt)

var sampleString2: String? = nil
type(of: sampleString2)
