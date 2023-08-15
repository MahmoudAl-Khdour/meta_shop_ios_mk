class LazyLoadingFilter {
  int? from;
  int? numberItem;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LazyLoadingFilter &&
        o.from == from &&
        o.numberItem == numberItem;
  }

  @override
  int get hashCode => from.hashCode ^ numberItem.hashCode;

  @override
  String toString() => 'LazyLoadingFilter(from:$from,numberItem:$numberItem)';
}
