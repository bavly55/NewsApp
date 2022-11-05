import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:mersal/layout/news_app/cubit/cubit.dart';
import 'package:mersal/layout/news_app/cubit/states.dart';
import 'package:mersal/modules/news_app/web_screen/web_view.dart';
import 'package:mersal/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../network/local/cache_helper.dart';
Widget textButton({
  required String text,
  required Function() onpressed,
}){
  return TextButton(
    onPressed: onpressed,
    child:  Text(
        text.toUpperCase()
    ),
  );
}

Widget defalutButton(
    {
      double width=double.infinity,
      double height=40.0,
      Color background= colorApp ,
      required  Function() onpressed,
      required String text,
      bool isuppercase=true,
      double  radius=0.0,
    })
{

  return   Container(
    width: width ,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color:  colorApp,
    ),
    child: MaterialButton(
      onPressed: onpressed ,
      child : Text(
        isuppercase ? text.toUpperCase():text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),


    ),
  );
}
Widget textForm({
  required TextEditingController controller,
  required TextInputType type,
  required IconData perfix,
  IconData? suffix,
  String ? label,
  bool isnotvisble=false,
  Function(String)? onSubmit,
  Function()? ontap,
  Function()?  onSuffixPressed,
  Function(String)? onChanged,
  required String? Function(String?)? validate,
})
{


  return TextFormField(
    controller:  controller,
    keyboardType: type,
    validator: validate ,
    onTap: ontap,
    decoration:  InputDecoration(
      labelText: label,

      border:  OutlineInputBorder(),
      prefixIcon: Icon(
        perfix,
      ),
      suffixIcon: suffix !=null ?  IconButton(
        onPressed: onSuffixPressed ,
        icon: Icon(
          suffix,
        ),
      ) : null,
    ),
    obscureText: isnotvisble,
    onFieldSubmitted: onSubmit ,
    onChanged: onChanged,

  );

}


Widget MyDivider(){
  return  Padding(
    padding: const EdgeInsetsDirectional.only(
        start: 20.0
    ),
    child: Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    ),
  );
}
Widget buildBusinessArticle(article,context,index){
  return InkWell(
    onTap: (){
      navigateTO(context: context, widget: WebScreen(article['url']));
      NewsCubit.get(context).Selected(index);
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 140.0,
            width: 140.0,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10.0,),
              image: DecorationImage(
                image: article['urlToImage']==null ?  const NetworkImage(
                  'https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg',
                ) : NetworkImage(
                  '${article['urlToImage']}',
                ),
                fit: BoxFit.cover,
              ),
            ),

          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              height: 160.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children:  [
                  BlocConsumer<NewsCubit,NewsStates>(
                    listener:(context,state) {} ,
                    builder:(context,state) {
                      return Expanded(
                        child: Text(
                          '${article['title']}',
                          style: Theme.of(context).textTheme.bodyText1,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    } ,


                  ),
                  // SizedBox(height: 10,),
                  Text(
                    ' ${article['publishedAt']}',
                    style: const TextStyle(
                      color: Colors.grey,

                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
void navigateTO({required BuildContext context,required Widget widget}){
  Navigator.push(context,MaterialPageRoute(builder: (context) => widget) );
}
Widget listedArticles(list,context,{isSearch=false}){
  return ConditionalBuilder(
    condition:  list.isNotEmpty,
    builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context,index) => buildBusinessArticle(list[index],context,index),
        separatorBuilder:(context,index) => MyDivider(),
        itemCount:list.length
    ),
    fallback: (context) => isSearch==true? Container() :  const Center(child: CircularProgressIndicator()) ,
  );
}
void navigateAndFinish({required BuildContext context,required Widget widget}){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget), (route) => false);
}
void showToast({
  required String msg,
  required toastStates state,
})
=> Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: toastsColor(state: state),
    textColor: Colors.white,
    fontSize: 16.0
);
// ignore: camel_case_types, constant_identifier_names
enum toastStates{SUCCESS,ERROR,WARNING}
Color toastsColor({
  required toastStates state,
}){
  switch(state){
    case toastStates.SUCCESS :
      {
        return Colors.green;
      }
    case toastStates.ERROR :
      {
        return Colors.red;
      }
    case toastStates.WARNING :
      {
        return Colors.amber;
      }


  }

}

