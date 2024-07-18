import 'package:prayertimes/models/prayermodel.dart';

class Cityinfo {
  List<Vakit>? vakit;

  Cityinfo({this.vakit});

  Cityinfo.fromJson(Map<String, dynamic> json) {
    if (json['vakit'] != null) {
      vakit = <Vakit>[];
      json['vakit'].forEach((v) {
        vakit!.add(Vakit.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (vakit != null) {
      data['vakit'] = vakit!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}