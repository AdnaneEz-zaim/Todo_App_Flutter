import 'package:sqflite/sqflite.dart';
import 'package:todo/shared/conts/conts.dart';
import 'package:todo/shared/cubit/states.dart';



//la creation de la data base
Future<Null> creatDataBase() {
  return openDatabase(
    'todo.db',
    version: 1,
    onCreate: (db, version) {
      db.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, titre TEXT, date text, time text,status text)'
      ).then((value){
        print("data base is created");
      }).catchError((Error){
        print("error rencontrer dans la creation de la base de donnees ${Error.toString()}");
      });
    },
    onOpen: (db) {
      print("data base opned");

    },

  ).then((value) {
        db=value;
  });
}


//l'insersion dans la base de donnees
Future insertToDataBase(String titre,String date,String time) async{
  await db.transaction((txn){
    return   txn.rawInsert(
        'INSERT INTO tasks(titre, date, time ,status) VALUES("$titre", "$date", "$time","new")'
    ).then((value) {
      print("${value} bien ajouter");
    }).catchError((onError){
      print("erreur dans la creation dans la table tasks");
    });
  });

}


//la recuperation de la base de donnees
Future<List<Map>> slecetToDataBase(Database database) async{
  return await database.rawQuery('SELECT * FROM tasks');
}

//la modification de la base de donnees
Future<int> updateToDataBase(String status,int id) async {
  return await db.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      ['$status', id]);
}

//la supperision de la base de donnees
Future deleteToDataBase(int id) async{
      return await db.rawDelete('DELETE FROM tasks WHERE id = ?', [id]);
}