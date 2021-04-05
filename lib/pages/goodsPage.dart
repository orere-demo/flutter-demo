// GoodsPage
import '../index.dart';
import 'package:demo1/model/counter_model.dart';

class GoodsPage extends StatelessWidget {
  const GoodsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoodsListScreen(),
    );
  }
}

class GoodsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => GoodsListProvider(),
        child: Scaffold(
          body: Selector<GoodsListProvider, GoodsListProvider>(
            shouldRebuild: (previous, next) => previous == next,
            selector: (context, provider) => provider,
            builder: (context, provider, child) {
              // provider.;
            },
          ),
        ));
  }
}
