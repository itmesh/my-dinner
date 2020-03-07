import 'package:flutter/material.dart';
import 'package:my_dinner/features/profile/domain/models/profile.dart';

class ContactDataCard extends StatelessWidget {
  final Profile contactData;
  final GestureTapCallback onEdit;

  const ContactDataCard({Key key, this.contactData, this.onEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('${contactData.name} ${contactData.surname}'),
        trailing: Container(
          height: 26.0,
          width: 26.0,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
            clipBehavior: Clip.hardEdge,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onEdit,
                child: Icon(
                  Icons.edit,
                  size: 20.0,
                ),
              ),
            ),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${contactData.email}'),
              SizedBox(height: 2.0),
              Text('${contactData.phoneNumber}'),
            ],
          ),
        ),
      ),
    );
  }
}
