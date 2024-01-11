///prints with border
void pBorder(Object? value){
  print('\x1b[51m $value \x1b[0m');
}

///prints bold
void pBold(Object? value){
  print('\x1B[1m $value \x1B[0m');
}

///prints in red color
void pRed(Object? value){
  print('\x1b[31m $value\x1b[0m');
}

///prints in green color
void pGreen(Object? value){
  print('\x1b[32m $value\x1b[0m');
}

///prints in blue color
void pBlue(Object? value){
  print('\x1b[34m $value\x1b[0m');
}

///prints the beginning of the top of the application
void printBeginning(){
  print("  ______________________________________________  ");
  print(" |                                              | ");
  print(" |                                              | ");
  pBold("|                📚TranslateApp📚             | ");
  print(" |                                              | ");

}

///prints the bottom of the application
void printExit() {
  print("  \t\t\t0. Exit ❌");
  printVoid();
  print(" |______________________________________________|\n");
}

///prints a void strings in order to fulfill the ui
void printVoid(){
  print(" |                                              |");
  print(" |                                              |");
}

///displays a menu
void displayMenu(List<String> actions, String menuName) {
  printBeginning();
  pBold("\t\t\t$menuName");
  printVoid(); printVoid();
  for (var element in actions) {
    print("\t\t\t$element");
  }
  printExit();
}