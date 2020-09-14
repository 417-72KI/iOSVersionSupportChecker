import Foundation

enum VSCError: Error {
    case invalidId(String)
    case noResult(id: String)
    case unknown
    case notImplemented
}
