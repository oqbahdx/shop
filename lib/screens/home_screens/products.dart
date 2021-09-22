import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/state_management/cubit.dart';
import 'package:shop/state_management/states.dart';
import 'package:shop/utils/home_model.dart';

class ProductsPage extends StatefulWidget {
  static String id = 'ProductsPage';

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: ShopCubit.get(context).homeModel != null,
          builder: (context) =>
              productsScaffold(ShopCubit.get(context).homeModel),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget productsScaffold(HomeModel model) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
              items: model.data.banners
                  .map((e) => Image(
                        image: NetworkImage('${e.image}'),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                  height: 170,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  initialPage: 0,
                  viewportFraction: 1,
                  autoPlayCurve: Curves.slowMiddle)),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.grey,
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              childAspectRatio: 1/2.3,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(
                model.data.products.length,
                (index) => buildGridProduct(model.data.products[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGridProduct(Products model) {
    return Column(
      children: [
        Image(
          image: NetworkImage(
            model.image,
          ),
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Text(model.name,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(
          color: Colors.black
        ),)
      ],
    );
  }
}
