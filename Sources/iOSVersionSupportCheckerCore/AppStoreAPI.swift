import Foundation

let baseUrl = "https://itunes.apple.com/lookup?id=%@&country=JP"

enum AppStoreAPI {
    static let semaphore = DispatchSemaphore(value: 0)

    static func lookup(id: String) -> Result<AppInfo, Error> {
        if id.starts(with: "id") {
            var id = id
            id.removeFirst(2)
            return lookup(id: id)
        }
        guard let _ = Int(id) else { return .failure(VSCError.invalidId(id)) }
        let url = URL(string: String(format: baseUrl, id))!

        var result: Result<AppInfo, Error> = .failure(VSCError.unknown)

        URLSession.shared.dataTask(with: url) { data, _, error in
            defer { semaphore.signal() }

            if let error = error {
                result = .failure(error)
                return
            }
            guard let data = data else {
                result = .failure(VSCError.unknown)
                return
            }
            do {
                let response = try JSONDecoder().decode(LookupResponse.self, from: data)

                guard let appInfo = response.results.first else {
                    result = .failure(VSCError.noResult(id: id))
                    return
                }
                result = .success(appInfo)
            } catch {
                result = .failure(error)
            }
        }.resume()
        semaphore.wait()

        return result
    }
}
