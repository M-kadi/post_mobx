import 'package:flutter/material.dart';
import 'package:posts_mobx/pages/users/user_model.dart';
import 'package:posts_mobx/route/route.dart';
import 'package:posts_mobx/service/locator.dart';
import 'package:posts_mobx/widgets/StaticWidgets.dart';

class UsersList extends StatelessWidget {
  UsersList({Key? key}) : super(key: key);

  final UserModel _userModel = locator.get();


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          body: Column(children: [
            Divider(height: 25.0,),
            Expanded(child: buildListUser(context),),
          ],)

      );
  }

  Widget buildListUser(context) {
    return
      ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(
          thickness: 0,
          color: Colors.transparent,),
        padding: const EdgeInsets.all(8),
        itemCount: _userModel.usersList.length,
        itemBuilder: (context, index) {
          return Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: getBorderCircular(),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      _userModel.usersList[index].thumbnailUrl.value),
                  backgroundColor: Colors.transparent,
                ),
                title: Center(child: Text(
                  _userModel.usersList[index].name.value,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
                subtitle: Center(child: Text(
                  _userModel.usersList[index].postsCount.value.toString(),
                  style: TextStyle(fontSize: 16),
                )),
                trailing: Icon(Icons.arrow_right),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),

                onTap: () {
                  _userModel.currentUser = _userModel.usersList[index];
                  _userModel.setCurrentPostsList();
                  Navigator.of(context).pushNamed(Routes.POSTS_LIST);

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => PostDetailPage(post: posts[index]),
                  //   ),
                  // );
                },
              ));
        },
      );
  }
}