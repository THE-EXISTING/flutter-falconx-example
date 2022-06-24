extension ResponseFromJson on Map<String, dynamic>? {
  T mapJson<T>(T Function(Map<String, dynamic>? json) mapper) {
    return mapper(this);
  }
}
