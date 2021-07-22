import 'package:flutter/material.dart';
import 'package:demo1/env/env_config.dart';
import 'package:demo1/common/config/config.dart';

// StatelessWidget super(key: key)
class ConfigWrapper extends StatelessWidget {
  const ConfigWrapper({Key? key, this.config, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 设置 Config.DEBUG 的静态变量
    Config.DEBUG = this.config?.debug;
    return new _InheritedConfig(config: this.config, child: this.child!);
  }

  static EnvConfig? of(BuildContext context) {
    final _InheritedConfig inheritedConfig =
        context.dependOnInheritedWidgetOfExactType<_InheritedConfig>()!;
    return inheritedConfig.config;
  }

  final EnvConfig? config;
  final Widget? child;
}

// InheritedWidget 数据共享 super(key: key, child: child)
// required 子组件接收required表示必填
class _InheritedConfig extends InheritedWidget {
  _InheritedConfig({Key? key, required this.config, required Widget child})
      : super(key: key, child: child);

  final EnvConfig? config;

  // static _InheritedConfig? of(BuildContext context) {
  //   return context.dependOnInheritedWidgetOfExactType<_InheritedConfig>();
  // }

  @override
  bool updateShouldNotify(_InheritedConfig oldWidget) {
    // return true;
    return config != oldWidget.config;
  }
}

// 初始化子类
