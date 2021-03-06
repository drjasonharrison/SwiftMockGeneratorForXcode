import SourceKittenFramework

class SKStructureRequest: StructureRequest {

    private class NoFileError: Error {}

    func getStructure(contents: String) throws -> [String: Any] {
        return Structure(file: SourceKittenFramework.File(contents: contents)).dictionary
    }

    func getStructure(filePath: String) throws -> ([String: Any], String) {
        guard let file = SourceKittenFramework.File(path: filePath) else {
            throw NoFileError()
        }
        let structure = Structure(file: file)
        return (structure.dictionary, file.contents)
    }
}
