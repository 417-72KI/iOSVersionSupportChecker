import iOSVersionSupportCheckerCore
import ArgumentParser


struct iOSVersionSupportChecker: ParsableCommand {
    @Option(name: .shortAndLong, help: "Read a file with 1 ID on each line")
    var file: String?

    @Argument(help: "App ID includes in `https://apps.apple.com/jp/app/<app-title>/<here>`")
    var ids: [String] = []

    @Option(name: .shortAndLong, help: "If set, calculate supporting rate of the minimum supporting version.")
    var version: String?

    func run() throws {
        let mode: Mode
        if let file = file {
            mode = .file(file)
        } else {
            mode = .ids(ids)
        }
        try Core.execute(mode: mode, version: version)
    }
}

iOSVersionSupportChecker.main()
