/*
 * @Author: your name
 * @Date: 2021-08-30 17:46:36
 * @LastEditTime: 2021-09-05 14:05:29
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \demo1\lib\common\localization\gsy_localizations_delegate.dart
 */

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:demo1/common/localization/default_localizations.dart';

/*
 * 多语言代理
 * Created by guoshuyu
 * Date: 2018-08-15
 */
class GSYLocalizationsDelegate extends LocalizationsDelegate<GSYLocalizations> {
  GSYLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // 支持中文和英文
    return true;
  }

  @override
  Future<GSYLocalizations> load(Locale locale) {
    // SynchronousFuture 创建一个同步的未来？
    return new SynchronousFuture<GSYLocalizations>(
        new GSYLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<GSYLocalizations> old) {
    return false;
  }

  static GSYLocalizationsDelegate delegate = new GSYLocalizationsDelegate();
}
