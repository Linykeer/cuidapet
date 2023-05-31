// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cuidapet/app/models/place_model.dart';
import 'package:mobx/mobx.dart';

import 'package:cuidapet/app/core/life_cycle/controller_life_cycle.dart';
import 'package:cuidapet/app/services/address/address_service.dart';

part 'address_controller.g.dart';

class AddressController = AddressControllerBase with _$AddressController;

abstract class AddressControllerBase with Store, ControllerLifeCycle {
  final AddressService _addressService;
  AddressControllerBase({
    required AddressService addressService,
  }) : _addressService = addressService;

  Future<List<PlaceModel>> searchAddress(String addressPattern) =>
      _addressService.findAddressByGooglePlaces(addressPattern);
}
