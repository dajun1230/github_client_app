import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart'; //1

class GmLocalizations {
  static Future<GmLocalizations> load(Locale locale) {
    final String name = (locale.countryCode?.isEmpty ?? true) ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    //2
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return GmLocalizations();
    });
  }

  static GmLocalizations? of(BuildContext context) {
    return Localizations.of<GmLocalizations>(context, GmLocalizations);
  }

  String get title {
    return Intl.message(
      'Flutter APP',
      name: 'title',
      desc: 'Title for the Demo application',
    );
  }

  String get theme {
    return Intl.message(
      '主题色',
      name: 'theme',
      desc: 'theme',
    );
  }

  String get home {
    return Intl.message(
      '首页',
      name: 'Home',
      desc: 'home page',
    );
  }

  String get login {
    return Intl.message(
      '登录',
      name: 'login',
      desc: 'login in',
    );
  }

  String get language {
    return Intl.message(
      '语言',
      name: 'language',
      desc: 'language',
    );
  }

  String get auto {
    return Intl.message(
      '自定义',
      name: 'auto',
      desc: 'auto',
    );
  }

  // 登录页
  String get userName {
    return Intl.message(
      '用户名',
      name: 'userName',
      desc: 'userName',
    );
  }

  String get userNameRequired {
    return Intl.message(
      '请输入用户名',
      name: 'userNameRequired',
      desc: 'userNameRequired',
    );
  }

  String get password {
    return Intl.message(
      '密码',
      name: 'password',
      desc: 'password',
    );
  }

  String get passwordRequired {
    return Intl.message(
      '请输入密码',
      name: 'passwordRequired',
      desc: 'passwordRequired',
    );
  }

  // 抽屉
String get logout {
    return Intl.message(
      '退出',
      name: 'logout',
      desc: 'logout',
    );
  }

  String get logoutTip {
    return Intl.message(
      'logoutTip',
      name: 'logoutTip',
      desc: 'logoutTip',
    );
  }

  String get cancel {
    return Intl.message(
      '取消',
      name: 'cancel',
      desc: 'cancel',
    );
  }

  String get yes {
    return Intl.message(
      '确认',
      name: 'yes',
      desc: 'yes',
    );
  }

  String get noDescription {
    return Intl.message(
      '没有描述',
      name: 'noDescription',
      desc: 'noDescription',
    );
  }
}

//Locale代理类
class GmLocalizationsDelegate extends LocalizationsDelegate<GmLocalizations> {
  const GmLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<GmLocalizations> load(Locale locale) {
    //3
    return  GmLocalizations.load(locale);
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(GmLocalizationsDelegate old) => false;
}