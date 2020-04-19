// 配置log和api base
import 'package:flutter_study/http/http_manager.dart';
import 'package:flutter_study/utils/log_util.dart';

void config() {
  LogUtil.init(isDebug: true, tag: "### flutter_study ###: ");
  LogUtil.log("main");
  HttpManager().init(baseUrl: "http://127.0.0.1:8080");
}
