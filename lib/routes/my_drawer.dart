import 'package:flutter/material.dart';
import 'package:github_client_app/l10n/localization_intl.dart';
import 'package:github_client_app/notifier/user_model.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  Widget gmAvatar(
    String url, {
    double width = 30,
    double? height,
    BoxFit? fit,
    BorderRadius? borderRadius,
  }) {
    var placeholder = Image.asset("imgs/avatar-default.png", //头像占位图
        width: width,
        height: height);
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(2),
      // child: CachedNetworkImage(
      //   imageUrl: url,
      //   width: width,
      //   height: height,
      //   fit: fit,
      //   placeholder: (context, url) =>placeholder,
      //   errorWidget: (context, url, error) =>placeholder,
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // 移除顶部 padding.
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(), //构建抽屉菜单头部
            Expanded(child: _buildMenus()), //构建功能菜单
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Consumer<UserModel>(
      builder: (BuildContext context, UserModel value, Widget? child) {
        return GestureDetector(
          child: Container(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipOval(
                    // 如果已登录，则显示用户头像；若未登录，则显示默认头像
                    child: value.isLogin
                        ? gmAvatar(value.user?.avatar_url ?? '', width: 80)
                        : Image.asset(
                            "assets/imgs/avatar-default.jpeg",
                            width: 80,
                          ),
                  ),
                ),
                Text(
                  value!.isLogin
                      ? (value.user!.login ?? '123')
                      : GmLocalizations.of(context)!.login,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            if (!value.isLogin) Navigator.of(context).pushNamed("login");
          },
        );
      },
    );
  }

  // 构建菜单项
  Widget _buildMenus() {
    return Consumer<UserModel>(
      builder: (BuildContext context, UserModel userModel, Widget? child) {
        var gm = GmLocalizations.of(context);
        return ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: Text(gm!.theme),
              onTap: () => Navigator.pushNamed(context, "themes"),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(gm.language),
              onTap: () => Navigator.pushNamed(context, "language"),
            ),
            if (userModel.isLogin)
              ListTile(
                leading: const Icon(Icons.power_settings_new),
                title: Text(gm!.logout),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      //退出账号前先弹二次确认窗
                      return AlertDialog(
                        content: Text(gm!.logoutTip),
                        actions: <Widget>[
                          TextButton(
                            child: Text(gm!.cancel),
                            onPressed: () => Navigator.pop(context),
                          ),
                          TextButton(
                            child: Text(gm!.yes),
                            onPressed: () {
                              //该赋值语句会触发MaterialApp rebuild
                              // userModel.setUser(null);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
          ],
        );
      },
    );
  }
}
