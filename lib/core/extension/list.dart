extension ListExtension<T> on List<T> {
  void getLast(int count) {
    if (length > 3) {
      return removeRange(0, length - count);
    }
  }
}

extension Unique<E, Id> on List<E> {
  List<E> unique([Id Function(E element)? id, bool inPlace = true]) {
    final ids = <dynamic>{};
    final list = inPlace ? this : List<E>.from(this)
      ..retainWhere((x) => ids.add(id != null ? id(x) : x as Id));
    return list;
  }
}
