import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/shared/cubit/cubit.dart';

Widget MyTasks(int id,String name,String date,String time,final Function()? done,IconData iconeDone,final Function()? archiver,IconData iconArchi, context)=>
    Dismissible(
      key: Key(id.toString()),
      onDismissed: (direction){
        AppCubit.get(context).DeleteDataCubit(id);
      },
      child: Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
      children: [
        CircleAvatar(
          radius: 35,
          child: Text(time),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                Text(date,style: TextStyle(color: Colors.grey),)
              ],
            ),
          ),
        ),

        IconButton(onPressed: done,icon:Icon(iconeDone),color: Colors.green,),
        IconButton(onPressed: archiver,icon:Icon(iconArchi),color: Colors.deepOrange,),
      ],
  ),
),
    );