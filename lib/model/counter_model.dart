import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  int _count = 0;
  // Counter(this._count);

  void increment() {
    _count++;
    notifyListeners();
  }

  get value => _count;
}

class GoodsListProvider with ChangeNotifier {
  List<Goods> _goodsList =
      List.generate(10, (index) => Goods(false, 'No.$index'));

  get goodsList => _goodsList;
  get total => _goodsList.length;
  collect(int index) {
    var good = _goodsList[index];
    _goodsList[index] = Goods(!good.isCollection, good.goodsName);
    notifyListeners();
  }
}

class Goods {
  final bool isCollection;
  final String goodsName;

  Goods(this.isCollection, this.goodsName);
}
