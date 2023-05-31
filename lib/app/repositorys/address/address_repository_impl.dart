import 'package:cuidapet/app/core/exceptions/failure.dart';
import 'package:cuidapet/app/core/helpers/environments.dart';
import 'package:cuidapet/app/models/place_model.dart';
import 'package:google_places/google_places.dart';

import './address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  @override
  Future<List<PlaceModel>> findAddressByGooglePlaces(
      String addressPattern) async {
    final googleApiKey = Environments.param('google_api_key');
    if (googleApiKey == null) {
      throw Failure(message: 'Google Api Key not found');
    }
    final googlePlace = GooglePlaces(googleApiKey);
    final addressResult =
        await googlePlace.search.getTextSearch(addressPattern);
    final candidates = addressResult?.results;
    if (candidates != null) {
      return candidates.map<PlaceModel>((e) {
        final location = e.geometry?.location;
        final address = e.formattedAddress;
        return PlaceModel(
            address: address ?? '',
            lat: location?.lat ?? 0,
            lng: location?.lng ?? 0);
      }).toList();
    }
    return <PlaceModel>[];
  }
}
