import 'package:flutter/material.dart';
import 'package:posts_mobx/helper/MyTool.dart';

import 'locale/arabic.dart';
import 'locale/dutch.dart';
import 'locale/english.dart';
import 'locale/turkish.dart';

enum LocalStr {
  SettingsScreen,
  UsersScreen,
  SelectLanguage,
  SelectTheme,
  SystemTheme,
  LightTheme,
  DarkTheme,
  Logout,
  Login,
  ForgetPassword,
  SendPassword,
  AboutApp,
  Email,
  EmailHintInput,
  EmailErrorInput,
  Password,
  PasswordHintInput,
  PasswordErrorInput,
  LoginErrorInput,
  AddNewUser,
  EditCurrentUser,
  ShowCurrentUser,
  PleaseWait,
  Save,
  MustAddTitle,
  Title,
  EnterTitle,
  DataListRefresh,
  DataListErrorLoadItems,
  SearchStr,
  ProductType,
  ProductTypeSearch,
  DoesNotAllowEditing,
  DoesNotAllowDeletion,
  doesNotAllowToShow,
  AppName,
  Version,
  Hello,
  RecordWillBeDeletedAreYouSure,
  FilterList,
  Filters,
  OK,
  Cancel,
  Delete,
  Edit,
  ChangeFilters,
  ShowAll,
  PDFExport,
  ApplicationFontSize,
  EnterYourPinCode,
  EnterPinCode,
  PinCode,
  PinCodeMustBeEntered,
  EnterPinCodeRepeat,
  RepeatPinCode,
  PinCodeMustBeEnteredRepeat,
  YourPinCodeVerification,
  Verify,
  ToDelete,
  ForgotPinCode,

  Name,
  Role,
  LastLogin,
  CreatedAt,
  UsePinCode,
  AppBuildDate,
  APIBuildDate,
  SomethingWentWrong,

  CheckForNullValues,
  NameHintInput,
  NameErrorInput,
}

extension ParseToString on LocalStr {
  String toStr() {
    return this.toString().split('.').last;
  }
}

class AppLocalizations {
  AppLocalizations(this.locale) {
    currentLocale = locale;
  }

  final Locale locale;
  static late Locale currentLocale;
  static const String enLanguage = 'en';
  static const String nlLanguage = 'nl';
  static const String arLanguage = 'ar';
  static const String trLanguage = 'tr';
  static const String languageCodeDefault = enLanguage;// Default lan of app

  static const String enName = 'English';
  static const String nlName = 'Dutch';
  static const String arName = 'العربية';
  static const String trName = 'Türkçe';
  static const String languageNameDefault = enName;// Default lan of app

  static const int enID = 0;
  static const int nlID = 1;
  static const int trID = 2;
  static const int arID = 3;
  static const int languageIDDefault = enID;// Default lan of app

  static List<String> get supportedLanguages {
    return [enLanguage, nlLanguage, arLanguage, trLanguage];
  }

  static Map<String, Map<String, String>> _localizedValues = {
    enLanguage: {...english},
    nlLanguage: {...dutch},
    arLanguage: {...arabic},
    trLanguage: {...turkish},
  };

  static String get defaultLanguage {
    return enLanguage;
  }

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static List<Locale> getSupportedLocales() {
    return AppLocalizations.supportedLanguages
        .map((lang) => Locale(lang))
        .toList();
  }

  static String get selectLanguage => getValue(LocalStr.SelectLanguage.toStr());
  static String get selectTheme => getValue(LocalStr.SelectTheme.toStr());

  static String get system => getValue(LocalStr.SystemTheme.toStr());
  static String get light => getValue(LocalStr.LightTheme.toStr());
  static String get dark => getValue(LocalStr.DarkTheme.toStr());

  static String get logout => getValue(LocalStr.Logout.toStr());
  static String get login => getValue(LocalStr.Login.toStr());

  static String get forgetPassword => getValue(LocalStr.ForgetPassword.toStr());
  static String get sendPassword => getValue(LocalStr.SendPassword.toStr());

  static String get aboutApp => getValue(LocalStr.AboutApp.toStr());

  static String get email => getValue(LocalStr.Email.toStr());
  static String get emailHintInput => getValue(LocalStr.EmailHintInput.toStr());
  static String get emailErrorInput => getValue(LocalStr.EmailErrorInput.toStr());

  static String get password => getValue(LocalStr.Password.toStr());
  static String get passwordHintInput => getValue(LocalStr.PasswordHintInput.toStr());
  static String get passwordErrorInput => getValue(LocalStr.PasswordErrorInput.toStr());

  static String get pleaseWait => getValue(LocalStr.PleaseWait.toStr());

  static String get loginErrorInput => getValue(LocalStr.LoginErrorInput.toStr());

