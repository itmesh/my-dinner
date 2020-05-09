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
typedef OnSelectDiet = void Function(
  Company company,
  DietOffer diet,
  Calorie calorie,
);

class CompanyCard extends StatefulWidget {
  final Company company;
  final OnSelect onSelect;
  final bool selected;
  final OnSelectDiet onSelectDiet;

  const CompanyCard({
    this.company,
    this.onSelect,
    this.selected = false,
    this.onSelectDiet,
  });

  @override
  State<StatefulWidget> createState() {
    return _CompanyCardState(selected);
  }
}

class _CompanyCardState extends State<CompanyCard>
    with TickerProviderStateMixin {
  final _showAllChipsDuration = Duration(milliseconds: 400);
  final _hideMoreChipsDuration = Duration(milliseconds: 100);
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
            size: GFSize.LARGE,
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
              if (widget.company.rating != null)
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
                    Text('(${widget.company.rating.votesCount})'),
                  ],
                )
            ],
          ),
        ),
        content: Column(
          children: <Widget>[
            if (widget.company.availDiets != null)
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
          .map((diet) => _buildChip(
              diet: diet, onTap: (diet) => _showDialogWithDiet(diet)))
          .toList()
            ..addAll(diets
                .sublist(limit)
                .map((diet) => _buildChip(
                    diet: diet,
                    withAnimation: true,
                    onTap: (diet) => _showDialogWithDiet(diet)))
                .toList());
    } else {
      if (diets.length > limit) {
        return diets
            .sublist(0, limit)
            .map((diet) => _buildChip(
                diet: diet, onTap: (diet) => _showDialogWithDiet(diet)))
            .toList()
              ..add(_buildChip(onTap: (_) => _showMoreChips()));
      } else {
        return diets
            .map((diet) => _buildChip(
                diet: diet, onTap: (diet) => _showDialogWithDiet(diet)))
            .toList();
      }
    }
  }

  void _showDialogWithDiet(DietOffer diet) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        child: LayoutBuilder(
          builder: (_, constraints) {
            print(constraints.maxHeight);
            print(constraints.maxWidth);
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          diet.name,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        ...diet.calories
                            .map((e) => Container(
                                  margin: const EdgeInsets.only(bottom: 4.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(6.0),
                                    border: Border.all(
                                      color: _chipBackgroundColor(context),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        if (widget.onSelectDiet != null) {
                                          widget.onSelectDiet(
                                            widget.company,
                                            diet,
                                            e,
                                          );
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                  e.value.toString() + ' kcal'),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(_priceRange(e.pricing)),
                                                SizedBox(width: 16.0),
                                                Text(
                                                  'Wybierz',
                                                  style:
                                                      TextStyle(fontSize: 12.0),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Zamknij'),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  String _priceRange(List<Price> pricing) {
    double lowestPrice =
        pricing.reduce((p1, p2) => p1.value < p2.value ? p1 : p2).value;
    double highestPrice =
        pricing.reduce((p1, p2) => p1.value > p2.value ? p1 : p2).value;
    return '${lowestPrice.toStringAsFixed(2)} zł - ${highestPrice.toStringAsFixed(2)} zł';
  }

  void _showMoreChips() {
    _showAllChips.value = true;
    _showingAllChipsController.forward();
  }

  Widget _buildChip({
    DietOffer diet,
    Function onTap,
    bool withAnimation = false,
  }) {
    AnimationController _animController = AnimationController(
      vsync: this,
      duration: _hideMoreChipsDuration,
    );
    _animController.value = 0.0;
    Widget chip = FadeTransition(
      opacity: Tween(begin: 1.0, end: 0.0).animate(_animController),
      child: GestureDetector(
        onTap: () {
          if (diet == null) {
            _animController.addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                onTap(diet);
              }
            });
            _animController.forward();
          } else {
            onTap(diet);
          }
        },
        child: Chip(
          backgroundColor: _chipBackgroundColor(context),
          label: Text(
            diet?.name ?? '...',
            style: TextStyle(fontSize: 14.0),
          ),
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
