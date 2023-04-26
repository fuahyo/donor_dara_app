import '../../../base/result_entity.dart';

abstract class ForgotPassRepository {
  Future<ResultEntity> submitForgotPass(String email);
}
