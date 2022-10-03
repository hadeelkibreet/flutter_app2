import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/layout/shopLayout/cubit/cubitShop.dart';
import 'package:flutter_app2/layout/shopLayout/cubit/statesShop.dart';
import 'package:flutter_app2/models/shopapp/cateogries_model.dart';
import 'package:flutter_app2/models/shopapp/home_model.dart';
import 'package:flutter_app2/shared/adaptive/adaptivw_indicator.dart';
import 'package:flutter_app2/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter/widgets.dart';
import '../../../shared/components/constants.dart';
import 'package:buildcondition/buildcondition.dart';
class productsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shoplayuotCubit,shopLayuotStates>(
        listener:(context,state){},
        builder: (context,state)
        {
          return
            BuildCondition(
            condition:shoplayuotCubit.get(context).homeModel1!=null && shoplayuotCubit.get(context).categoriesModel!=null ,
            builder: (context)=>productsBulider(shoplayuotCubit.get(context).homeModel1!,shoplayuotCubit.get(context).categoriesModel!,context),
            fallback: (context)=>Center(child: CircularProgressIndicator()),
          );
          // Conditional.single(
          //   context: context,
          //   conditionBuilder: (context) => (shoplayuotCubit.get(context).homeModel1 != null &&
          //       shoplayuotCubit.get(context).categoriesModel != null),
          //   widgetBuilder: (context) =>  builderWidget(shoplayuotCubit.get(context).homeModel1!,
          //       shoplayuotCubit.get(context).categoriesModel!, context),
          //   fallbackBuilder:(context) =>  Center(child: AdaptiveIndicator(os: getOS())),
          // );
        }

    );
  }

  Widget productsBulider(HomeModel model,CategoriesModel categoriesModel,context)=> SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
            items: model.data!.banners.map((e) =>Image(
                image: NetworkImage('${e.image}'),
              width: double.infinity,
              fit: BoxFit.cover,
            ), ).toList(),
             options: CarouselOptions(
               height: 250.0,
               initialPage: 0,
               viewportFraction: 1.0,
               enableInfiniteScroll: true,
               reverse: false,
               autoPlay: true,
               autoPlayInterval: Duration(seconds: 3),
               autoPlayAnimationDuration: Duration(seconds: 1),
               autoPlayCurve: Curves.fastOutSlowIn,
               scrollDirection: Axis.horizontal,

             )),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categorices',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 20),
      Container(
              height: 100.0,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=>buildCategoryItem(categoriesModel.data!.data[index],context),
                  separatorBuilder: (context,index)=>SizedBox(
                    width: 10.0,
                  ),
                  itemCount: categoriesModel.data!.data.length),
      ),

              SizedBox(height: 30),
              Text(
                'New Products',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          color: Colors.grey[300],
          child: GridView.count(
            shrinkWrap: true,
              crossAxisCount:2,
            physics: NeverScrollableScrollPhysics(),
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
            childAspectRatio: 1/1.55,
            children: List.generate(model.data!.products.length,
                  (index) => BuildGridProduct(model.data!.products[index],context),),

          ),
        ),
      ],
    ),
  );

  Widget buildCategoryItem(DataModel model,context)=> Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Image(image: NetworkImage(model.image),
        height: 100.0,
        width: 100.0,
        fit: BoxFit.cover,
      ),
      Container(
        color: Colors.black.withOpacity(0.8,),
        width: 100.0,
        child: Text(
          model.name,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),

    ],
  );

  Widget BuildGridProduct(ProductModel model,context)=>Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
        children:[
          Image(
              image: NetworkImage(model.image),
              width: double.infinity,
              fit: BoxFit.contain,
              height: 200.0,

            ),
          if(model.discount!=0)
            Container(
            color: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              'Discount',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
          ),
        ]
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                model.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.5,
                  height: 1.3,
                ),
              ),
              Row(

                children: [
                  Text(
                    '${model.price}',
                    style: TextStyle(
                      fontSize: 12.5,
                      color: defaultcolor,
                    ),
                  ),
                  SizedBox(width: 5.0,),
                  if(model.discount!=0)
                    Text(
                      '${model.oldPrice}',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Spacer(),
                  Expanded(
                    child: IconButton(
                        icon: shoplayuotCubit.get(context).favorites[model.id]!
                            ? const Icon(
                          Icons.favorite,
                          size: 17.0,
                          color: Colors.red,
                        )
                            : const Icon(
                          Icons.favorite_border,
                          size: 17.0,
                        ),
                        onPressed: () {
                          shoplayuotCubit.get(context).changeFavorites(model.id);
                          print(model.id);

                        }),
                  )
                ],
              ),
            ],
          ),
        ),

      ],
    ),
  );
}











//
//return BlocConsumer<shoplayuotCubit,shopLayuotStates>(
//listener:(context,state){},
//builder: (context,state)
//{
//return BuildCondition(
//condition:shoplayuotCubit.get(context).homeModel1!=null ,
//builder: (context)=>productsBulider(),
//fallback: (context)=>Center(child: CircularProgressIndicator()),
//);
//}
//
//);
//}
//
//Widget productsBulider()=> Column(
//  children: [],
//);