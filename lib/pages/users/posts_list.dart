import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:posts_mobx/helper/MyTool.dart';
import 'package:posts_mobx/pages/users/user_model.dart';
import 'package:posts_mobx/service/locator.dart';
import 'package:posts_mobx/widgets/StaticWidgets.dart';

class PostsList extends StatelessWidget {
  PostsList({Key? key}) : super(key: key);

  final UserModel _userModel = locator.get();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          body:buildBody(context)
      );
  }

  Widget buildBody(context) {
    return Observer(builder: (_) {
      MyTool.logPrint('${_userModel.currentPostsListState}');

      if (_userModel.currentPostsListState == 0)  return Container();

      var posts = _userModel.currentPostsList;
      return
        CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              expandedHeight: 200.0,
              floating: true,
              pinned: true,
              snap: true,
              actionsIconTheme: IconThemeData(opacity: 0.0),
              flexibleSpace: Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: ClipRRect(
                        borderRadius: getBorderCircular(),
                        child: Image.network(_userModel.currentUser?.url.value,
                          fit: BoxFit.cover,
                        ),
                      ))
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white70, width: 1),
                        borderRadius: getBorderCircular(),
                      ),
                      child: ListTile(
                        title: Center(child: Text(
                          posts[index].title.value,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                        subtitle: Center(child: Text(
                          posts[index].body.value,
                          style: TextStyle(fontSize: 16),
                        )),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      ));
                },
                childCount: posts.length,
              ),
            ),
          ],
        );
    });
  }
}