abstract class Token {
  final String name;
  Token(this.name);

  Map<String, dynamic> toJson();
}

class NumberToken extends Token {
  final int value;
  NumberToken(this.value) : super(value.toString());

  static NumberToken fromJson(Map<String, dynamic> json) {
    return NumberToken(json['value']);
  }

  @override
  Map<String, dynamic> toJson() => {'type': 'number', 'name': this.name};
}

class SignToken extends Token {
  SignToken(SignType type) : super(type.name);

  static SignToken fromJson(Map<String, dynamic> json) {
    return SignToken(SignType.values.byName(json['value']));
  }

  @override
  Map<String, dynamic> toJson() => {'type': 'sign', 'name': this.name};
}

enum SignType {
  skull,
  cultist,
  tablet,
  elderThing,
  autoFail,
  elderSign,
}
