import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:posts_mobx/localization/app_localizations.dart';
import 'package:posts_mobx/pages/_shared/base_model.dart';

import '/widgets/action_btn.dart';

class DataGrid extends StatefulWidget {
  BaseModel baseModel;
  Widget? Function(dynamic, int) buildListItemCallback;

  DataGrid({required this.baseModel, required this.buildListItemCallback,});

  @override
  _DataGridState createState() => _DataGridState();
}

class _DataGridState extends State<DataGrid> {
  ScrollController _semicircleController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // add : Dashboard in ContentHomeScreen
    return
      _buildGridView();
  }

  Widget _buildGridView() {
    return
      Observer(
        builder: (_) {
          switch (widget.baseModel.listFuture.status) {
            case FutureStatus.pending:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case FutureStatus.rejected:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      AppLocalizations.dataListErrorLoadItems,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ActionBtn(
                      onPressCallback: _refresh,
                      titleBtn: AppLocalizations.dataListRefresh,),
                  ],
                ),
              );
            case FutureStatus.fulfilled:
              final List<dynamic> data = widget.baseModel.listFuture.result;
              return
                RefreshIndicator(
                  onRefresh: _refresh,
                  child: DraggableScrollbar.arrows(
                      backgroundColor: Theme.of(context).accentColor,
                      padding: const EdgeInsets.only(right: 4.0),
                      controller: _semicircleController,
                      child: GridView.builder(
                        controller: _semicircleController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: data.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10
                        ),
                        itemBuilder: (context, index) {
                          final row = data[index];
                          return Container(
                            child: widget.buildListItemCallback(row, index),
                          );
                        },
                      )
                  ),
                );
          }
        },
      );
  }

  // Stop refresh from net: DataGrid : dashboard
  Future _refresh() => widget.baseModel.fetchDataFromLocal(context);
}