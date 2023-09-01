abstract class Token {
  final String name;
  Token(this.name);
  bool get nonNegative;

  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    if (other is! Token) {
      return false;
    }
    return this.name == other.name;
  }

  @override
  int get hashCode => name.hashCode;
}

class NumberToken extends Token {
  final int value;
  NumberToken(this.value) : super(value.toString());

  static NumberToken fromJson(Map<String, dynamic> json) {
    return NumberToken(int.parse(json['name']));
  }

  @override
  bool get nonNegative => this.value >= 0;

  @override
  Map<String, dynamic> toJson() => {'type': 'number', 'name': this.name};
}

class SignToken extends Token {
  final SignType type;
  final bool special;

  SignToken(this.type)
      : special = specials.contains(type),
        super(type.name);

  static SignToken fromJson(Map<String, dynamic> json) {
    return SignToken(SignType.values.byName(json['name']));
  }

  @override
  bool get nonNegative => this.type == SignType.elderSign;

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

List<SignType> specials = [SignType.autoFail, SignType.elderSign];
