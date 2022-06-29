import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:center_side/compount/colors.dart';
import 'package:center_side/compount/texts.dart';
import 'package:center_side/uses/share_data.dart';
import 'package:center_side/compount/texts.dart';


class monthData{

  final String month;
  final int count;
  Color color=Colors.green;
  String monthString="";

  monthData(this.month, this.count);



}


class ByMonth extends StatelessWidget {
  List<Map<String,dynamic>> months;


  ByMonth({Key? key,required this.months}) : super(key: key);

  List<monthData> _data=[];




  void init(){
 print("ByMonth init");
   /* for(var e in months){
     // print(e);
      monthData newM=monthData(e["month"].toString(),e["count"]);
      if(newM.count>0) newM.color=Colors.lightGreen;
      if(newM.count>1) newM.color=Colors.blue;
      if(newM.count>3) newM.color=Colors.purpleAccent;
      if(newM.count>5) newM.color=Colors.yellow;
      if(newM.count>8) newM.color=Colors.red;
      if(data.language==0) newM.monthString=my_texts.getMonthInEnglish(int.parse(newM.month));
      if(data.language==1) newM.monthString=my_texts.getMonthInHebroe(int.parse(newM.month));
      if(data.language==2) newM.monthString=my_texts.getMonthInArabic(int.parse(newM.month));
      _data.add(newM);

    }*/
 print("looop");
    for(int i=1;i<=12;i++){
      String month=my_texts.getMonthInEnglish(i);
      print(i);
      print(month);
      int count=0;

      if(i==1 || i==3 ){
        count=5;
      }
      if(i==2){
        count=2;
      }
      if(i==4){
        count=8;
      }
      if(i==5){
        count=9;
      }
      if(i==6){
        count=4;
      }

      monthData newM=monthData(month,count);

      if(newM.count>0) newM.color=Colors.lightGreen;
      if(newM.count>1) newM.color=Colors.blue;
      if(newM.count>3) newM.color=Colors.purpleAccent;
      if(newM.count>5) newM.color=Colors.yellow;
      if(newM.count>8) newM.color=Colors.red;
      _data.add(newM);


    }




    for(monthData m in _data){
      print("month:${m.month}, count:${m.count}");
    }



  }




  @override
  Widget build(BuildContext context) {
    init();
    return Container(
      height:600,
      width: 800,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          color: app_colors.background,
          borderRadius: BorderRadius.circular(10),
          boxShadow:[
            BoxShadow(
                color: app_colors.buttom_shadow,
                blurRadius: 20,
                offset: Offset(8,5)

            ),
            BoxShadow(
                color: app_colors.buttom_shadow,
                blurRadius: 20,
                offset: Offset(-8,-5)
            ),
          ]
      ),
      child:SfCartesianChart(
        primaryYAxis: CategoryAxis(),
        primaryXAxis: CategoryAxis(),
        title: ChartTitle(
            text: my_texts.contactsByMonth,
            textStyle:const TextStyle(color: Colors.black,fontSize: 20)),
     //   legend: Legend(isVisible: true,),
       // tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<monthData, String>>[
            // Renders column chart
            ColumnSeries<monthData, String>(
                dataSource: _data,
                yValueMapper: (monthData month, _) => month.count,
                xValueMapper:(monthData month, _) =>"${month.month} ",
              pointColorMapper:(monthData month, _) => month.color,
              width: 0.5
            ),

          ]


      ),



    );
  }
}
