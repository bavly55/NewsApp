import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/layout/news_app/cubit/states.dart';
import 'package:mersal/modules/news_app/Buisness/Buisness_Screen.dart';
import 'package:mersal/modules/news_app/Science/Science_Screen.dart';
import 'package:mersal/modules/news_app/Sports/Sports_Screen.dart';
import 'package:mersal/shared/network/local/cache_helper.dart';
import 'package:mersal/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit(super.NewsInitialState);
  static NewsCubit get(context) => BlocProvider.of(context);
List<Widget> screens=[
  BuisnessScreen(),
  SportsScreen(),
  ScienceScreen(),

];
int currentIndex=0;
  bool isDark=false;
  IconData FabIcon= Icons.brightness_4_rounded;
  void ChangeIcon(){
    if(isDark){
      FabIcon= Icons.brightness_2;
    }
    else{
      FabIcon= Icons.brightness_4_rounded;
    }
    emit(NewsIconAppBarState());
  }
  void ChangeMode( {
    bool? fromShared,
  }){
    if(fromShared != null){
      isDark=fromShared;
      ChangeIcon();
      emit(NewsChangeModeState());
    }else{
      isDark=!isDark;
      ChangeIcon();
      CacheHelper.PutData(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeModeState());
      });
    }


  }

List<BottomNavigationBarItem> items=[
  const BottomNavigationBarItem(
      icon: Icon(
        Icons.business_rounded,
      ),
    label: 'Business'
  ),
  const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_soccer_rounded,
      ),
      label: 'Sports'
  ),
  const BottomNavigationBarItem(
      icon: Icon(
        Icons.science_outlined,
      ),
      label: 'science'
  ),

] ;


int CurrentIndex=0;
void change(index){
  CurrentIndex=index;
if(index==1){
  GetSport();
}
if(index==2){
  GetScience();
}
  emit(NewsBottomNavBarState());
}

  List<dynamic> business=[];
   int? SelectedItem;
   bool? Desktop;
   void Selected(int index){
    if( SelectedItem==index ){
      SelectedItem=null;
    }else{
      SelectedItem=index;
    }
   emit(NewsSearchGetSelectedState());
   }
void GetBusiness(){
  emit(NewsBusinessLoadingState());
  DioHelper.getData(

    url: 'v2/top-headlines' ,
    query: {
      'country' : 'eg',
      'category' : 'business',
      'apiKey':'a082622ab8db46178fd9cca19db53079',

    },
  ).then((value)
  {
    business=value.data['articles'];
    print(value.data['totalResults']);
    emit(NewsBusinessSuccessState());
  }).catchError((error)
  {
    print(error.toString());
    emit(NewsBusinessErrorState(error.toString()));
  });
}
  List<dynamic> sports=[];
  void GetSport(){
    emit(NewsSportsLoadingState());
    if(sports.isEmpty){
      DioHelper.getData(

        url: 'v2/top-headlines' ,
        query: {
          'country' : 'eg',
          'category' : 'sports',
          'apiKey':'a082622ab8db46178fd9cca19db53079',

        },
      ).then((value)
      {
        sports=value.data['articles'];
        print(value.data['totalResults']);
        emit(NewsSportsSuccessState());
      }).catchError((error)
      {
        print(error.toString());
        emit(NewsSportsErrorState(error.toString()));
      });

    }else{
      emit(NewsSportsSuccessState());
    }

  }
  List<dynamic> science=[];
void GetScience(){
  emit(NewsScienceLoadingState());
  if(science.isEmpty){
    DioHelper.getData(

      url: 'v2/top-headlines' ,
      query: {
        'country' : 'eg',
        'category' : 'science',
        'apiKey':'a082622ab8db46178fd9cca19db53079',

      },
    ).then((value)
    {
      science=value.data['articles'];
      emit(NewsScienceSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsScienceErrorState(error.toString()));
    });
  }else{
    emit(NewsScienceSuccessState());
  }

}
List<dynamic> search=[];
void GetSearch(String value){
  emit(NewsSearchLoadingState());
  DioHelper.getData(
    url: 'v2/everything',
    query:
    {
      'q':'$value',
      'apiKey':'a082622ab8db46178fd9cca19db53079',
    },
  ).then((value)
  {

    search = value.data['articles'];
    print(value.data['totalResults']);

    emit(NewsSearchSuccessState());
  }).catchError((error){
    print(error.toString());
    emit(NewsSearchErrorState(error.toString()));
  });


}

}