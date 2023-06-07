part of '../address_page.dart';

class _AddressItem extends StatelessWidget {
  const _AddressItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 24,
          child: Icon(
            Icons.location_on,
            color: Colors.black,
          ),
        ),
        title: Text('Av Paulista, 200'),
        subtitle: Text('Complemento'),
      ),
    );
  }
}
