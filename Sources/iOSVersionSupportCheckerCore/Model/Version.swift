import Foundation

struct Version {
    let major: Int
    let minor: Int
    let patch: Int
}

extension Version {
    init?(_ versionString: String) {
        let components = versionString
            .split(separator: ".", maxSplits: 2, omittingEmptySubsequences: false)
            .map(String.init)
            .compactMap(Int.init)
            .filter { $0 >= 0 }

        guard (1...3).contains(components.count) else { return nil }
        self.major = components[0]
        self.minor = components[safe: 1] ?? 0
        self.patch = components[safe: 2] ?? 0
    }
}

// MARK: - ExpressibleByStringLiteral
extension Version: ExpressibleByStringLiteral {
    init(stringLiteral value: StringLiteralType) {
        if let version = Self(value) {
            self = version
        } else {
            self.init(major: 0, minor: 0, patch: 0)
        }
    }
}

// MARK: - Comparable
extension Version: Comparable {
    static func < (lhs: Version, rhs: Version) -> Bool {
        switch (lhs.major == rhs.major, lhs.minor == rhs.minor) {
        case (true, true):
            return lhs.patch < rhs.patch
        case (true, false):
            return lhs.minor < rhs.minor
        case (false, _):
            return lhs.major < rhs.major
        }
    }
}

// MARK: - CustomStringConvertible
extension Version: CustomStringConvertible {
    var description: String { "\(major).\(minor).\(patch)" }
}
