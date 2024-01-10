import 'dart:convert';
List<PublicApiResponse> publicApiResponseFromJson(String str) => List<PublicApiResponse>.from(json.decode(str).map((x) => PublicApiResponse.fromJson(x)));

String publicApiResponseToJson(List<PublicApiResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PublicApiResponse {
    String? p_name;
    int? p_id;
    int? p_cost;
    int? p_availability;
    String? p_details;
    String? p_category;
    String? photo;

    PublicApiResponse({
        this.p_name,
        this.p_id,
        this.p_cost,
        this.p_availability,
        this.p_details,
        this.p_category,
        this.photo,
    });

    factory PublicApiResponse.fromJson(Map<String, dynamic> json) => PublicApiResponse(
        p_name: json["p_name"],
        p_id: json["p_id"],
        p_cost: json["p_cost"],
        p_availability: json["p_availability"],
        p_details: json["p_details"],
        p_category: json["p_category"],
        photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "p_name": p_name,
        "p_id": p_id,
        "p_cost": p_cost,
        "p_availability": p_availability,
        "p_details": p_details,
        "p_category": p_category,
        "photo": photo,
    };
}
