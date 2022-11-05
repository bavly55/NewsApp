import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/layout/news_app/cubit/cubit.dart';
import 'package:mersal/layout/news_app/cubit/states.dart';
import 'package:mersal/shared/components/components.dart';

class ScienceScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>
      ( listener: (context,state){} ,
      builder: (context,state){
        var list =NewsCubit.get(context).science;
        return listedArticles(list,context);
      },

    );

  }
}
