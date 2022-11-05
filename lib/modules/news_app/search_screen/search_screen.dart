import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/layout/news_app/cubit/cubit.dart';
import 'package:mersal/layout/news_app/cubit/states.dart';
import 'package:mersal/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var SearchController=TextEditingController();
  var formKey=GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {


    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state) {} ,
      builder: (context,state) {
        var list=NewsCubit.get(context).search;
        var cubit=NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: (){
                  NewsCubit.get(context).ChangeMode();
                },
                icon:  Icon(
                  NewsCubit.get(context).FabIcon,
                ),
              ),
            ],
          ),
          body: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: textForm(
                    controller: SearchController,
                    type: TextInputType.text,
                    perfix: Icons.search_outlined,
                    validate: (value){
                      if(value!.isEmpty){
                        return 'Search Must not be empty';
                      }
                    },
                    // onChanged: (value){
                    //   if(formKey.currentState!.validate()){
                    //     NewsCubit.get(context).GetSearch(value);
                    //   }
                    //
                    //
                    // },
                    onSubmit: (value){
                      if(formKey.currentState!.validate()){
                        NewsCubit.get(context).GetSearch(value);
                      }
                    },
                    label: 'Search',
                  ),

                ),
                const SizedBox(
                  height: 15.0,
                ),
                Expanded(child: listedArticles(list,context,isSearch: true),),
              ],
            ),
          ),
        );
      },

    );
  }
}
