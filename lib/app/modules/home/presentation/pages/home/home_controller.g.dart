// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<UserBankUsecase>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$showInfosAtom = Atom(name: '_HomeControllerBase.showInfos');

  @override
  bool get showInfos {
    _$showInfosAtom.reportRead();
    return super.showInfos;
  }

  @override
  set showInfos(bool value) {
    _$showInfosAtom.reportWrite(value, super.showInfos, () {
      super.showInfos = value;
    });
  }

  final _$balanceAtom = Atom(name: '_HomeControllerBase.balance');

  @override
  double get balance {
    _$balanceAtom.reportRead();
    return super.balance;
  }

  @override
  set balance(double value) {
    _$balanceAtom.reportWrite(value, super.balance, () {
      super.balance = value;
    });
  }

  final _$nameAtom = Atom(name: '_HomeControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$loadingAtom = Atom(name: '_HomeControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: '_HomeControllerBase.error');

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$updateBalanceAsyncAction =
      AsyncAction('_HomeControllerBase.updateBalance');

  @override
  Future updateBalance() {
    return _$updateBalanceAsyncAction.run(() => super.updateBalance());
  }

  final _$fetchUserBankAsyncAction =
      AsyncAction('_HomeControllerBase.fetchUserBank');

  @override
  Future fetchUserBank() {
    return _$fetchUserBankAsyncAction.run(() => super.fetchUserBank());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setShowInfos() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setShowInfos');
    try {
      return super.setShowInfos();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showInfos: ${showInfos},
balance: ${balance},
name: ${name},
loading: ${loading},
error: ${error}
    ''';
  }
}
