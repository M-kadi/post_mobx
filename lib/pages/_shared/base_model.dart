import 'package:mobx/mobx.dart';

import 'model.dart';

part 'base_model.g.dart';

enum ActionType {
  Edit,
  New,
  Show,
  Delete
}

typedef DeleteCallback = Function(String id);

class BaseModel = _BaseModel with _$BaseModel;

abstract class _BaseModel extends Model with Store {

  @observable
  String title = "Add New Item";

  @observable
  ActionType actionType = ActionType.Show;

  @observable
  dynamic current;

  @observable
  dynamic currentID;

  @observable
  ObservableFuture<List<dynamic>> listFuture = ObservableFuture<
      List<dynamic>>.value([]);

  @action
  void setAddNew(_current, _title) {
    current = _current;
    title = _title;
    actionType = ActionType.New;
  }

  Future getDataFromDB() async {
    return null;
  }

  var addDefaultFilter = true;

  Future getDataFromNet() async {
    return null;
  }

  Future getDataFromLocal(context) async {
    return null;
  }

  @observable
  int size = 0;

  @action
  Future fetchDataFromLocal(context) {
    actionType = ActionType.Show;
    // set : size = null : before load data : DataList
    size = 0;

    listFuture =
        ObservableFuture(getDataFromLocal(context)
            .then((Data) {
          setListSearch(Data);
          return getData(Data);
        }));

    // Solve Error : The onRefresh callback returned null.
    return listFuture;
  }

  List<dynamic> listSearch = [];

  void setListSearch(val) {
    listSearch = val;
    size = listSearch.length;
  }

  dynamic getData(data) {
    return data;
  }

  // add in title : name of Current row (value of one column) in (Edit/Show)
  String? getTitleModel() {
    return null;
  }

  setShowCurrentAction(index) {
  }

  showCurrentAction(showFormPath, context) {
  }

  editCurrentAction(showFormPath, context) {
  }

  addNewAction(showFormPath, context) {
  }

  @action
  void setShowCurrentTitle(_title, _modelTitle) {
    title = _title + (_modelTitle != null ? ": " + _modelTitle : "");
    actionType = ActionType.Show;
  }

  @action
  void setEditCurrentTitle(_title, _modelTitle) {
    title = _title + (_modelTitle != null ? ": " + _modelTitle : "");
    actionType = ActionType.Edit;
  }

  @action
  void setAddNewTitle(_title) {
    title = _title;
    actionType = ActionType.New;
  }

  String toStrForDelete() {
    return "\n";
  }

  bool checkBeforeEdit() {
    return true;
  }

  bool checkBeforeRemove() {
    return true;
  }
}