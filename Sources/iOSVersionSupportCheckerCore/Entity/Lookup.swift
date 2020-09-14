import Foundation

struct LookupResponse: Decodable {
    var resultCount: Int
    var results: [AppInfo]
}
