import '../http.dart';

Future getPoetryFull({data}) async {
  // var formData = {'lon': '123, 123', 'lat': '2231, 331'};
  print('data$data');
  // poetryFull, getTime
  var response = await HttpUtil().get(
    'sentences',
    params: data,
  );
  return response['result'];
}
