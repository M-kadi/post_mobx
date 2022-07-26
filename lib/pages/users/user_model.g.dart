// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserModel on _UserModel, Store {
  final _$currentPostsListStateAtom =
      Atom(name: '_UserModel.currentPostsListState');

  @override
  int get currentPostsListState {
    _$currentPostsListStateAtom.reportRead();
    return super.currentPostsListState;
  }

  @override
  set currentPostsListState(int value) {
    _$currentPostsListStateAtom.reportWrite(value, super.currentPostsListState,
        () {
      super.currentPostsListState = value;
    });
  }

  final _$_UserModelActionController = ActionController(name: '_UserModel');

  @override
  dynamic setCurrentPostsList() {
    final _$actionInfo = _$_UserModelActionController.startAction(
        name: '_UserModel.setCurrentPostsList');
    try {
      return super.setCurrentPostsList();
    } finally {
      _$_UserModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPostsListState: ${currentPostsListState}
    ''';
  }
}
