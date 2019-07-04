import 'package:ansicolor/ansicolor.dart';

void printInfo(dynamic consoleLog){
    AnsiPen pen =  new AnsiPen()..blue();
    print(pen(consoleLog));
}

void printWarning(dynamic consoleLog){
    AnsiPen pen =  new AnsiPen()..yellow();
    print(pen(consoleLog));
}

void printError(dynamic consoleLog){
    AnsiPen pen =  new AnsiPen()..red(bg: true);
    if (consoleLog is String ){
        print(pen(consoleLog));
    }else {
        print(consoleLog);
    }
}

void printSuccess(dynamic consoleLog){
    AnsiPen pen =  new AnsiPen()..green();
    print(pen(consoleLog));
}

void printPurple(dynamic consoleLog){
    AnsiPen pen =  new AnsiPen()..xterm(091);
    print(pen(consoleLog));
}

void printPink(dynamic consoleLog){
    AnsiPen pen =  new AnsiPen()..xterm(013);
    print(pen(consoleLog));
}
