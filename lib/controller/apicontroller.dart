import 'dart:convert';
import 'package:ecommercesas/model/item_modal.dart';
import 'package:ecommercesas/model/productmodal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
String publicApiResponseJson = '''[
{
"p_name":"Apple",
"p_id":1,
"p_cost":30,
"p_availability":1,
"p_details":"Imported from Swiss",
"p_category":"Premium",
"photo":"https://images.pexels.com/photos/102104/pexels-photo-102104.jpeg?auto=compress&cs=tinysrgb&w=600"
},
{
"p_name":"Mango",
"p_id":2,
"p_cost":50,
"p_availability":1,
"p_details":"Farmed at Selam",
"p_category":"Tamilnadu",
"photo":"https://images.pexels.com/photos/39303/mango-tropical-fruit-juicy-sweet-39303.jpeg?auto=compress&cs=tinysrgb&w=600"
},
{
"p_name":"Bananna",
"p_id":3,
"p_cost":5,
"p_availability":0,
"p_details":"Farmed at Selam",
"p_category":"Tamilnadu",
"photo":"https://images.pexels.com/photos/2280926/pexels-photo-2280926.jpeg?auto=compress&cs=tinysrgb&w=600"
},
{
"p_name":"Orange",
"p_id":4,
"p_cost":25,
"p_availability":1,
"p_details":"from Nagpur",
"p_category":"Premium",
"photo":"https://images.pexels.com/photos/161559/background-bitter-breakfast-bright-161559.jpeg?auto=compress&cs=tinysrgb&w=600"
}
]''';

List<PublicApiResponse> publicApiResponseFromJsonString(String str) =>
    List<PublicApiResponse>.from(
        json.decode(str).map((x) => PublicApiResponse.fromJson(x)));

List<PublicApiResponse> publicApiResponseConstants =
    publicApiResponseFromJsonString(publicApiResponseJson);

List<PublicApiResponse> filterByCategory(
    List<PublicApiResponse> items, String category) {
  return items.where((item) => item.p_category == category).toList();
}

List<PublicApiResponse> tamilnaduItems =
    filterByCategory(publicApiResponseConstants, "Tamilnadu");
List<PublicApiResponse> premiumItems =
    filterByCategory(publicApiResponseConstants, "Premium");


PublicApiResponse? responseData;
Future<void> fetchapidata(BuildContext context) async {
  try{
  final url = Uri.parse("https://yourvegitabledata'api'here");
  var response = await http.get(url);
  if(response.statusCode == 200){
  responseData = PublicApiResponse.fromJson(jsonDecode(response.body));
  } else {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Swipe down to refresh")));
  }
  } catch(e){
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${e.toString()} ; Swipe down to refresh")));
  }
}




String updateJsonWithQuantityFromItems(String jsonStr, List<ItemModal> itemModels) {
  // print("insode");
  List<dynamic> jsonDynamic = json.decode(jsonStr);
  List<Map<String, dynamic>> jsonData = jsonDynamic.cast<Map<String, dynamic>>();

  for (var jsonItem in jsonData) {
    ItemModal matchingItem = itemModels.firstWhere(
      (item) => item.pid == jsonItem['p_id'],
      orElse: () => ItemModal(name: null, image: null, price: null, quantity: 0, pid: null),
    );

    if (matchingItem.quantity != null && matchingItem.quantity! > 0) {
      jsonItem['quantity'] = matchingItem.quantity;
    }
  }

  return json.encode(jsonData);
}


