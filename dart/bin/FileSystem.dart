import 'dart:io';



class FileSystemManager{
  
  void mkFolderTree(String treeFolders) {
    // Creates dir/ and dir/subdir/.
    new Directory(treeFolders).create(recursive: true)
      // The created directory is returned as a Future.
      .then((Directory directory) {
        print(directory.path);
    });
  }
 void mkFolderTreeIfNoExist(String treeFolders){
   
   final myDir = new Directory(treeFolders);
   myDir.exists().then((isThere) {
     if(isThere==true){
       print('exists' + treeFolders);
     }else{print('non-existent'+ treeFolders + '. Now I can Create it');
     mkFolderTree(treeFolders);}
   });
  }
}