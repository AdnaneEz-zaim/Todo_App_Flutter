import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/shared/components/tasks.dart';
import 'package:todo/shared/conts/conts.dart';
import 'package:todo/shared/cubit/cubit.dart';
import 'package:todo/shared/cubit/states.dart';

class HomeContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,states){},
      builder: (context,states){
        return listTasks.length==0?Center(child: Text("No Tasks Yet",style: TextStyle(color: Colors.grey[400],fontSize: 25),))
            :
          ListView.separated(
            itemBuilder: (context,index)=>MyTasks(
                listTasks[index]['id'] , listTasks[index]['titre'] ,listTasks[index]['date'],listTasks[index]['time'],
                    (){
                  AppCubit.get(context).UpdateDataCubit("done",listTasks[index]['id']);
                },Icons.file_download_done,
                    (){
                  AppCubit.get(context).UpdateDataCubit("archiver",listTasks[index]['id']);
                }
                ,Icons.archive,context
            ),
            separatorBuilder: (context,index)=>Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            itemCount: listTasks.length);
      },
    );
  }
}
