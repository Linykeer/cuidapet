part of '../address_page.dart';

typedef AddressSelectedCallback = void Function(PlaceModel);

class _AddressSearchWidget extends StatefulWidget {
  final AddressSelectedCallback addressSelectedCallback;

  const _AddressSearchWidget({Key? key, required this.addressSelectedCallback})
      : super(key: key);

  @override
  State<_AddressSearchWidget> createState() => _AddressSearchWidgetState();
}

class _AddressSearchWidgetState
    extends PageLifeCycleState<AddressController, _AddressSearchWidget> {
  final searchTextEC = TextEditingController();
  final searchTextFN = FocusNode();

  @override
  void dispose() {
    searchTextEC.dispose();
    searchTextFN.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(style: BorderStyle.none));
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      child: TypeAheadFormField<PlaceModel>(
        textFieldConfiguration: TextFieldConfiguration(
          controller: searchTextEC,
          focusNode: searchTextFN,
          decoration: InputDecoration(
            hintText: 'Insira um endereço',
            prefixIcon: const Icon(Icons.location_on),
            border: border,
            disabledBorder: border,
            enabledBorder: border,
            focusedBorder: border,
          ),
        ),
        itemBuilder: (_, item) {
          return _itemTile(item.address);
        },
        onSuggestionSelected: _onSuggestionSelected,
        suggestionsCallback: _suggestionCallback,
      ),
    );
  }

  Future<List<PlaceModel>> _suggestionCallback(String pattern) async {
    if (pattern.isNotEmpty) {
      return controller.searchAddress(pattern);
    }

    return <PlaceModel>[];
  }

  void _onSuggestionSelected(PlaceModel suggestion) {
    searchTextEC.text = suggestion.address;
    widget.addressSelectedCallback(suggestion);
  }
}

Widget _itemTile(String address) {
  return ListTile(
    leading: const Icon(Icons.location_on),
    title: Text(address),
  );
}
