import Foundation

public enum Mode {
    case ids([String])
    case file(String)
}

public enum Core {}

public extension Core {
    static func execute(mode: Mode) throws {
        let result: [AppInfo]
        switch mode {
        case let .file(path):
            result = try execute(filePath: path)
        case let .ids(ids):
            result = try execute(ids: ids)
        }

        let str = result.lazy
            .map { ($0.trackName.truncate(length: 10), $0.minimumOsVersion) }
            .map{ "|\t\($0.padding(length: 20))\t| \($1) |" }
            .joined(separator: "\n")

        print(str)
    }
}

extension Core {
    static func execute(filePath: String) throws -> [AppInfo] {
        throw VSCError.notImplemented
    }

    static func execute(ids: [String]) throws -> [AppInfo] {
        try ids.map(AppStoreAPI.lookup)
            .compactMap { try $0.get() }
    }
}
