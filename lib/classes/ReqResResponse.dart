// To parse this JSON data, do
//     final reqResResponse = reqResResponseFromJson(jsonString);

import 'dart:convert';

import 'Person.dart';

ReqResResponse reqResResponseFromJson(String str) =>
    ReqResResponse.fromJson(json.decode(str));

String reqResResponseToJson(ReqResResponse data) => json.encode(data.toJson());

class ReqResResponse {
  ReqResResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  int page;
  int perPage;
  int total;
  int totalPages;
  List<Person> data;

  factory ReqResResponse.fromJson(Map<String, dynamic> json) => ReqResResponse(
        page        : json['page'],
        perPage     : json['per_page'],
        total       : json['total'],
        totalPages  : json['total_pages'],
        data        : List<Person>.from(json['data'].map((x) => Person.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'page'        : page,
        'per_page'    : perPage,
        'total'       : total,
        'total_pages' : totalPages,
        'data'        : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}