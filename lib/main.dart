import 'package:flutter/material.dart';
import 'package:gwbhai/Screens/Loading_screen.dart';
import 'package:provider/provider.dart';
import 'Data/Data_list.dart';
import 'Data/CategoryList_Data.dart';
import 'Data/KeyBoardData.dart';
import 'Data/HeadPhonesData.dart';
import 'Data/MousesData.dart';
import 'Data/CasingsData.dart';
import 'Data/LedsData.dart';
import 'Data/GraphicCardsData.dart';
import 'Data/MousePadsData.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  MyRows myRows;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyRows>(create: (context)=>MyRows()),
        ChangeNotifierProvider<CategoryList>(create: (context) => CategoryList()),
        ChangeNotifierProvider<KeyBoardsList>(create: (context) => KeyBoardsList()),
        ChangeNotifierProvider<HeadPhonesList>(create: (context) => HeadPhonesList()),
        ChangeNotifierProvider<MouseList>(create: (context) => MouseList()),
        ChangeNotifierProvider<CasingList>(create: (context) => CasingList()),
        ChangeNotifierProvider<MousePadsList>(create: (context) => MousePadsList()),
        ChangeNotifierProvider<GraphicCardLists>(create: (context) => GraphicCardLists()),
        ChangeNotifierProvider<LedsList>(create: (context) => LedsList()),

      ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
    );
  }
}

