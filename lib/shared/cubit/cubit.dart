import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/shared/conts/conts.dart';
import 'package:todo/shared/cubit/states.dart';
import 'package:todo/shared/dataBase/dataBase.dart';
//1- kandiroh extends AppStates za3ma dyal l class mere dyal les states dyal application kamla (abstruct class ).
//2- l contructeur dima kay kon kay t initializa b initial state
//3- kan dir method static bax njib objet mni f aya wa9t brito
//4- kan mxi l screen w kan wirabi scaffold b blocProvidre
//5- dak l BlocProvider khasse nzidlo oncrate methode ka treturner objet cubit dyalna li howa AppCubit
//6- daba rah khedam ra fdak blocProvider ranzid lih child w nwirabi 3awtani dak scaffold dyalna b blocConsiommare
//7- hada bax y3raf 3la axman cubit w axman states radi ytbadal BlocConsumer<AppCubit,AppStates>
//8- radi nzid l hadak l blocConsumer wa7ad le champs dyal listner w randir fih (context,status){}
//9- radi nzid l hadak l blocConsumer wa7ad le champs dyal builder w randir fih (context,status){return scaffold dyali}
//10- daba radi nxof dak xi li kay trayare 3andi w radi ndiro hna bax nb9a nbadal les states
//11- hadok les page dyali bax khasse ytbadlo khasseni ndir lkola wa7da blocConsumer


//1
class AppCubit extends Cubit<AppStates>{
  //2
  AppCubit() : super(AppInitialStates());
  //3
  static get(context)=>BlocProvider.of<AppCubit>(context);



 void ChangeIndexScreen(int index){
    indexCourant=index;
    emit(AppChangeIndexScreen());
 }

  void ChangeBttomSheet({required bool etat,required IconData icon}){
    iconfloating=icon;
    bottomSheet= etat;
    emit(AppChangeBottomSheet());
    //GetDataBaseCubit();
  }


 //les methodes de la base de donnees

  //la creation et la recuperation des donnees de la base de donnees
  void CreateDataBaseCubit(){
   creatDataBase().then((value){
     emit(AppCeateDataBaseStates());
     GetDataBaseCubit();
   });
 }

//la recuperation des donnees de la base de donnees
  void GetDataBaseCubit(){
    listTasks=[];
    listTasksArchiver=[];
    listTasksDone=[];
   emit(AppLodingStates());
    slecetToDataBase(db).then((value){
      value.forEach((element) {
        if(element['status']=="new")
          listTasks.add(element);
        else if(element['status']=="done")
          listTasksDone.add(element);
        else
          listTasksArchiver.add(element);
      });
      // listTasks=value;
      emit(AppGetDataBaseStates());
    });
  }

  //l'insertion des donnees dans la base de donnees
  void InsertDataBaseCubit(String titre,String date,String time){
    insertToDataBase(titre,date,time).then((value){
      emit(AppInsertDataBaseStates());
      GetDataBaseCubit();
    });
  }

  //la mis-ajour de la base de donnees
void UpdateDataCubit(String status,int id){
  updateToDataBase(status,id).then((value) {
    emit(AppUpdateDataBaseStates());
    GetDataBaseCubit();
  });
}

// la suppression de la base de donnees
  void DeleteDataCubit(int id){
    deleteToDataBase(id).then((value) {
      emit(AppDeleteDataBaseStates());
      GetDataBaseCubit();
    });
  }

}