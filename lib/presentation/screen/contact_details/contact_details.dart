import 'package:contacts_flutter/domain/entity/contact.dart';
import 'package:contacts_flutter/presentation/extension/date_time_format.dart';
import 'package:contacts_flutter/presentation/screen/contact_details/contact_details_arguments.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ContactDetailsArguments args =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              args.contact.name,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                _navigatePhoneUrl(args.contact.phone);
              },
              child: Text(
                args.contact.phone,
                style: TextStyle(fontSize: 14, color: Colors.lightBlue),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _getTemperamentTitle(args.contact.temperament),
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            Text(
              _formatPeriod(args.contact.educationPeriod),
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            Text(args.contact.biography, style: const TextStyle(fontSize: 14))
          ],
        ),
      ),
    );
  }

  Future<void> _navigatePhoneUrl(String phone) async {
    final url = 'tel:$phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String _getTemperamentTitle(Temperament temperament) {
    switch (temperament) {
      case Temperament.sanguine:
        return 'Sanguine';
      case Temperament.choleric:
        return 'Choleric';
      case Temperament.phlegmatic:
        return 'Phlegmatic';
      case Temperament.melancholic:
        return 'Melancholic';
      default:
        return '';
    }
  }

  String _formatPeriod(EducationPeriod period) {
    final start = period.start.format(ddMMYyyy);
    final end = period.end.format(ddMMYyyy);
    return '$start - $end';
  }
}
