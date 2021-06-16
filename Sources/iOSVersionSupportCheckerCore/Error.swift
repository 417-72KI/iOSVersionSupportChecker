import Foundation

enum VSCError: Error {
    case fileNotExist(String)
    case invalidId(String)
    case noResult(id: String)
    case unknown
    case notImplemented
}
