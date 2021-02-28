import 'package:flutter/material.dart';
import 'package:sql_lite/database_helper.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: HomePage(),));
}

class HomePage extends StatelessWidget {
  @override
Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Sqflite example'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(onPressed: ()async{
            int i = await DatabaseHelper.instance.insert({
              DatabaseHelper.columnName : "Mohit"
            });
            print("the id is $i");
          }, child: Text("Insert",style: TextStyle(color: Colors.white,),),),

          TextButton(onPressed: ()async{
            List<Map<String,dynamic>> queryRows = await DatabaseHelper.instance.queryAll();
            print("queryRows");
          }, child: Text("query",style: TextStyle(color: Colors.red,),)),

          TextButton(onPressed: ()async{
            int updatedId = await DatabaseHelper.instance.update({
              DatabaseHelper.columnId: 12,
              DatabaseHelper.columnName: "Rohit",

            });
            print(updatedId);
          }, child: Text("Update",style: TextStyle(color: Colors.green,),)),

          TextButton(onPressed: ()async{
            int rowsEffected = await DatabaseHelper.instance.delete(13);
            print(rowsEffected);
          }, child: Text("Delete",style: TextStyle(color: Colors.blue,),)),
        ],
      ),
    );
  }
}

