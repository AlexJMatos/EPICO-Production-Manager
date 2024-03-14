// ignore_for_file: constant_identifier_names, non_constant_identifier_names

enum ConcreteDesignStrength {
  FC_100(strengthInKgCm2: 100.00),
  FC_150(strengthInKgCm2: 150.00),
  FC_200(strengthInKgCm2: 200.00),
  FC_250(strengthInKgCm2: 250.00),
  FC_300(strengthInKgCm2: 300.00),
  FC_350(strengthInKgCm2: 350.00),
  FC_400(strengthInKgCm2: 400.00),
  FC_450(strengthInKgCm2: 450.00),
  FC_500(strengthInKgCm2: 500.00);

  final double strengthInKgCm2;

  const ConcreteDesignStrength({required this.strengthInKgCm2});
}