  static String get addNewUser => getValue(LocalStr.AddNewUser.toStr());
  static String get editCurrentUser => getValue(LocalStr.EditCurrentUser.toStr());
  static String get showCurrentUser => getValue(LocalStr.ShowCurrentUser.toStr());

  static String get save => getValue(LocalStr.Save.toStr());
  static String get mustAddTitle => getValue(LocalStr.MustAddTitle.toStr());
  static String get title => getValue(LocalStr.Title.toStr());
  static String get enterTitle => getValue(LocalStr.EnterTitle.toStr());

  static String get dataListRefresh => getValue(LocalStr.DataListRefresh.toStr());
  static String get dataListErrorLoadItems => getValue(LocalStr.DataListErrorLoadItems.toStr());

  static String get searchStr => getValue(LocalStr.SearchStr.toStr());

  static String get productType => getValue(LocalStr.ProductType.toStr());
  static String get productTypeSearch => getValue(LocalStr.ProductTypeSearch.toStr());

  static String get settingsScreen => getValue(LocalStr.SettingsScreen.toStr());
  static String get usersScreen => getValue(LocalStr.UsersScreen.toStr());

  static String get recordWillBeDeletedAreYouSure => getValue(LocalStr.RecordWillBeDeletedAreYouSure.toStr());

  static String get hello => getValue(LocalStr.Hello.toStr());

  static String get version => getValue(LocalStr.Version.toStr());
  static String get appName => getValue(LocalStr.AppName.toStr());

  static String get doesNotAllowToShow => getValue(LocalStr.doesNotAllowToShow.toStr());
  static String get doesNotAllowDeletion => getValue(LocalStr.DoesNotAllowDeletion.toStr());
  static String get doesNotAllowEditing => getValue(LocalStr.DoesNotAllowEditing.toStr());

  static String get FilterList => getValue(LocalStr.FilterList.toStr());
  static String get Filters => getValue(LocalStr.Filters.toStr());
  static String get OK => getValue(LocalStr.OK.toStr());
  static String get Cancel => getValue(LocalStr.Cancel.toStr());

  static String get delete => getValue(LocalStr.Delete.toStr());
  static String get Edit => getValue(LocalStr.Edit.toStr());
  static String get ChangeFilters => getValue(LocalStr.ChangeFilters.toStr());
  static String get ShowAll => getValue(LocalStr.ShowAll.toStr());
  static String get PDFExport => getValue(LocalStr.PDFExport.toStr());

  static String get ApplicationFontSize => getValue(LocalStr.ApplicationFontSize.toStr());
  static String get EnterYourPinCode => getValue(LocalStr.EnterYourPinCode.toStr());
  static String get EnterPinCode => getValue(LocalStr.EnterPinCode.toStr());
  static String get PinCode => getValue(LocalStr.PinCode.toStr());
  static String get PinCodeMustBeEntered => getValue(LocalStr.PinCodeMustBeEntered.toStr());
  static String get EnterPinCodeRepeat => getValue(LocalStr.EnterPinCodeRepeat.toStr());
  static String get RepeatPinCode => getValue(LocalStr.RepeatPinCode.toStr());
  static String get PinCodeMustBeEnteredRepeat => getValue(LocalStr.PinCodeMustBeEnteredRepeat.toStr());
  static String get YourPinCodeVerification => getValue(LocalStr.YourPinCodeVerification.toStr());
  static String get Verify => getValue(LocalStr.Verify.toStr());
  static String get ToDelete => getValue(LocalStr.ToDelete.toStr());
  static String get ForgotPinCode => getValue(LocalStr.ForgotPinCode.toStr());

  static String get Name => getValue(LocalStr.Name.toStr());
  static String get Role => getValue(LocalStr.Role.toStr());
  static String get LastLogin => getValue(LocalStr.LastLogin.toStr());
  static String get CreatedAt => getValue(LocalStr.CreatedAt.toStr());
  static String get UsePinCode => getValue(LocalStr.UsePinCode.toStr());
  static String get AppBuildDate => getValue(LocalStr.AppBuildDate.toStr());
  static String get APIBuildDate => getValue(LocalStr.APIBuildDate.toStr());
  static String get SomethingWentWrong => getValue(LocalStr.SomethingWentWrong.toStr());

  static String get CheckForNullValues => getValue(LocalStr.CheckForNullValues.toStr());
  static String get NameHintInput => getValue(LocalStr.NameHintInput.toStr());
  static String get NameErrorInput => getValue(LocalStr.NameErrorInput.toStr());

  static String getValue(String key) {
    try {
      return _localizedValues[currentLocale.languageCode]![key]!;
    } catch (e) {
      MyTool.logPrint('getValue error localizedValues key \'$key\' is not found in Dart Languages : english.dart, ..');
      print(e);
      throw e;
    }
    return key;
  }
}