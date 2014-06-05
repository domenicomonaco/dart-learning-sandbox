import 'dart:io';



class FileSystemManager{
  void FileSystem(String treeFolders) {
    // Creates dir/ and dir/subdir/.
    new Directory(treeFolders).create(recursive: true)
      // The created directory is returned as a Future.
      .then((Directory directory) {
        print(directory.path);
    });
    
    
  }
}