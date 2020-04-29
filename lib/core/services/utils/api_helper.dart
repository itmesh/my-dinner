List<T> jsonToDtoList<T>(dynamic list, T f(_)) {
  return (list as List<dynamic>).map(f).toList();
}