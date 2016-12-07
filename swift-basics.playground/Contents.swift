import Foundation

// MARK: - Force! Casting

var statusCode: Int?

// print(statusCode!) // crash

if statusCode != nil {
  print(statusCode!) // Please don't do this.
}

statusCode = 200

if let statusCode = statusCode  {
  print(statusCode) // Int, niet Optional<Int>
}

// MARK: - ??

let result1 = statusCode // Optional<Int>

let result2 = statusCode ?? 200 // Int

// Which is the same as

let result3 = (statusCode == nil) ? 200 : statusCode! // of
let result4 = (statusCode != nil) ? statusCode! : 200

// MARK: - Enums

enum IntNumber: Int {
  case zero // = 0
  case one // = 1
}

enum StringNumber: String {
  case zero // = "zero"
  case one // = "one"
}

// Here, you get an initializer for free:

IntNumber(rawValue: 1) // .one
StringNumber(rawValue: "zero") // .zero

// MARK: - Initializer

struct Book {
  let title: String
  let author: String
}

Book(title: "De IJzeren Wil", author: "Bas Haring")

// MARK: Meer Enums

func track(number: IntNumber) {
  print(number.rawValue)
}

// You can call this as

track(number: IntNumber.zero) // 0

// .. but also as

track(number: .zero) // 0

// MARK: - Extensions

extension String {
  func localized() -> String {
    return NSLocalizedString(self, comment: "")
  }
}

"hello".localized()

extension Int {
  func times(task: (Int) -> Void) {
    (1...self).forEach {
      task($0)
    }
  }
}

3.times { number in
  print(number) // 1, 2, 3
}

// MARK: - Typealias
// https://github.com/BasThomas/Analysis


