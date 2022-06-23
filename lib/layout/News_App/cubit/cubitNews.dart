import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/layout/News_App/cubit/statesNews.dart';
import 'package:flutter_app2/moduls/news_app/sciences/business/businessScreen.dart';
import 'package:flutter_app2/moduls/news_app/sciences/sciencesScreen.dart';
import 'package:flutter_app2/moduls/news_app/sciences/sports/sportsScreen.dart';

import 'package:flutter_app2/netWork/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class newsCubit extends Cubit<NewAppState> {
  newsCubit() : super(newsInitialState());

  static newsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;


  List<Widget> Screens = [
    BusinessScreen(),
    sciencesScreen(),
    SportsScreen(),
  ];

  List <BottomNavigationBarItem> BottomNavBar = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'business',),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'science',),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_basketball),
      label: 'sport',),
  ];

  void changeCurrIndex(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    emit(newsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(newsGetBusinessLoadingSuccessState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country': 'eg',
        'category': 'business',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);

      emit(newsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(newsGetBusinessErorreSuccessState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(newsGetSportLoadingSuccessState());

    if (sports.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);

        emit(newsGetSportSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(newsGetSportErorreSuccessState(error.toString()));
      });
    } else {
      emit(newsGetSportSuccessState());
    }
  }


  List<dynamic> science = [];

  void getScience() {
    emit(newsGetSciencesLoadingSuccessState());

    if (science.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'eg',
          'category': 'science',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);

        emit(newsGetSciencesSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(newsGetSciencesErorreSuccessState(error.toString()));
      });
    } else {
      emit(newsGetSciencesSuccessState());
    }
  }


  List<dynamic> search = [];

  void getSearch(String value) {
    emit(newsGetSearchLoadingSuccessState());
 search=[];
    if (search.isEmpty) {
      DioHelper.getData(
        url: 'v2/everything',
        query:
        {
          'q': '${value}',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        search = value.data['articles'];
        print(search[0]['title']);

        emit(newsGetSearchSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(newsGetSearchErorreSuccessState(error.toString()));
      });
    } else {
      emit(newsGetSearchSuccessState());
    }
  }

}
