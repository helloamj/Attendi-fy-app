import 'dart:math';
import './attendance.dart';
class Memes {
  static List<String> memepaths = [
    'assets/memes/0less/',
    'assets/memes/0-10/',
    'assets/memes/10-25/',
    'assets/memes/25-70/',
  ];

  static String getmemepath(int n) {
    int getnum() {
      var random = Random();
      return random.nextInt(6) + 1;
    }
    return '${memepaths[n]}${getnum()}.jpeg';
  }
  static String getmeme() {
    if(rep.hrs<0)
    {
      return getmemepath(0);
    }
    else if(rep.hrs>=0 && rep.hrs<=10)
    {
      return getmemepath(1);
    }
    else if(rep.hrs>10 && rep.hrs<=25)
    {
      return getmemepath(2);
    }
    return getmemepath(3);
  }
}
