import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/moduls/todo_app/New_Tasks/Archive_Tasks/Archive_Tasks_Screen.dart';
import 'package:flutter_app2/moduls/todo_app/New_Tasks/Done_Tasks/Done_Tasks_Screen.dart';
import 'package:flutter_app2/moduls/todo_app/New_Tasks/New_Tasks_Screen.dart';
import 'package:flutter_app2/netWork/local/cache_helper.dart';
import 'package:flutter_app2/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>
{

  AppCubit() : super(AppInitalStates());

  static AppCubit get(context)=> BlocProvider.of(context);


  bool isBottonSheetShow= false;
  IconData Iconbottom = Icons.edit;
  List<Widget> screen=[
    NewTasks(),
    DoneTasks(),
    archiveTasks()
  ];
  List<String> title1=[
    'New Tasks',
    'Done Tasks',
    'Archive Tasks',
  ];
  int currentIndex=0;
  List<Map> NewtasksMap=[];
  List<Map> DonetasksMap=[];
  List<Map> ArchivetasksMap=[];


  bool isdark = false;

  void changeAppMode({ bool? fromShared})
  {
    if(fromShared != null)
    {
      isdark = fromShared;
      emit(AppChangeModeStates());
    }
    else
    {
      isdark =! isdark;
      CacheHelper.putBoolean(Key: 'isdark', value: isdark).then((value)
      {
        emit(AppChangeModeStates());

      });
    }
  }
  void ChangeIndex(int index)
  {
    currentIndex=index;
    emit(AppChangeBottonNavBarStates());
  }

  void ChangeBottomSheetState({
  required bool isShow,
    required IconData icon
})
  {
    isBottonSheetShow=isShow;
    Iconbottom=icon;
    emit(AppChangeBottonSheetStates());
  }

                 //data base
  Database ? database;


  void createDataBase() {
     openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, int version) async{
        print('database created');

        database.execute('CREATE TABLE tasks( id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)').then((value)
        {
          print('table created');
        }).catchError(
                (error){ print('error in taple ${error.toString()}');});
      },
      onOpen:(database) {
        getDataBase(database);
        print('database opened');
      },

    ).then((value)
     {
       database=value;
       emit(AppCreateDatabaseStates());

     });

  }

  Future insertToDataBase ({
    required title,
    required date,
    required time,
  }) async
  {
     await database!.transaction((txn)
    async {
      txn.rawInsert(
          'INSERT INTO tasks(Title, Date, Time, Status) VALUES("$title", "$date", "$time", "new")'
      ).then((value)
      {
        print('${value} insert sucssseddddddddddddddddddddddddd');
        emit(AppInsertDatabaseStates());

        getDataBase(database);

      }).catchError((Error)
      {
        print('the ERRORRRRRRRRR ${Error.toString()}');
      });

    });

  }

  void getDataBase(database )
  {
    NewtasksMap=[];
    DonetasksMap=[];
    ArchivetasksMap=[];
     database!.rawQuery('SELECT * FROM tasks').then((value)
     {
       value.forEach((element) 
       {
         if(element['status']=='new')
           NewtasksMap.add(element);
         else if(element['status']=='done')
           DonetasksMap.add(element);
         else ArchivetasksMap.add(element);


       });
       emit(AppGetDatabaseStates());
     });
  }

 void updateData ({
  required int id,
   required String status
})
 {
   database!.rawUpdate(
     'UPDATE tasks SET status = ? WHERE id = ?',
     ['$status',id]
   ).then((value) {
     getDataBase(database);
   emit(AppUpdatetDatabaseStates());
   });

 }

  void deleteData ({
    required int id,
  })
  {
    database!.rawDelete(
        'DELETE FROM tasks  WHERE id = ?',
        [id]
    ).then((value) {
      getDataBase(database);
      emit(AppDeleteDatabaseStates());
    });

  }

}