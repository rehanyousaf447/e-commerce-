import 'package:flutter/material.dart';
import 'package:gwbhai/Widgets/SelectiveCategroy_List.dart';
import 'package:provider/provider.dart';
import 'package:gwbhai/Data/CategoryList_Data.dart';
import 'package:gwbhai/Widgets/Categorie_Tile.dart';
import 'package:gwbhai/Screens/SelectiveCategoryScreen.dart';
import 'package:gwbhai/Data/KeyBoardData.dart';
import 'package:gwbhai/Data/CasingsData.dart';
import 'package:gwbhai/Data/MousesData.dart';
import 'package:gwbhai/Data/HeadPhonesData.dart';
import 'package:gwbhai/Data/GraphicCardsData.dart';
import 'package:gwbhai/Data/LedsData.dart';
import 'package:gwbhai/Data/MousePadsData.dart';
import 'package:gwbhai/Data/Data_stream.dart';
class Categories extends StatelessWidget {
   var object;
   String tablename;
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryList>(
      builder: (context, catagorylist, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return CategoryTile(
              categoryTitle: catagorylist.categoryTile[index].categoryTitle,
              images: catagorylist.categoryTile[index].images,
              onTap: () {
                if (catagorylist.categoryTile[index].categoryTitle
                        .toLowerCase() ==
                    'keyboards') {
                  object=DataStream(
                    tableName:KeyBoardsList.myclassName,
                  );
                  tablename=KeyBoardsList.myclassName;

                }else if(catagorylist.categoryTile[index].categoryTitle
                    .toLowerCase() ==
                    'headphones'){
                  object=DataStream(
                    tableName: HeadPhonesList.myclassName,
                  );
                  tablename=HeadPhonesList.myclassName;

                }else if(catagorylist.categoryTile[index].categoryTitle
                    .toLowerCase() ==
                    'mouse'){
                 object=DataStream(
                   tableName: MouseList.myclassName,
                 );
                 tablename=MouseList.myclassName;
                }else if(catagorylist.categoryTile[index].categoryTitle
                    .toLowerCase() ==
                    'casings'){
                  object=DataStream(
                    tableName: CasingList.myclassName,
                  );
                  tablename=CasingList.myclassName;
                }else if(catagorylist.categoryTile[index].categoryTitle
                    .toLowerCase() ==
                    'graphic cards') {
                  object = DataStream(
                    tableName: GraphicCardLists.myclassName,
                  );
                  tablename=GraphicCardLists.myclassName;
                }else if(catagorylist.categoryTile[index].categoryTitle
                    .toLowerCase() ==
                    'leds') {
                  print("hello led bro");
                  object = DataStream(
                    tableName: LedsList.myclassName,
                  );
                  tablename=LedsList.myclassName;
                }else if(catagorylist.categoryTile[index].categoryTitle
                    .toLowerCase() ==
                    'mouse pads') {
                  object = DataStream(
                    tableName: MousePadsList.myclassName,
                  );
                  tablename=MousePadsList.myclassName;
                }
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SelectiveScreen(object: object,tableName:this.tablename,);
                }));
              },
            );
          },
          itemCount: catagorylist.categoryTile.length,
        );
      },
    );
  }
}
