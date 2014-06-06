import 'FileSystem.dart';

void main() {
  print("Hello, World!");
  
  //FileSytem Manager 
  FileSystemManager fsm = new FileSystemManager();
  
  fsm.mkFolderTree("Test/SubTest/FinalTest");
  fsm.mkFolderTreeIfNoExist("Test/SubTest/FinalTest2");
}
