import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:github_client_app/l10n/localization_intl.dart';
import 'package:github_client_app/notifier/locale_model.dart';

class LanguageRoute extends StatelessWidget {
  const LanguageRoute({ super.key});
  
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    var localeModel = Provider.of<LocaleModel>(context);
    var gm = GmLocalizations.of(context);

    Widget buildLanguageItem(String lan, value) {
      return ListTile(
        title: Text(
          lan,
          // 对APP当前语言进行高亮显示
          style: TextStyle(color: localeModel.locale == value ? color : null),
        ),
        trailing:
            localeModel.locale == value ? Icon(Icons.done, color: color) : null,
        onTap: () {
          // 此行代码会通知MaterialApp重新build
          localeModel.locale = value;
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(gm!.language),
      ),
      body: ListView(
        children: <Widget>[
          buildLanguageItem("中文简体", "zh_CN"),
          buildLanguageItem("English", "en_US"),
          buildLanguageItem(gm!.auto, null),
        ],
      ),
    );
  }
}