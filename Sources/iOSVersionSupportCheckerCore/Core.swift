import Foundation

public enum Mode {
    case ids([String])
    case file(String)
}

public enum Core {}

public extension Core {
    static func execute(mode: Mode, version: String? = nil) throws {
        let result: [AppInfo]
        switch mode {
        case let .file(path):
            result = try execute(filePath: path)
        case let .ids(ids):
            result = try execute(ids: ids)
        }

        guard !result.isEmpty else {
            print("no apps to detect")
            return
        }

        result.forEach { print($0) }

        if let version = version.flatMap(Version.init) {
            let versions = result.map(\.minimumOsVersion)
                .compactMap(Version.init)
            let supporting = versions.filter { $0 >= version }

            let supportingRate = Double(supporting.count) / Double(versions.count) * 100

            print(String(format: "Supporting iOS \(version) as minimum: %.2f%% (%d / %d)", supportingRate, supporting.count, versions.count))
        }
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
