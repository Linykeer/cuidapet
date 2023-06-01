import 'package:cuidapet/app/core/UI/extensions/theme_extensions.dart';
import 'package:cuidapet/app/models/place_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressDetailPage extends StatefulWidget {
  final PlaceModel place;
  const AddressDetailPage({Key? key, required this.place}) : super(key: key);

  @override
  State<AddressDetailPage> createState() => _AddressDetailPageState();
}

class _AddressDetailPageState extends State<AddressDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: context.primaryColor),
        ),
        body: Column(
          children: [
            Text(
              'Confirme seu endereço',
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    widget.place.lat,
                    widget.place.lng,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
