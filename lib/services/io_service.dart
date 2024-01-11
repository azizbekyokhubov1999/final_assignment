import 'dart:io';
class IOService{

  ///print function
  static void write<T>(T str){
    stdout.write(str);
  }

  ///input  function
  static String read <T>(){
    return stdin.readLineSync() ?? "";
  }
}
  /// for parse
  extension Str_ex on String{
    int? parsing(){
    int? a = int.tryParse(this);
    if(a == null){
      while(a == null){
        print("incorrect number; try again!");
        a = int.tryParse(stdin.readLineSync()!);
      }
      print(a);
      return a;
    }else{
      print(a);
      return a;
    }
    }

    String preventNull(){
      String a = "";
      while(this == "" && a==""){
        IOService.write('Invalid character! Enter again --->');
        a = IOService.read();
      }
      return a;
    }
}
