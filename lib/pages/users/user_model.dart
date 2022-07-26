
import 'package:mobx/mobx.dart';
import 'package:posts_mobx/pages/_shared/base_model.dart';
import 'package:posts_mobx/pages/users/post.dart';

import 'user.dart';

part 'user_model.g.dart';


class UserModel = _UserModel with _$UserModel;

abstract class _UserModel extends BaseModel with Store {

  User? currentUser;

  List<User> usersList = List.empty();

  List<Post> postsList = List.empty();

  List<Post> currentPostsList = List.empty();


  Map<dynamic, List<Post>> usersPosts = {};


  @observable
  int currentPostsListState = 0;

  @action
  setCurrentPostsList(){
    try {
      currentPostsListState = 0;
      MapEntry entry = usersPosts.entries.firstWhere((element) => element.key == currentUser?.userId.value);
      currentPostsList = entry.value;
      currentPostsListState = 1;
    } catch (e) {
      print(e);
    }
  }

}