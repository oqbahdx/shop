import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/state_management/cubit.dart';
import 'package:shop/state_management/states.dart';
import 'package:shop/utils/categories_model.dart';

class Categories extends StatefulWidget {
  static String id = 'Categories';

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: ShopCubit.get(context).cateModel != null,
          builder: (context) =>
              buildCategoriesList(ShopCubit.get(context).cateModel),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget buildCategoriesList(CategoriesModel model) {
    return Scaffold(
        body: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
            itemCount: model.data.data.length,
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: Border(
                    left: BorderSide(width: 2, style: BorderStyle.solid),
                    bottom: BorderSide(width: 2, style: BorderStyle.solid),
                    top: BorderSide(width: 2, style: BorderStyle.solid),
                    right: BorderSide(width: 2, style: BorderStyle.solid),
                  ),
                  child: Container(
                    child: Stack(
                      children: [
                        FadeInImage(
                          placeholder: AssetImage('images/holder.jpg'),
                          image: NetworkImage(model.data.data[index].image,
                          ),

                        ),
                        Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(.8),
                          child: Text(
                            model.data.data[index].name.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ))));
  }
}
