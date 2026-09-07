import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SheltersPage extends StatelessWidget {
const SheltersPage({super.key});

static const shelters = [
{
'name': 'AnimaAid Care Shelter',
'location': 'Chennai',
'distance': '2.4 km away',
},
{
'name': 'Hope Animal Rescue Center',
'location': 'Chennai',
'distance': '4.1 km away',
},
{
'name': 'Paws & Care Foundation',
'location': 'Chennai',
'distance': '6.8 km away',
},
];

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Nearby Shelters'),
),
body: ListView.builder(
padding: const EdgeInsets.all(16),
itemCount: shelters.length,
itemBuilder: (context, index) {
final shelter = shelters[index];

      return Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: const CircleAvatar(
            child: Icon(Icons.home_work_outlined),
          ),
          title: Text(
            shelter['name']!,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              '${shelter['location']} • ${shelter['distance']}',
            ),
          ),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            context.go(
              '/shelter-location'
              '?name=${Uri.encodeComponent(shelter['name']!)}'
              '&location=${Uri.encodeComponent(shelter['location']!)}'
              '&distance=${Uri.encodeComponent(shelter['distance']!)}',
            );
          },
        ),
      );
    },
  ),
);

}
}
