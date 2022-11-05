
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/layout/news_app/cubit/cubit.dart';
import 'package:mersal/layout/news_app/cubit/states.dart';
import 'package:mersal/modules/news_app/search_screen/search_screen.dart';
import 'package:mersal/shared/components/components.dart';
import 'package:mersal/shared/components/constants.dart';

class NewsLayout extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context , state) {} ,
      builder: (context , state) {
        var cubit=NewsCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            title:  const Text(
              'News App',
            ),
           actions: [
             IconButton(
                 onPressed: (){
                   navigateTO(context: context, widget: SearchScreen());
                 },
                 icon: const Icon(
                   Icons.search_rounded,
                   color: colorApp,
                 ),
             ),
             IconButton(
               onPressed: (){
                 NewsCubit.get(context).ChangeMode();
               },
               icon:  Icon(
                 NewsCubit.get(context).FabIcon,
                 color: colorApp,
               ),
             ),


           ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.CurrentIndex,
            onTap: (index){
              cubit.change(index);
            },
            items: cubit.items ,
          ),
          body: cubit.screens[cubit.CurrentIndex] ,

        );
      },

    );
  }
}
