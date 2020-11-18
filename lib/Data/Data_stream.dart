import 'package:flutter/material.dart';
import 'package:gwbhai/Screens/Home_page.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gwbhai/Data/Data_list.dart';
import 'package:gwbhai/Data/KeyBoardData.dart';
import 'package:gwbhai/Widgets/Card.dart';
import 'package:gwbhai/Widgets/SelectiveCategroy_List.dart';
import 'package:gwbhai/Data/LoadingImage.dart';
import 'package:gwbhai/Data/CasingsData.dart';
import 'package:gwbhai/Data/MousesData.dart';
import 'package:gwbhai/Data/HeadPhonesData.dart';
import 'package:gwbhai/Data/GraphicCardsData.dart';
import 'package:gwbhai/Data/LedsData.dart';
import 'package:gwbhai/Data/MousePadsData.dart';
import 'package:gwbhai/Widgets/SelectiveCategroy_List.dart';

class DataStream extends StatelessWidget {
  final String tableName;
  final int count;
  DataStream({this.tableName, this.count});


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FeaturedList.fireStore.collection(tableName).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final mydata = snapshot.data.documents;
        //List<Mycard> featuredList=[];

        Provider.of<MyRows>(context, listen: false).myCard.clear();

        Provider.of<KeyBoardsList>(context, listen: false).myCard.clear();
        Provider.of<HeadPhonesList>(context, listen: false).myCard.clear();
        Provider.of<GraphicCardLists>(context, listen: false).myCard.clear();
        Provider.of<LedsList>(context, listen: false).myCard.clear();
        Provider.of<MouseList>(context, listen: false).myCard.clear();
        Provider.of<CasingList>(context, listen: false).myCard.clear();
        Provider.of<MousePadsList>(context, listen: false).myCard.clear();
        for (var mysingleData in mydata) {
          final name = mysingleData.data['Name'];
          final price = mysingleData.data['Price'];
          final url = mysingleData.data['ImageUrl'];
          final mynewCard = Mycard(
            details: name,
            price: price,
            date: mysingleData.data['Date'],
            size: MediaQuery.of(context).size.width,
            networkWidget:LoadFirbaseStorage.getImage(context, url),
          );
          if(tableName.toLowerCase()==HomePage.myclassName.toLowerCase()) {
            Provider.of<MyRows>(context, listen: false).myCard.add(mynewCard);
          }

          else if(tableName.toLowerCase()==KeyBoardsList.myclassName.toLowerCase()){
            Provider.of<KeyBoardsList>(context, listen: false).myCard.add(mynewCard);
          }
          else if(tableName.toLowerCase()==HeadPhonesList.myclassName.toLowerCase()){
            Provider.of<HeadPhonesList>(context, listen: false).myCard.add(mynewCard);
          }
          else if(tableName.toLowerCase()==MousePadsList.myclassName.toLowerCase()){
            Provider.of<MousePadsList>(context, listen: false).myCard.add(mynewCard);
          }
          else if(tableName.toLowerCase()==MouseList.myclassName.toLowerCase()){
            Provider.of<MouseList>(context, listen: false).myCard.add(mynewCard);
          }
          else if(tableName.toLowerCase()==GraphicCardLists.myclassName.toLowerCase()){

            Provider.of<GraphicCardLists>(context, listen: false).myCard.add(mynewCard);
          }
          else if(tableName.toLowerCase()==LedsList.myclassName.toLowerCase()){
            Provider.of<LedsList>(context, listen: false).myCard.add(mynewCard);
          }
          else if(tableName.toLowerCase()==CasingList.myclassName.toLowerCase()){
            Provider.of<CasingList>(context, listen: false).myCard.add(mynewCard);
          }
        }

        if(tableName.toLowerCase()==HomePage.myclassName.toLowerCase()) {
          Provider.of<MyRows>(context, listen: false).myCard.sort((a, b) => a.date.compareTo(b.date));
          return FeaturedList(
            list:  Provider.of<MyRows>(context).myCard,
            list2: Provider.of<MyRows>(context).myCard.reversed.toList(),
            tablename: tableName,
          );
        }

