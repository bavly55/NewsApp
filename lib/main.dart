import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/layout/news_app/cubit/cubit.dart';
import 'package:mersal/layout/news_app/cubit/states.dart';
import 'package:mersal/layout/news_app/news_layout.dart';
import 'package:mersal/shared/bloc_observer.dart';
import 'package:mersal/shared/styles/themes.dart';

import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  // if(Platform.isWindows){
  //   await DesktopWindow.setMinWindowSize(
  //       const Size(
  //          650,
  //           650
  //       ));
  // }
  bool? isDark=CacheHelper.GetBool(key: 'isDark');
  runApp(Myapp(isDark,));

}
class Myapp extends StatelessWidget{
  bool? isDark;
  Myapp(
      this.isDark,
      );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider( create: (BuildContext context) => NewsCubit(NewsInitialState())..GetBusiness()..ChangeMode(fromShared: isDark),),

      ],
      child:   BlocConsumer<NewsCubit,NewsStates>(

        listener: (context,state)  {},

        builder: (context,state) {

          return MaterialApp(
            debugShowCheckedModeBanner: false,

            theme: lightTheme ,
            darkTheme: darkTheme ,
            themeMode:   NewsCubit.get(context).isDark ? ThemeMode.dark: ThemeMode.light,

            home:   NewsLayout(),



          );

        } ,

      ),
    );

  }




}
