import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/modules/HomeContents.dart';
import 'package:todo/modules/archiveTasks.dart';
import 'package:todo/modules/doneTasks.dart';
import 'package:todo/shared/components/testField.dart';
import 'package:todo/shared/conts/conts.dart';
import 'package:todo/shared/cubit/cubit.dart';
import 'package:todo/shared/cubit/states.dart';


//hada bax ranb9a njib l context dima
//BlocProvider.of<AppCubit>(context).indexCourant
class HommePage extends StatelessWidget  {

  var scaffoldkey=GlobalKey<ScaffoldState>();
  var formkey=GlobalKey<FormState>();


  var tasksNameController =TextEditingController();
  var tasksDateController =TextEditingController();
  var taskstimeController =TextEditingController();
  var keyboardType1=TextInputType.text;


  List<Widget> screens=[
    HomeContents(),
    DoneTasks(),
    ArchiveTasks(),
  ];


  // void initState() {
  //   super.initState();
  //   creatDataBase();
  // }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AppCubit()..CreateDataBaseCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: ( context, state) {
          if(state is AppInsertDataBaseStates)
                    Navigator.pop(context);
        },
        builder: ( context, state) {
          return  Scaffold(
            key: scaffoldkey,
            appBar: AppBar(
              title: Text('Todo APP'),
            ),
            body: state is AppLodingStates?Center(child: CircularProgressIndicator()): screens[indexCourant],
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                if(bottomSheet){
                  if(formkey.currentState?.validate()==true)
                  {
                    AppCubit.get(context).InsertDataBaseCubit(tasksNameController.text,tasksDateController.text,taskstimeController.text);
                    // insertToDataBase(tasksNameController.text,tasksDateController.text,taskstimeController.text).
                    // then((value) {
                    //
                    //   slecetToDataBase(db).then((value) {
                    //
                    //     Navigator.pop(context);
                    //     bottomSheet=false;
                    //     // setState(() {
                    //     //   iconfloating=Icons.add;
                    //     //   listTasks=value;
                    //     // });
                    //
                    //   });
                    //
                    //
                    // }).catchError((onError){
                    //   print("Error data base insert :"+onError.toString());
                    // });

                  }

                }
                else{
                  scaffoldkey.currentState?.showBottomSheet(
                        (context) =>
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                            color: Colors.grey[200],
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Form(
                              key: formkey,
                              child: Column(

                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  MyTextField(tasksNameController,keyboardType1,"tasks name",
                                      Icons.task,(){}),
                                  SizedBox(height: 20,),
                                  MyTextField(tasksDateController,keyboardType1,"date",
                                      Icons.date_range,
                                          (){
                                        showDatePicker(context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            // DateTime.monthsPerYear.toString()
                                            lastDate: DateTime.parse("2022-01-01"))
                                            .then((value) {
                                          tasksDateController.text= (DateFormat.yMMMd().format(value!)) != null?(DateFormat.yMMMd().format(value)).toString():"";
                                        });

                                        // then((value) {
                                        //   tasksDateController.text= (value?.format(context)) != null? (value?.format(context)).toString():"";
                                        //   print(value?.format(context));
                                        // }
                                        // );
                                      }
                                  ),
                                  SizedBox(height: 20,),
                                  MyTextField(taskstimeController,keyboardType1,"time",
                                      Icons.timer,(){
                                        showTimePicker(context: context, initialTime: TimeOfDay.now()).
                                        then((value) {
                                          taskstimeController.text= (value?.format(context)) != null? (value?.format(context)).toString():"";
                                          print(value?.format(context));
                                        });
                                      }),
                                ],
                              ),
                            ),
                          ),
                        ),
                    elevation: 45,
                  ).closed.then((value) {
                    BlocProvider.of<AppCubit>(context).ChangeBttomSheet(etat: false, icon: Icons.add);
                    // AppCubit.get(context).ChangeBttomSheet(false,);
                  //
                  });
                  BlocProvider.of<AppCubit>(context).ChangeBttomSheet(etat: true, icon: Icons.arrow_downward_rounded);
                  //AppCubit.get(context).ChangeBttomSheet(true,Icons.arrow_downward_rounded);

                }

              },
              child: Icon(iconfloating),),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: indexCourant,
              onTap: (index){
                //le changement de l'index de la page
                AppCubit.get(context).ChangeIndexScreen(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.task,),
                  label: "Tasks",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.done),
                  label: "Done",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive),
                  label: "Archived",
                ),

              ],
            ),
            //   body: Container(
            //     child: GNav(
            //         rippleColor: Colors.grey, // tab button ripple color when pressed
            //         hoverColor: Colors.blueGrey, // tab button hover color
            //         haptic: true, // haptic feedback
            //         tabBorderRadius: 15,
            //         tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
            //         tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
            //         tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
            //         curve: Curves.easeOutExpo, // tab animation curves
            //         duration: Duration(milliseconds: 900), // tab animation duration
            //         gap: 8, // the tab button gap between icon and text
            //         color: Colors.grey[800], // unselected icon color
            //         activeColor: Colors.purple, // selected icon and text color
            //         iconSize: 24, // tab button icon size
            //         tabBackgroundColor: Colors.purple.withOpacity(0.1), // selected tab background color
            //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
            //         tabs: [
            //           GButton(
            //             icon: Icons.home_outlined,
            //             text: 'Home',
            //           ),
            //           GButton(
            //             icon: Icons.favorite_border,
            //             text: 'Likes',
            //           ),
            //           GButton(
            //             icon: Icons.search,
            //             text: 'Search',
            //           ),
            //           GButton(
            //             icon: Icons.settings,
            //             text: 'Profile',
            //           )
            //         ]
            //     ),
            //   )
          );
        },

      ),

    );
  }


}
