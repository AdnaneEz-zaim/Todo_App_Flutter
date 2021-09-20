// la listes des nouvelles tasks
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

List<Map> listTasks=[];
List<Map> listTasksDone=[];
List<Map> listTasksArchiver=[];
//l'index de les pages de mn application
int indexCourant=0;
//la base de donnees
late Database db;

//les variable de la bottomSheet
IconData iconfloating=Icons.add;
bool bottomSheet= false;