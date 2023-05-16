import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class rep {
  static String? st;
  static List<TableRow> list3 = [];
  static List<List<String>> list2 = [];
  static List<String> lst = [];
  static double tp = 0, to = 0 , ta= 0,prcntnow=0,hrs=0,desiredprcnt = 0;

  static Widget getfirst()
  {
     prcntnow = (tp+to)/(tp+to+ta);
    if(prcntnow>(desiredprcnt/100))
    {
        hrs = ((desiredprcnt/100)*(tp+to+ta)-(tp+to))/(desiredprcnt/100);
       return Container(
        decoration: BoxDecoration(
          boxShadow: [
      BoxShadow(
        color: Colors.green.withOpacity(0.5),
        spreadRadius: 10,
        blurRadius: 10,
        offset: const Offset(0, 0),
      ),
    ],
          color:  Colors.green,
        ),
        margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(10.0),
          child: Text(
           'You can Leave ${double.parse(hrs.abs().toStringAsFixed(2)).floor()} Hours of Regular Classes to Reach ${desiredprcnt.toStringAsFixed(2)} % \n( Present Aggregate Attendance = ${(prcntnow*100).toStringAsFixed(2)} )',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              backgroundColor: Colors.green,
            ),
            textAlign: TextAlign.left,
                   ),
        );
    }
    else{
       hrs = ((desiredprcnt/100)*(tp+to+ta)-(tp+to))/(1-(rep.desiredprcnt/100));
       return Container(
        decoration:  BoxDecoration(
          boxShadow: [
      BoxShadow(
        color: Colors.red.withOpacity(0.5),
        spreadRadius: 10,
        blurRadius: 10,
        offset: const Offset(0, 0),
      ),
          ],
          color:  Colors.red,
        ),
        margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(10.0),
          child: Text(
           'You have to take ${double.parse(hrs.abs().toStringAsFixed(2)).ceil()} Hours of Regular Classes to Reach ${desiredprcnt.toStringAsFixed(2)} % \n( Present Aggregate Attendance = ${(prcntnow*100).toStringAsFixed(2)} )',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              backgroundColor: Colors.red,
            ),
            textAlign: TextAlign.left,
                   ),
        );
    }
  }
   static Widget getres(String s)
   {
      if(s.contains('Can Leave'))
      {
           return Container(
            
             color:  Colors.green,
             padding: const EdgeInsets.all(10.0),
             child: Text(
               s,
               style: GoogleFonts.roboto(
                 fontWeight: FontWeight.bold,
                 fontSize: 15,
                 backgroundColor: Colors.green,
               ),
               textAlign: TextAlign.center,
                      ),
           );
      }
      if(s.contains('To Take'))
      {
          return Container(
            color:  Colors.red,
            padding: const EdgeInsets.all(10.0),
            child: Text(
              s,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                
              ),
              textAlign: TextAlign.center,
                     ),
          );
      }
      return Container(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          s,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
                 ),
      );
   }
  static List<TableRow> gettable() {
    list2.removeAt(0);
    list2.removeAt(0);
    for (var x in list2) {
      List<Widget> lx = [];
      for (var y in x) {
        lx.add(getres(y));
      }

      list3.add(TableRow(children: lx));
    }
    return list3;
  }
}
