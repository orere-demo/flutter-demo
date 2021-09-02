import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:demo1/common/localization/gsy_string_base.dart';
import 'package:demo1/common/localization/gsy_string_en.dart';
import 'package:demo1/common/localization/gsy_string_zh.dart';

// 自定义多语言实现
class GSYLocalizations{
  final Locale locale;

  GSYLocalizations(this.locale);

  // 根据不同locale.languageCode 加载不同的语言
  // GSYStringEn 和 GSYStringZh 都继承了GSYStringBase
  static Map<String, GSYStringBase> _localizedValues = {
    'en': new GSYStringEn(),
    'zh': new GSYStringZh(),
  };

  GSYStringBase? get currentLocalized{
    if(_localizedValues.containsKey(locale.languageCode)){
      return _localizedValues[locale.languageCode];
    }
    return _localizedValues['en'];
  }

  // 为了使用方便，我们定义一个静态方法
  // 通过 Localizations 加载当前的 GSYLocalizations，GSYLocalizations中会根据当前的语言来返回不同的文本
  // 实例将会在Delegate类的load方法中创建
  static GSYLocalizations? of(BuildContext context){
    return Localizations.of<GSYLocalizations>(context, GSYLocalizations);
  }

  // 获取对应的 GSYStringBase
  static GSYStringBase? i18n(BuildContext context){
    return (Localizations.of(context, GSYLocalizations) as GSYLocalizations).currentLocalized;
  }
}