        else if(tableName.toLowerCase()==KeyBoardsList.myclassName.toLowerCase()){
          Provider.of<KeyBoardsList>(context, listen: false).myCard.sort((a, b) => a.date.compareTo(b.date));
          return FeaturedList(
              list:  Provider.of<KeyBoardsList>(context, listen: false).myCard,
              list2:  Provider.of<KeyBoardsList>(context, listen: false).myCard.reversed.toList(),
            tablename: tableName,
          );
        }
        else if(tableName.toLowerCase()==HeadPhonesList.myclassName.toLowerCase()){
          Provider.of<HeadPhonesList>(context, listen: false).myCard.sort((a, b) => a.date.compareTo(b.date));
          return FeaturedList(
            list:  Provider.of<HeadPhonesList>(context, listen: false).myCard,
            list2:  Provider.of<HeadPhonesList>(context, listen: false).myCard.reversed.toList(),
            tablename: tableName,
          );
        }
        else if(tableName.toLowerCase()==MousePadsList.myclassName.toLowerCase()){
          Provider.of<MousePadsList>(context, listen: false).myCard.sort((a, b) => a.date.compareTo(b.date));
          return FeaturedList(
            list:  Provider.of<MousePadsList>(context, listen: false).myCard,
            list2:  Provider.of<MousePadsList>(context, listen: false).myCard.reversed.toList(),
            tablename: tableName,
          );
        }
        else if(tableName.toLowerCase()==MouseList.myclassName.toLowerCase()){
          Provider.of<MouseList>(context, listen: false).myCard.sort((a, b) => a.date.compareTo(b.date));
          return FeaturedList(
            list:  Provider.of<MouseList>(context, listen: false).myCard,
            list2:  Provider.of<MouseList>(context, listen: false).myCard.reversed.toList(),
            tablename: tableName,
          );
        }
        else if(tableName.toLowerCase()==GraphicCardLists.myclassName.toLowerCase()){
          Provider.of<GraphicCardLists>(context, listen: false).myCard.sort((a, b) => a.date.compareTo(b.date));
          return FeaturedList(
            list:  Provider.of<GraphicCardLists>(context, listen: false).myCard,
            list2:  Provider.of<GraphicCardLists>(context, listen: false).myCard.reversed.toList(),
            tablename: tableName,
          );
        }
        else if(tableName.toLowerCase()==LedsList.myclassName.toLowerCase()){
          Provider.of<LedsList>(context, listen: false).myCard.sort((a, b) => a.date.compareTo(b.date));
          return FeaturedList(
            list: Provider.of<LedsList>(context, listen: false).myCard,
            list2: Provider.of<LedsList>(context, listen: false).myCard.reversed.toList(),
            tablename: tableName,
          );

        }
        else if(tableName.toLowerCase()==CasingList.myclassName.toLowerCase()){
          Provider.of<CasingList>(context, listen: false).myCard.sort((a, b) => a.date.compareTo(b.date));
          return FeaturedList(
            list:  Provider.of<CasingList>(context, listen: false).myCard,
            list2:  Provider.of<CasingList>(context, listen: false).myCard.reversed.toList(),
            tablename: tableName,
          );

        }
        return null;
      },
    );
  }
}




// List<Mycard> keyBoardsList=[];
// List<Mycard> grapicCardList=[];
//  List<Mycard> headPhonesList=[];
//List<Mycard> ledsList=[];
// List<Mycard> mousePadsList=[];
//  List<Mycard> mousesList=[];
// List<Mycard> casingsList=[];







//Provider
//    .of<MyRows>(context)
//.myCard
//    .sort((a, b) => a.date.compareTo(b.date));
//
//else if (category.toLowerCase() == 'keyboard' &&
//tablename.toLowerCase() == 'keyboardlist1') {
//Provider.of<KeyBoardsList>(context).addcard(mynewCard);
//} else if (category.toLowerCase() == 'keyboard' &&
//tablename.toLowerCase() == 'keyboardlist2') {
//Provider.of<KeyBoardsList>(context).addcard2(mynewCard);
//}






