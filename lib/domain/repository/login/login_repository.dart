import 'package:donor_darah/domain/model/data/login/login_data.dart';
import 'package:donor_darah/domain/model/request/login/login_request.dart';

import '../../../base/result_entity.dart';

abstract class LoginRepository {
  Future<ResultEntity<LoginData>> submitLogin(LoginRequest request);
}
