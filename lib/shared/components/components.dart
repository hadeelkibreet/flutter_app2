
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/shared/cubit/cubit.dart';
import 'package:flutter_app2/shared/styles/colors.dart';

Widget defaultButton({
  double width= double.infinity,
  double height= 70.0,
  double radius = 30.0,
  Color color=defaultcolor,
  bool isuppercase=true,
  required Function onpre,
  required String text,
})=>ClipRRect(
borderRadius: BorderRadius.circular(radius),
child: Container(
color: color,
height: height,
width: width,
child: MaterialButton(
onPressed: (){
  onpre();
},
child:
Text(
isuppercase?text.toUpperCase():text,
style: TextStyle(
fontSize: 35.0,
color: Colors.white,
fontStyle: FontStyle.italic,
),
),
),

),
);

Widget defaultTextButton({
  required Function onpre,
  required String label,

})=>TextButton(onPressed: (){onpre;}
, child: Text(label.toUpperCase()),);

Widget defaultFormField({
  required TextEditingController Controller,
  required TextInputType Type,
  required String label,
  required IconData prefix,
  required String vali,
  IconData ? suffix,
  Function? suffixPressed,
  //bool isclickable=true,
  Function? onSubmit,
  Function ?onChanged,
  Function? onTap,
  bool ispass =false,
 // Color col=Colors.black38,

})=>  TextFormField(

controller: Controller,
keyboardType: Type,
  obscureText: ispass,
  onChanged: (s){
  onChanged!(s);
  },
  onFieldSubmitted: (s){
    onSubmit!(s);
  },
validator:  ( value){
  if( value!.isEmpty){
    return vali;
  }
  return null;
},
 onTap: (){
  onTap!();
  },
decoration: InputDecoration(
labelText: label,
  border: OutlineInputBorder( ),
prefixIcon: Icon(
prefix,

),
 suffixIcon: suffix != null? IconButton(onPressed: (){suffixPressed!();},
  icon: Icon(suffix),
      ):null,
),

);


//ali
Widget defaultFormField1({
  required TextEditingController controller,
  required TextInputType type,
  Function ? onSubmit,
  Function ? onChange,
  Function ? onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData ? suffix,
  Function ? suffixPressed,
  bool isClickable = true,


}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onChanged:(s)
      {
        onChange!(s);
      },

      onFieldSubmitted: (s)
      {
        onSubmit!(s);
      },

      onTap:()
      {
        onTap!();
      },

      validator: (s)
      {
        validate();
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: IconButton(
            onPressed:() {
              suffixPressed!();
            },
            icon : Icon(
              suffix,
            )
        ),
        border: const OutlineInputBorder(),
      ),
    );

Widget buildTaskItem (Map model , context ,bool showDone , bool showArchive)=>Dismissible(
  key: Key(model['id'].toString()),
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40.0,
          child: Text('${model['time']}'),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text('${model['title']}',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold ,) ,
                ),
                Text('${model['date']}',
                  style: TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 25.0,
        ),
        SizedBox(
          width: 15.0,
        ),
        if(showDone == true)
        IconButton(onPressed: (){
          AppCubit.get(context).updateData(id: model['id'], status: 'done');
          AppCubit.get(context).updateData(id: model['id'], status: 'done');
        },
            icon: Icon(Icons.check_box, color: Colors.green,) ),

        if(showArchive==true)
        IconButton(onPressed: (){
          AppCubit.get(context).updateData(id: model['id'], status: 'archive');
        },
            icon: Icon(Icons.archive, color: Colors.black45,) )
      ],

    ),

  ),
  onDismissed: ( direction )
  {
    AppCubit.get(context).deleteData(id: model['id']);
  },
);

Widget tasksbuilder ({
  required List<Map> cubitindex,
  required bool showdone,
  required bool showearchive
})=>BuildCondition(
    condition:  cubitindex.length>0,
    builder: (context) {
      return  ListView.separated(
          itemBuilder: (context,index)=>buildTaskItem(cubitindex[index],context,showdone,showearchive),
          separatorBuilder: (context, index)=> myDivider(), itemCount: cubitindex.length);
    },
    fallback: (context) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 100.0,
              color: Colors.grey,
            ),
            Text(
              'No tasks yet , Please add some tasks ',
              style: TextStyle(fontSize: 20.0,
                color: Colors.grey,
                fontWeight: FontWeight.bold,

              ),
            ),
          ],
        ),
      );
    }
);

Widget myDivider()=>Padding(
padding: const EdgeInsetsDirectional.only(
start: 20.0
),
child: Container(
width: double.infinity,
height: 1.0,
color: Colors.grey[300],
),
);

Widget buildArticalItem(article,context)=> Padding(

  padding: const EdgeInsets.all(20.0),

  child: Row

    (

    children:

    [

      Container(

        height: 120.0,

        width: 120.0,

        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(10.0),

          image: DecorationImage(

              image: NetworkImage('${article['urlToImage']}'),

              fit: BoxFit.cover

          ),

        ),

      ),

      SizedBox(

        width: 20.0,

      ),

      Expanded(

        child: Container(

          height: 120.0,

          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Expanded(

                child: Text( '${article['title']}',

                  style: Theme.of(context).textTheme.bodyText1,

                  maxLines: 2,

                  overflow: TextOverflow.ellipsis,

                ),

              ),

              SizedBox(

                height: 20.0,

              ),

              Text( '${article['publishedAt']}',

                style: TextStyle(fontSize: 20.0,color: Colors.grey),

              ),

            ],

          ),

        ),

      ),

    ],

  ),

);

Widget articalBuilder(list,{issersh=false})=> BuildCondition(

  condition: list.length>0 ,
  builder: (context)=>ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index)=>buildArticalItem(list[index],context),
      separatorBuilder: (context,index)=>myDivider(),
      itemCount: 10),
  fallback: (context)=>issersh?Container():Center(child: CircularProgressIndicator()),
);

void NavigatorTo(context,widget)=> Navigator.push(
    context, MaterialPageRoute(builder: (context)=>widget));


void NavigatorFinish(context,widget)=> Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context)=>widget),
    (route){
      return false;
    }

);

void snackbarBuilder({
  required String mas,
  required snackbarStates states,
  required BuildContext context,
})
{

  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mas),
        elevation: 0.0,
        backgroundColor: chooseSnackbarColor(states) ,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      )
  );

}

enum snackbarStates{SUCCESS,ERROR,WARNUNG}

Color chooseSnackbarColor(snackbarStates states)
{
  Color color;
  switch(states)
  {
    case snackbarStates.SUCCESS:
      color =Colors.green;
      break;
    case snackbarStates.ERROR:
      color =Colors.red;
      break;
    case snackbarStates.WARNUNG:
      color =Colors.amber;
      break;

  }
  return color;
}