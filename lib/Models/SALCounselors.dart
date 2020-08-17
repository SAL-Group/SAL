import 'dart:convert';
import 'SALCounselor.dart';

class SALCounselors {

  final List<SALCounselor> counselors;

  SALCounselors({this.counselors});

  factory SALCounselors.fromRawJson(String str) =>
      SALCounselors.fromJson(json.decode(str));

  factory SALCounselors.fromJson(Map<String, dynamic> json) => SALCounselors(
      counselors: List<SALCounselor>.from(
          json["counselors"].map((x) => SALCounselor.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "counselors": List<dynamic>.from(counselors.map((x) => x.toJson())),
      };
}