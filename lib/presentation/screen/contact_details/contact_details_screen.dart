import 'package:contacts_flutter/domain/entity/contact.dart';
import 'package:contacts_flutter/presentation/extension/date_time_format.dart';
import 'package:contacts_flutter/presentation/screen/contact_details/contact_details_arguments.dart';
import 'package:contacts_flutter/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ContactDetailsArguments args =
        ModalRoute.of(context).settings.arguments;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              args.contact.name,
              style: textTheme.headline5,
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                _navigatePhoneUrl(args.contact.phone);
              },
              child: Text(
                args.contact.phone,
                style: textTheme.subtitle1.copyWith(color: colorTextLink),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _getTemperamentTitle(args.contact.temperament),
              style: textTheme.subtitle1,
            ),
            const SizedBox(height: 8),
            Text(
              _formatPeriod(args.contact.educationPeriod),
              style: textTheme.subtitle1
            ),
            const SizedBox(height: 8),
            Text(args.contact.biography, style: textTheme.bodyText2)
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
