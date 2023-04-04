import 'package:bloc_cubit_example/core/model/IBase.dart';

class EmptyResponse extends IBaseModel<EmptyResponse> {
  EmptyResponse();

  @override
  Map<String, Object> toJson() {
    return <String, Object>{};
  }

  @override
  EmptyResponse fromJson(Map<String, dynamic>? json) {
    return EmptyResponse();
  }
}
