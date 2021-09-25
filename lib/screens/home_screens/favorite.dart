import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/state_management/cubit.dart';
import 'package:shop/state_management/states.dart';
import 'package:shop/styles/text.dart';
import 'package:shop/utils/favorite_model.dart';

class Favorite extends StatefulWidget {
  static String id = "Favorite";

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(listener: (context,state){},
      builder: (context,state){
      return ConditionalBuilder(
        condition: ShopCubit.get(context).favoriteModel !=null,
        builder: (context)=>buildListT(ShopCubit.get(context).favoriteModel),
        fallback: (context)=>Center(child: CircularProgressIndicator()),
      );
      },
        );
  }

  Widget buildListT(FavoritesModel model){
    return ListView.separated(
        separatorBuilder:(context,index)=>Divider(thickness: 2,),
        itemCount: model.data.data.length,
        itemBuilder: (context,index){
      return Container(
        child: ListTile(
          title: Text(model.data.data[index].product.name,style: textStyle,maxLines: 1,),
          leading:FadeInImage(
            placeholder: AssetImage('images/holder.jpg'),
            image: NetworkImage(model.data.data[index].product.image,scale: 1,
            ),
          ),
          subtitle: Text(model.data.data[index].product.price.toString()),
          trailing: IconButton(
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Colors.red,
            ),
            onPressed: () {
              ShopCubit.get(context).changeFavorite(model.data.data[index].product.id);
              print(model.data.data[index].product.id);
            },
          ),


        ),
      );

    });

  }

}
