
abstract class NewAppState{}

class newsInitialState extends NewAppState {}

class newsBottomNavState extends NewAppState {}

class newsGetBusinessLoadingSuccessState extends NewAppState {}

class newsGetBusinessSuccessState extends NewAppState {}

class newsGetBusinessErorreSuccessState extends NewAppState
{
  final String ? erorre;

  newsGetBusinessErorreSuccessState(this.erorre);
}


class newsGetSciencesLoadingSuccessState extends NewAppState {}

class newsGetSciencesSuccessState extends NewAppState {}

class newsGetSciencesErorreSuccessState extends NewAppState
 {
  final String ? erorres;

  newsGetSciencesErorreSuccessState(this.erorres);
}


class newsGetSportLoadingSuccessState extends NewAppState {}

class newsGetSportSuccessState extends NewAppState {}

class newsGetSportErorreSuccessState extends NewAppState
{
  final String ? erorresp;

newsGetSportErorreSuccessState(this.erorresp);
}



class newsGetSearchLoadingSuccessState extends NewAppState {}

class newsGetSearchSuccessState extends NewAppState {}

class newsGetSearchErorreSuccessState extends NewAppState
{
  final String ? erorres;

  newsGetSearchErorreSuccessState(this.erorres);
}




