import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getflutter/components/button/gf_icon_button.dart';
import 'package:getflutter/components/card/gf_card.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:getflutter/getflutter.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/features/companies/domain/models/company.dart';
import 'package:my_dinner/features/companies/presentation/provider/company_selector.dart';
import 'package:my_dinner/widgets/navigation_drawer.dart';
import 'package:provider/provider.dart';

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
  final CompanySelector _companySelector = locator.get();

  @override
  void initState() {
    super.initState();
    _companySelector.initailize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wybierz catering'),
        leading: BackButton(),
      ),
      body: ChangeNotifierProvider(
        create: (context) => _companySelector,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Consumer<CompanySelector>(
            builder: (context, selector, child) {
              return ListView(
                children:
                    selector.companies.map((e) => buildGfCard(e)).toList(),
              );
            },
          ),
        ),
      ),
      drawer: NavigationDrawer(),
    );
  }

  GFCard buildGfCard(Company company) {
    return GFCard(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      title: GFListTile(
        avatar: GFAvatar(
          size: GFSize.large,
          backgroundImage: CachedNetworkImageProvider(company.logoURL),
        ),
        icon: GFIconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              company.name,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 4.0,
            ),
            Row(
              children: <Widget>[
                RatingBar(
                  initialRating: company.rating.rate,
                  itemSize: 20.0,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (_) {},
                ),
                SizedBox(width: 8.0),
                Text(company.rating.rate.toString()),
                SizedBox(width: 4.0),
                Text(company.rating.votesCount.toString()),
              ],
            )
          ],
        ),
      ),
      content: Container(
        width: double.infinity,
        child: Wrap(spacing: 6.0, alignment: WrapAlignment.start, children: [
          ...company.availDiets.map((e) => _buildChip(e)).toList(),
          _buildChip('...'),
        ]),
      ),
    );
  }

  Chip _buildChip(String label) {
    return Chip(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
      label: Text(
        label,
        style: TextStyle(fontSize: 14.0),
      ),
    );
  }
}
