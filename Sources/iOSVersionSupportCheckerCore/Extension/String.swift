import Foundation

extension String {
    /*
     Truncates the string to the specified length number of characters and appends an optional trailing string if longer.
     - Parameter length: Desired maximum lengths of a string
     - Parameter trailing: A 'String' that will be appended after the truncation.

     - Returns: 'String' object.
     */
    func truncate(length: Int, trailing: String = "…") -> String {
        guard count > length else { return self }
        let trimmed = trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmed.count > length else { return trimmed }

        let truncated = trimmed.prefix(length)
        return truncated.trimmingCharacters(in: .whitespaces) + trailing
    }

    func padding(length: Int, character: String = " ") -> String {
        var str = self
        while str.count < length {
            str += character
        }
        return str
    }
}
