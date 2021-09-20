import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/shared/components/tasks.dart';
import 'package:todo/shared/conts/conts.dart';
import 'package:todo/shared/cubit/cubit.dart';
import 'package:todo/shared/cubit/states.dart';

class DoneTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,states){},
      builder: (context,states){
        return listTasksDone.length==0?Center(child: Text("No Tasks Yet",style: TextStyle(color: Colors.grey[400],fontSize: 25),))
            :
        ListView.separated(
            itemBuilder: (context,index)=>MyTasks(
                listTasksDone[index]['id'] , listTasksDone[index]['titre'] ,listTasksDone[index]['date'],listTasksDone[index]['time'],
                    (){
                  AppCubit.get(context).UpdateDataCubit("new",listTasksDone[index]['id']);
                },Icons.remove_done,
                    (){
                  AppCubit.get(context).UpdateDataCubit("archiver",listTasksDone[index]['id']);
                }
                ,Icons.archive,context
            ),
            separatorBuilder: (context,index)=>Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            itemCount: listTasksDone.length);
      },
    );




  }
}
