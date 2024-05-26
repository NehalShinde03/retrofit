import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

// @JsonSerializable()
// class User{
//   final int? page;
//   final int? perPage;
//   final int? total;
//   final int? totalPages;
//   final List<Data>? data;
//   final Support? support;
//
//   User({this.page, this.perPage, this.total, this.totalPages, this.data, this.support});
//
//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
//
//   Map<String, dynamic> toJson() => _$UserToJson(this);
// }


/*"id": 6927832,
  "name": "Bhagvan Bharadwaj",
  "email": "bharadwaj_bhagvan@senger.example",
  "gender": "female",
  "status": "inactive"*/

@JsonSerializable()
class Data{
  final int? id;
  final String? name;
  final String? email;
  final String? gender;
  final String? status;

  Data({this.id, this.email, this.name, this.gender, this.status});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

//
// @JsonSerializable()
// class Support{
//   final String? url;
//   final String? text;
//
//   Support({this.url, this.text});
//
//   factory Support.fromJson(Map<String, dynamic> json) => _$SupportFromJson(json);
//
//   Map<String, dynamic> toJson() => _$SupportToJson(this);
// }
