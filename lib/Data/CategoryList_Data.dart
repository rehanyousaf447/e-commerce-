import 'package:flutter/widgets.dart';
import 'package:gwbhai/Widgets/Categorie_Tile.dart';

class CategoryList extends ChangeNotifier  {
  List<CategoryTile> categoryTile=[
    CategoryTile(
      categoryTitle: 'KEYBOARDS',
      onTap: (){
      },
      images: 'GKB.png',
    ),
    CategoryTile(
      categoryTitle: 'HEADPHONES',
      onTap: (){
      },
      images: 'GHF.png',
    ),
    CategoryTile(
      categoryTitle: 'MOUSE',
      onTap: (){
      },
      images: 'GM.png',
    ),
    CategoryTile(
      categoryTitle: 'GRAPHIC CARDS',
      onTap: (){
      },
      images: 'GGC.png',
    ),
    CategoryTile(
      categoryTitle: 'CASINGS',
      onTap: (){
      },
      images: 'GCS.png',
    ),
    CategoryTile(
      categoryTitle: 'LEDs',
      onTap: (){
      },
      images: 'GLED.png',
    ),
    CategoryTile(
      categoryTitle: 'MOUSE PADs',
      onTap: (){
      },
      images: 'GMP.png',
    ),
  ];

  void addTask(String title,Function function,String imagae){
    categoryTile.add(CategoryTile(categoryTitle: title,onTap: function,images: imagae,));
    notifyListeners();
  }

  void deleteTask(CategoryTile myCategory){
    categoryTile.remove(myCategory);
    notifyListeners();
  }


}
