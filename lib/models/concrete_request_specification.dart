// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'concrete_design_strength.dart';
import 'concrete_specific_quality.dart';

class ConcreteRequestSpecification {
  String id;
  ConcreteDesignStrength designStrength;
  double slumpingInCm;
  String maximumAggregateSize;
  List<ConcreteSpecificQuality> otherSpecifications;
  double quantityInM3;
  String use;
  DateTime scheduledTime;
  String location;
  String updates;
  String observations;

  ConcreteRequestSpecification({
    required this.id,
    required this.designStrength,
    required this.slumpingInCm,
    required this.maximumAggregateSize,
    required this.otherSpecifications,
    required this.quantityInM3,
    required this.use,
    required this.scheduledTime,
    required this.location,
    required this.updates,
    required this.observations,
  });

  @override
  String toString() {
    return 'ConcreteRequestSpecification: { id: $id, designStrength: $designStrength, slumpingInCm: $slumpingInCm, maximumAggregateSize: $maximumAggregateSize, otherSpecifications: $otherSpecifications, quantityInM3: $quantityInM3, use: $use, scheduledTime: $scheduledTime, location: $location, updates: $updates, observations: $observations }';
  }
}