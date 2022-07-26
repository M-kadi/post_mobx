import 'package:posts_mobx/data_types/int_type.dart';
import 'package:posts_mobx/data_types/string_type.dart';
import 'package:posts_mobx/pages/_shared/base_entity.dart';

class PostData {
  static const colTitle = 'title';
  static const colBody = 'body';
  static const colUserId = 'userId';
}

class Post extends BaseEntity{
  StringType title = StringType();
  StringType body = StringType();
  IntType userId = IntType();

  Post({required this.title, required this.body, required this.userId});

  Post.init();

  factory Post.fromJSON(Map<dynamic, dynamic> json) => get(json);

  static Post fromJson2(json) => get(json);

  static Post get(json) => Post(
    userId: IntType(value: json[PostData.colUserId]),
    title: StringType(value: json[PostData.colTitle]),
    body: StringType(value: json[PostData.colBody]),
  );

  @override
  Map<String, dynamic> toJson() =>
      {
        PostData.colTitle: title.value,
        PostData.colBody: body.value,
        PostData.colUserId: userId.value,
      };
}