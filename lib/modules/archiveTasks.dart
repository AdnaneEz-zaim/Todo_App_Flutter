import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/shared/components/tasks.dart';
import 'package:todo/shared/conts/conts.dart';
import 'package:todo/shared/cubit/cubit.dart';
import 'package:todo/shared/cubit/states.dart';

class ArchiveTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,states){},
      builder: (context,states){
        return listTasksArchiver.length==0?Center(child: Text("No Tasks Yet",style: TextStyle(color: Colors.grey[400],fontSize: 25),))
        :
        ListView.separated(
            itemBuilder: (context,index)=>MyTasks(
                listTasksArchiver[index]['id'],listTasksArchiver[index]['titre'] ,listTasksArchiver[index]['date'],listTasksArchiver[index]['time'],
                    (){
                  AppCubit.get(context).UpdateDataCubit("done",listTasksArchiver[index]['id']);
                },Icons.file_download_done,
                    (){
                  AppCubit.get(context).UpdateDataCubit("new",listTasksArchiver[index]['id']);
                }
                ,Icons.unarchive,context
            ),
            separatorBuilder: (context,index)=>Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            itemCount: listTasksArchiver.length);
      },
    );

  }
}
