import 'dart:async';
import 'package:cuidapet/app/core/UI/extensions/theme_extensions.dart';
import 'package:cuidapet/app/core/life_cycle/page_life_cycle_state.dart';
import 'package:cuidapet/app/models/place_model.dart';
import 'package:cuidapet/app/modules/address/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
part 'widgets/address_item.dart';
part 'widgets/address_search_widget.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState
    extends PageLifeCycleState<AddressController, AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: context.primaryColorDark),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(children: [
            Text(
              'Adicione ou escolha um endereço',
              style: context.textTheme.headlineMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            _AddressSearchWidget(
              addressSelectedCallback: (PlaceModel place) {
                Modular.to.pushNamed('/address/detail', arguments: place);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            const ListTile(
              title: Text(
                'Localização Atual',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 24,
                child: Icon(
                  Icons.near_me,
                  color: Colors.white,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(
              height: 20,
            ),
            const Column(
              children: [
                _AddressItem(),
                _AddressItem(),
                _AddressItem(),
                _AddressItem(),
                _AddressItem(),
                _AddressItem(),
                _AddressItem(),
                _AddressItem(),
                _AddressItem(),
                _AddressItem(),
                _AddressItem(),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
