import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:posts_mobx/pages/_shared/base_model.dart';

import 'content_home.dart';

part 'content_home_model.g.dart';

class ContentHomeModel = _ContentHomeModel with _$ContentHomeModel;

abstract class _ContentHomeModel extends BaseModel with Store {

  @override
  Future getDataFromLocal(context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/data/content_home.json');
    final body = json.decode(data);
    var list = body.map<ContentHome>(ContentHome.fromJson2).toList();

    return list;
  }
}