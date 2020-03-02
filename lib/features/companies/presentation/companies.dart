import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getflutter/components/button/gf_icon_button.dart';
import 'package:getflutter/components/card/gf_card.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:getflutter/getflutter.dart';
import 'package:my_dinner/widgets/navigation_drawer.dart';

class Companies extends StatefulWidget {
  static ModalRoute<dynamic> get route {
    return MaterialPageRoute(
      builder: (_) => Companies(),
    );
  }

  @override
  _CompaniesState createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: ListView(
          children: List.generate(10, (_) => buildGfCard()),
        ),
      ),
      drawer: NavigationDrawer(),
    );
  }

  GFCard buildGfCard() {
    return GFCard(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      title: GFListTile(
        avatar: GFAvatar(
          size: GFSize.large,
          backgroundImage: NetworkImage(
              'https://s3.eu-central-1.amazonaws.com/catering-logo-images/catering-divinefood.png'),
        ),
        icon: GFIconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'FreshFit',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 4.0,
            ),
            Row(
              children: <Widget>[
                RatingBar(
                  initialRating: 2.5,
                  itemSize: 20.0,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (_) {},
                ),
                SizedBox(width: 8.0),
                Text('4.7'),
                SizedBox(width: 4.0),
                Text('(123)'),
              ],
            )
          ],
        ),
      ),
      content: Container(
        width: double.infinity,
        child: Wrap(spacing: 6.0, alignment: WrapAlignment.start, children: [
          ...[
            'INSULIN CARE',
            'Optimal',
            'Paleo',
            'INSULIN CARE WEGE + RYBA',
            'Samuraj',
            '...'
          ].map((e) => buildChip(e)).toList(),
        ]),
      ),
    );
  }

  Chip buildChip(String label) {
    return Chip(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
      label: Text(
        label,
        style: TextStyle(fontSize: 14.0),
      ),
    );
  }
}
