import Foundation

public enum Mode {
    case ids([String])
    case file(String)
}

public enum Core {}

public extension Core {
    static func execute(mode: Mode) throws {
        print(mode)
    }
}
