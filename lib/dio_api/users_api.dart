
import 'package:path/path.dart';
import 'package:posts_mobx/helper/MyTool.dart';
import 'package:posts_mobx/pages/users/post.dart';
import 'package:posts_mobx/pages/users/user.dart';

import 'dio_factory.dart';

class UserUrl {
  static const all = 'users';
  static const user_posts = 'posts';
}

class UsersApi {
  var http = DioFactory.create();

  // static List<User> usersList = List.empty();
  Future getAllUsers() async {
    List<User> list = [];
    try {
      final response = await http.get(UserUrl.all);
      if (response.statusCode == 200) {
        final data = response.data;
        list = (data as List).map((json) {
          return User.fromJSON(json);
        }).toList();
        MyTool.logPrint("getResulSelectedItem ok $url $data");
        return list;
      } else {
        MyTool.logPrint("getResulSelectedItem Error in URL");
      }
    } catch (e) {
      MyTool.logPrint("getResulSelectedItem error $url  " +  e.toString());
      return list;
    }

    return list;
  }


  // static List<Post> postsList = List.empty();
  Future getAllPosts() async {
    List<Post> list = [];
    try {
      final response = await http.get(UserUrl.user_posts);
      if (response.statusCode == 200) {
        final data = response.data;
        list = (data as List).map((json) {
          return Post.fromJSON(json);
        }).toList();
        MyTool.logPrint("getResulSelectedItem ok $url $data");
        return list;
      } else {
        MyTool.logPrint("getResulSelectedItem Error in URL");
      }
    } catch (e) {
      MyTool.logPrint("getResulSelectedItem error $url  " +  e.toString());
      return list;
    }

    return list;
  }
}
