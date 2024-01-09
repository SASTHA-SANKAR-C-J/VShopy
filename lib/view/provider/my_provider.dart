
import 'package:ecommercesas/model/item_modal.dart';
import 'package:flutter/material.dart';

class MyCartProvider with ChangeNotifier {
  List<ItemModal> itemlist = [];
  int qcount=1;
  void incre (){
    qcount++;
    notifyListeners();
  }
  void decre(){
    qcount--;
    notifyListeners();
  }
  void additem(ItemModal items){
    itemlist.add(items);
    notifyListeners();
  }
  void deleteitem(int index){
    itemlist.removeAt(index);
    notifyListeners();
  }
}