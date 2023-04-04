abstract class IBaseModel<T> {
  Map<String, dynamic>? toJson();
  T fromJson(Map<String, dynamic> json);
}

abstract class IAnnotation {
  const IAnnotation(this.description);
  final String? description;
}
