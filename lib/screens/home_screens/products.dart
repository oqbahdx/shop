import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/state_management/cubit.dart';
import 'package:shop/state_management/states.dart';
import 'package:shop/utils/home_model.dart';
import 'package:shop/widgets/widgets.dart';

class ProductsPage extends StatefulWidget {
  static String id = 'ProductsPage';

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if(state is ShopSuccessGetFavoriteState){
          if(!state.model.status){
            showMessage(message: state.model.message,color: Colors.red);
          }else{
            showMessage(message: state.model.message,color: Colors.green);
          }
        }
      },
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
            // color: Colors.grey,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: model.data.products.length,
                itemBuilder: (context, index) =>
                    buildGridProduct(model.data.products[index])),
          ),
        ],
      ),
    );
  }

  Widget buildGridProduct(Products model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(15),
        ),
        width: double.infinity,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: NetworkImage(
                  model.image,
                ),
                width: double.infinity,
                height: 350,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              model.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  model.price.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                if (model.discount != 0)
                  Text(
                    model.oldPrice.toString(),
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  ),
                CircleAvatar(
                  backgroundColor: ShopCubit.get(context).favorite[model.id]
                      ? Colors.red
                      : Colors.grey,
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      ShopCubit.get(context).changeFavorite(model.id);
                      print(model.id);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            if (model.discount != 0)
              Container(
                height: 25,
                width: 100,
                color: Colors.red,
                child: Center(
                    child: Text(
                  'DISCOUNT',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              )
          ],
        ),
      ),
    );
  }
}
