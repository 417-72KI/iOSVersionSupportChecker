import Foundation

struct AppInfo: Decodable {
    var trackId: Int
    var trackName: String
    var minimumOsVersion: String
}

extension AppInfo: CustomStringConvertible {
    var description: String { "\(trackName): \(minimumOsVersion)" }
}
