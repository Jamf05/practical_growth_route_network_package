import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:practical_growth_route_network_package/data/models/rating_model.dart';

import '../../helpers/dummy_data.dart';
import '../../helpers/json_reader.dart';

void main() {
  group('Method from json', () {
    test('should return a successful response', () async {
      // arrange
      const RatingModel tRatingModel = RatingModel(
        rate: 3.9,
        count: 120,
      );
      final Map<String, dynamic> jsonMap = json.decode(
        JsonHelpers.readJson(DummyData.ratingJson),
      );

      // act
      final RatingModel result = RatingModel.fromJson(jsonMap);

      // assert
      expect(result, equals(tRatingModel));
    });
  });

  group('Method to Json', () {
    test('should return a successful response', () async {
      // arrange
      const RatingModel tRatingModel = RatingModel(
        rate: 3.9,
        count: 120,
      );
      final Map<String, dynamic> jsonMap = json.decode(
        JsonHelpers.readJson(DummyData.ratingJson),
      );
      // act
      final result = tRatingModel.toJson();
      // assert
      expect(result, equals(jsonMap));
    });
  });
}
