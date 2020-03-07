import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/components/card/gf_card.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:getflutter/size/gf_size.dart';
import 'package:my_dinner/features/pick_diet/domain/models/company.dart';
import 'package:my_dinner/features/pick_diet/domain/models/diet_offer.dart';
import 'package:my_dinner/widgets/selectable_card.dart';

typedef OnSelect = void Function(Company value);

class CompanyCard extends StatefulWidget {
  final Company company;
  final OnSelect onSelect;
  final bool selected;

  const CompanyCard({
    this.company,
    this.onSelect,
    this.selected = false,
  });

  @override
  State<StatefulWidget> createState() {
    return _CompanyCardState(selected);
  }
}

class _CompanyCardState extends State<CompanyCard>
    with TickerProviderStateMixin {
  final _showAllChipsDuration = Duration(milliseconds: 400);
  final ValueNotifier<bool> _showAllChips = ValueNotifier<bool>(false);
  AnimationController _showingAllChipsController;
  bool selected = false;

  _CompanyCardState(this.selected);

  @override
  void initState() {
    super.initState();
    _showingAllChipsController = AnimationController(
      vsync: this,
      duration: _showAllChipsDuration,
    );
    _showingAllChipsController.value = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return SelectableGFCard(
      selected: selected,
      card: GFCard(
        margin: EdgeInsets.only(bottom: 8.0),
        title: GFListTile(
          avatar: GFAvatar(
            size: GFSize.large,
            backgroundImage: CachedNetworkImageProvider(widget.company.logoURL),
          ),
          icon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              '\$\$',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.company.name,
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(
                height: 4.0,
              ),
              Row(
                children: <Widget>[
                  AbsorbPointer(
                    child: RatingBar(
                      allowHalfRating: true,
                      initialRating: widget.company.rating.rate,
                      itemSize: 20.0,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (_) {},
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(widget.company.rating.rate.toString()),
                  SizedBox(width: 4.0),
                  Text(widget.company.rating.votesCount.toString()),
                ],
              )
            ],
          ),
        ),
        content: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: ValueListenableBuilder(
                valueListenable: _showAllChips,
                builder: (_, __, ___) {
                  return AnimatedSize(
                    vsync: this,
                    duration: _showAllChipsDuration,
                    alignment: Alignment.topCenter,
                    child: Wrap(
                      spacing: 6.0,
                      alignment: WrapAlignment.start,
                      children: _buildLimitedChips(widget.company.availDiets),
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (widget.onSelect != null)
                      widget.onSelect(widget.company);
                  },
                  child: Text('Wybierz'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildLimitedChips(List<DietOffer> diets, {int limit = 5}) {
    if (_showAllChips.value) {
      return diets
          .sublist(0, limit)
          .map((e) => _buildChip(label: e.name))
          .toList()
            ..addAll(diets
                .sublist(limit)
                .map((e) => _buildChip(label: e.name, withAnimation: true))
                .toList());
    } else {
      if (diets.length > limit) {
        return diets
            .sublist(0, limit)
            .map((e) => _buildChip(label: e.name))
            .toList()
              ..add(_buildChip(label: '...', onTap: _showMoreChips));
      } else {
        return diets.map((e) => _buildChip(label: e.name)).toList();
      }
    }
  }

  void _showMoreChips() {
    _showAllChips.value = true;
    _showingAllChipsController.forward();
  }

  Widget _buildChip({
    String label,
    VoidCallback onTap,
    bool withAnimation = false,
  }) {
    Widget chip = GestureDetector(
      onTap: onTap,
      child: Chip(
        backgroundColor: _chipBackgroundColor(context),
        label: Text(
          label,
          style: TextStyle(fontSize: 14.0),
        ),
      ),
    );

    if (withAnimation) {
      return FadeTransition(
        opacity:
            Tween(begin: 0.0, end: 1.0).animate(_showingAllChipsController),
        child: chip,
      );
    } else {
      return chip;
    }
  }

  Color _chipBackgroundColor(BuildContext context) =>
      Theme.of(context).primaryColor.withOpacity(0.1);
}
