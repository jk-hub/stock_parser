// ignore_for_file: public_member_api_docs, sort_constructors_first
class GetDashboardDataModel {
  final int? id;
  final String? name;
  final String? tag;
  final String? color;
  List<Criterion>? criteria;

  GetDashboardDataModel({
    this.id,
    this.name,
    this.tag,
    this.color,
    this.criteria,
  });

  factory GetDashboardDataModel.fromJson(Map<String, dynamic> json) =>
      GetDashboardDataModel(
        id: json["id"] as int?,
        name: json["name"] as String?,
        tag: json["tag"] as String?,
        color: json["color"] as String?,
        criteria: List<Criterion>.from(
          (json["criteria"] as List).map(
            (x) => Criterion.fromJson(x as Map<String, dynamic>),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tag": tag,
        "color": color,
        "criteria": List<dynamic>.from(criteria!.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'StockParserDataModel(id: $id, name: $name, tag: $tag, color: $color, criteria: $criteria)';
  }
}

class Criterion {
  final String? type;
  String? text;
  Variable? variable;

  Criterion({
    this.type,
    this.text,
    this.variable,
  });

  factory Criterion.fromJson(Map<String, dynamic> json) => Criterion(
        type: json["type"] as String?,
        text: json["text"] as String?,
        variable: json["variable"] == null
            ? null
            : Variable.fromJson(json["variable"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "text": text,
        "variable": variable?.toJson(),
      };

  @override
  String toString() =>
      'Criterion(type: $type, text: $text, variable: $variable)';
}

class Variable {
  VariableData1? the1;
  VariableData2? the2;
  VariableData2? the3;
  VariableData1? the4;

  Variable({
    this.the1,
    this.the2,
    this.the3,
    this.the4,
  });

  factory Variable.fromJson(Map<String, dynamic> json) => Variable(
        the1: json["\u00241"] == null
            ? null
            : VariableData1.fromJson(json["\u00241"] as Map<String, dynamic>),
        the2: json["\u00242"] == null
            ? null
            : VariableData2.fromJson(json["\u00242"] as Map<String, dynamic>),
        the3: json["\u00243"] == null
            ? null
            : VariableData2.fromJson(json["\u00243"] as Map<String, dynamic>),
        the4: json["\u00244"] == null
            ? null
            : VariableData1.fromJson(json["\u00244"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "\u00241": the1?.toJson(),
        "\u00242": the2?.toJson(),
        "\u00243": the3?.toJson(),
        "\u00244": the4?.toJson(),
      };
}

class VariableData1 {
  final String? type;
  final List<int>? values;
  final String? studyType;
  final String? parameterName;
  final int? minValue;
  final int? maxValue;
  final int? defaultValue;

  VariableData1({
    this.type,
    this.values,
    this.studyType,
    this.parameterName,
    this.minValue,
    this.maxValue,
    this.defaultValue,
  });

  factory VariableData1.fromJson(Map<String, dynamic> json) => VariableData1(
        type: json["type"] as String?,
        values: json["values"] == null
            ? []
            : List.from(
                (json["values"] as List).map(
                  (x) => x,
                ),
              ),
        studyType: json["study_type"] as String?,
        parameterName: json["parameter_name"] as String?,
        minValue: json["min_value"] as int?,
        maxValue: json["max_value"] as int?,
        defaultValue: json["default_value"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "values":
            values == null ? [] : List<dynamic>.from(values!.map((x) => x)),
        "study_type": studyType,
        "parameter_name": parameterName,
        "min_value": minValue,
        "max_value": maxValue,
        "default_value": defaultValue,
      };

  @override
  String toString() {
    return 'VariableData1(type: $type, values: $values, studyType: $studyType, parameterName: $parameterName, minValue: $minValue, maxValue: $maxValue, defaultValue: $defaultValue)';
  }
}

class VariableData2 {
  final String? type;
  final List<num>? values;

  VariableData2({
    required this.type,
    required this.values,
  });

  factory VariableData2.fromJson(Map<String, dynamic> json) => VariableData2(
        type: json["type"] as String?,
        values: List<num>.from(
          (json["values"] as List).map(
            (x) => x as num,
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "values": List<dynamic>.from(values!.map((x) => x)),
      };

  @override
  String toString() => 'VariableData2(type: $type, values: $values)';
}
