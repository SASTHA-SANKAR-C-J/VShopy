
import 'dart:convert';

import 'package:ecommercesas/model/productmodal.dart';
// ... [Your PublicApiResponse class definition here]

// Define the constant list of PublicApiResponse objects
// List<PublicApiResponse> publicApiResponses = [
//   PublicApiResponse(
//     pName: "Apple",
//     pId: 1,
//     pCost: 30,
//     pAvailability: 1,
//     pDetails: "Imported from Swiss",
//     pCategory: "Premium",
//   ),
//   // ... [Add other items in a similar way]
// ];

// Alternatively, if you want to define it from a JSON string:
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

// Convert JSON string to PublicApiResponse objects
List<PublicApiResponse> publicApiResponseFromJsonString(String str) =>
    List<PublicApiResponse>.from(json.decode(str).map((x) => PublicApiResponse.fromJson(x)));

// Use this to get the constant list from JSON
List<PublicApiResponse> publicApiResponseConstants = publicApiResponseFromJsonString(publicApiResponseJson);

List<PublicApiResponse> filterByCategory(List<PublicApiResponse> items, String category) {
  return items.where((item) => item.p_category == category).toList();
}

// Example usage:
List<PublicApiResponse> tamilnaduItems = filterByCategory(publicApiResponseConstants, "Tamilnadu");
List<PublicApiResponse> premiumItems = filterByCategory(publicApiResponseConstants, "Premium");
