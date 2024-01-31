import 'package:cs_4361/src/blleee/Weather.dart';
import 'package:cs_4361/src/blleee/coms.dart';
import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatefulWidget {
  const SampleItemDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  State<SampleItemDetailsView> createState() => _SampleItemDetailsViewState();
}

class _SampleItemDetailsViewState extends State<SampleItemDetailsView> {
  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context)!.settings.arguments as String;
    late String url;

    switch (args) {
      case 'NYC':
        url =
            'https://api.open-meteo.com/v1/forecast?latitude=40.7143&longitude=-74.006&current=temperature_2m&temperature_unit=fahrenheit&timezone=auto';
        break;
      case 'Atlanta':
        url =
            'https://api.open-meteo.com/v1/forecast?latitude=40.7143&longitude=-74.006&current=humidity&timezone=auto';
        break;
      case 'Austin':
        url =
            'https://api.open-meteo.com/v1/forecast?latitude=40.7143&longitude=-74.006&current=wind_speed_10m&timezone=auto';
        break;
      default:
        url =
            'https://api.open-meteo.com/v1/forecast?latitude=40.7143&longitude=-74.006&current=temperature_2m&temperature_unit=fahrenheit&timezone=auto';
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(args),
      ),
      body: Center(
        child: FutureBuilder<Weather>(
          future: Coms.getWeather(
              "https://api.open-meteo.com/v1/forecast?latitude=40.7143&longitude=-74.006&current=temperature_2m&temperature_unit=fahrenheit&timezone=auto"),
          builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              Text('${snapshot.data!.getTemperature} Information Here');
            }
            return Text(
                'Current Temperature (2 meters above Ground): ${snapshot.data!.getTemperature}.  Time temperature was taken (local time): ${snapshot.data!.getTime}');
          },
        ),
      ),
    );
  }
}
