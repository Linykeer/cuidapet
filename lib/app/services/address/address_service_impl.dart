// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cuidapet/app/models/place_model.dart';
import 'package:cuidapet/app/repositorys/address/address_repository.dart';

import './address_service.dart';

class AddressServiceImpl implements AddressService {
  final AddressRepository _addressRepository;
  AddressServiceImpl({
    required AddressRepository addressRepository,
  }) : _addressRepository = addressRepository;

  @override
  Future<List<PlaceModel>> findAddressByGooglePlaces(String addressPattern) =>
      _addressRepository.findAddressByGooglePlaces(addressPattern);
}
