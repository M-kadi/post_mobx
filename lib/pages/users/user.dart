import 'package:posts_mobx/data_types/int_type.dart';
import 'package:posts_mobx/data_types/string_type.dart';
import 'package:posts_mobx/pages/_shared/base_entity.dart';

class UserData {
  static const colName = 'name';
  static const colUrl = 'url';
  static const colThumbnailUrl = 'thumbnailUrl';
  static const colUserId = 'userId';
  static const colPostsCount = 'postsCount';
}

class User extends BaseEntity{
  StringType name = StringType();
  StringType url = StringType();
  StringType thumbnailUrl = StringType();
  IntType userId = IntType();
  IntType postsCount = IntType();

  User({required this.name, required this.url, required this.thumbnailUrl,
    required this.userId});

  User.init();

  @override
  String getTitle(){
    return name.value;
  }

  @override
  String toString() =>
      name.value;

  factory User.fromJSON(Map<dynamic, dynamic> json) => get(json);

  static User fromJson2(json) => get(json);

  static User get(json) => User(
    name: StringType(value: json[UserData.colName]),
    url: StringType(value: json[UserData.colUrl]),
    thumbnailUrl: StringType(value: json[UserData.colThumbnailUrl]),
    userId: IntType(value: json[UserData.colUserId]),
  );

  @override
  Map<String, dynamic> toJson() =>
      {
        UserData.colName: name.value,
        UserData.colUrl: url.value,
        UserData.colThumbnailUrl: thumbnailUrl.value,
        UserData.colUserId: userId.value,
      };
}