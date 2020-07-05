import 'package:flutter/material.dart';
import 'package:todoApp/models/users.dart';

class DetailsUser extends StatelessWidget {
  final UserModel model;
  final String picture;
  const DetailsUser({@required this.model, @required this.picture});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.username,
          style: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: model.id,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 4.5,
                    color: Colors.purple,
                  ),
                ),
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 120,
                  backgroundImage: NetworkImage(picture),
                ),
              ),
            ),
            SizedBox(height: 12),
            buildDetailsRow(
              Icons.person_pin,
              'UserName    ',
              model.name,
              style: textTheme.headline4.copyWith(fontSize: 16),
            ),
            SizedBox(height: 12),
            buildDetailsRow(
              Icons.email,
              'Email    ',
              model.email,
              style: textTheme.headline4.copyWith(fontSize: 16),
            ),
            SizedBox(height: 12),
            buildDetailsRow(
              Icons.phone_android,
              'Phone    ',
              model.phone,
              style: textTheme.headline4.copyWith(fontSize: 16),
            ),
            SizedBox(height: 12),
            buildDetailsRow(
              Icons.alternate_email,
              'WebSite    ',
              model.website,
              style: textTheme.headline4.copyWith(fontSize: 16),
            ),
            SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Address',
                      style: textTheme.subtitle1
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    buildDetailsRow(
                      Icons.subdirectory_arrow_right,
                      'Suite    ',
                      model.address.suite,
                      style: textTheme.headline4.copyWith(fontSize: 16),
                    ),
                    buildDetailsRow(
                      Icons.streetview,
                      'Street    ',
                      model.address.street,
                      style: textTheme.headline4.copyWith(fontSize: 16),
                    ),
                    buildDetailsRow(
                      Icons.location_city,
                      'City    ',
                      model.address.city,
                      style: textTheme.headline4.copyWith(fontSize: 16),
                    ),
                    buildDetailsRow(
                      Icons.compare_arrows,
                      'ZipCode    ',
                      model.address.zipcode,
                      style: textTheme.headline4.copyWith(fontSize: 16),
                    ),
                    buildDetailsRow(
                      Icons.my_location,
                      'Geo    ',
                      model.address.geo.toString(),
                      style: textTheme.headline4.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Company',
                      style: textTheme.subtitle1
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    buildDetailsRow(
                      null,
                      'Name    ',
                      model.company.name,
                      style: textTheme.headline4.copyWith(fontSize: 16),
                    ),
                    buildDetailsRow(
                      null,
                      'Phrase    ',
                      model.company.catchPhrase,
                      style: textTheme.headline4.copyWith(fontSize: 16),
                    ),
                    buildDetailsRow(
                      null,
                      'BS    ',
                      model.company.bs,
                      style: textTheme.headline4.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget buildDetailsRow(IconData icon, String title, String subtitle,
      {TextStyle style}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          if (icon != null)
            Icon(
              icon,
              size: 26,
              color: Colors.purple,
            ),
          SizedBox(width: 12),
          Flexible(
            child: RichText(
              text: TextSpan(
                text: title,
                children: [
                  TextSpan(
                    text: subtitle,
                    style: style,
                  ),
                ],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
