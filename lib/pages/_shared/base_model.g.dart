// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BaseModel on _BaseModel, Store {
  final _$titleAtom = Atom(name: '_BaseModel.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$actionTypeAtom = Atom(name: '_BaseModel.actionType');

  @override
  ActionType get actionType {
    _$actionTypeAtom.reportRead();
    return super.actionType;
  }

  @override
  set actionType(ActionType value) {
    _$actionTypeAtom.reportWrite(value, super.actionType, () {
      super.actionType = value;
    });
  }

  final _$currentAtom = Atom(name: '_BaseModel.current');

  @override
  dynamic get current {
    _$currentAtom.reportRead();
    return super.current;
  }

  @override
  set current(dynamic value) {
    _$currentAtom.reportWrite(value, super.current, () {
      super.current = value;
    });
  }

  final _$currentIDAtom = Atom(name: '_BaseModel.currentID');

  @override
  dynamic get currentID {
    _$currentIDAtom.reportRead();
    return super.currentID;
  }

  @override
  set currentID(dynamic value) {
    _$currentIDAtom.reportWrite(value, super.currentID, () {
      super.currentID = value;
    });
  }

  final _$listFutureAtom = Atom(name: '_BaseModel.listFuture');

  @override
  ObservableFuture<List<dynamic>> get listFuture {
    _$listFutureAtom.reportRead();
    return super.listFuture;
  }

  @override
  set listFuture(ObservableFuture<List<dynamic>> value) {
    _$listFutureAtom.reportWrite(value, super.listFuture, () {
      super.listFuture = value;
    });
  }

  final _$sizeAtom = Atom(name: '_BaseModel.size');

  @override
  int get size {
    _$sizeAtom.reportRead();
    return super.size;
  }

  @override
  set size(int value) {
    _$sizeAtom.reportWrite(value, super.size, () {
      super.size = value;
    });
  }

  final _$_BaseModelActionController = ActionController(name: '_BaseModel');

  @override
  void setAddNew(dynamic _current, dynamic _title) {
    final _$actionInfo =
        _$_BaseModelActionController.startAction(name: '_BaseModel.setAddNew');
    try {
      return super.setAddNew(_current, _title);
    } finally {
      _$_BaseModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchDataFromLocal(dynamic context) {
    final _$actionInfo = _$_BaseModelActionController.startAction(
        name: '_BaseModel.fetchDataFromLocal');
    try {
      return super.fetchDataFromLocal(context);
    } finally {
      _$_BaseModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowCurrentTitle(dynamic _title, dynamic _modelTitle) {
    final _$actionInfo = _$_BaseModelActionController.startAction(
        name: '_BaseModel.setShowCurrentTitle');
    try {
      return super.setShowCurrentTitle(_title, _modelTitle);
    } finally {
      _$_BaseModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEditCurrentTitle(dynamic _title, dynamic _modelTitle) {
    final _$actionInfo = _$_BaseModelActionController.startAction(
        name: '_BaseModel.setEditCurrentTitle');
    try {
      return super.setEditCurrentTitle(_title, _modelTitle);
    } finally {
      _$_BaseModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddNewTitle(dynamic _title) {
    final _$actionInfo = _$_BaseModelActionController.startAction(
        name: '_BaseModel.setAddNewTitle');
    try {
      return super.setAddNewTitle(_title);
    } finally {
      _$_BaseModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
actionType: ${actionType},
current: ${current},
currentID: ${currentID},
listFuture: ${listFuture},
size: ${size}
    ''';
  }
}
