import 'package:flutter/material.dart';
import 'package:my_dinner/features/pick_diet/domain/models/diet_offer.dart';
import 'package:my_dinner/widgets/material_dropdown.dart';
import 'package:my_dinner/widgets/selectable_card.dart';

typedef OnSelect = void Function(DietOffer value);

class DietOfferCard extends StatefulWidget {
  final DietOffer dietOffer;
  final OnSelect onSelect;

  const DietOfferCard({
    Key key,
    this.dietOffer,
    this.onSelect,
  }) : super(key: key);

  @override
  _DietOfferCardState createState() => _DietOfferCardState();
}

class _DietOfferCardState extends State<DietOfferCard> {
  String selectedVariant;
  String selectedCalorific;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedVariant = widget.dietOffer.variants.length == 1
          ? widget.dietOffer.variants[0]
          : '';
      selectedCalorific = widget.dietOffer.calorific.length == 1
          ? widget.dietOffer.calorific[0]
          : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SelectableCard(
          card: Card(
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(widget.dietOffer.name),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          widget.dietOffer.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    FlatButton(
                      child: Text('Pokaż\nwięcej'),
                      onPressed: () => _showDialogWithDiet(),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FractionallySizedBox(
                            widthFactor: 0.8,
                            child: Container(
                              child: MaterialDropdown<String>(
                                title: 'Warianty',
                                dropDown: DropdownButtonFormField(
                                  value: selectedVariant,
                                  items: <DropdownMenuItem<String>>[
                                    if (widget.dietOffer.variants.length > 1)
                                      _emptyDropdown,
                                    ..._mapToDropdown(
                                        widget.dietOffer.variants),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedVariant = value;
                                    });
                                  },
                                ),
                              ),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.8,
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: MaterialDropdown<String>(
                                title: 'Kaloryczność',
                                dropDown: DropdownButtonFormField(
                                  value: selectedCalorific,
                                  items: <DropdownMenuItem<String>>[
                                    if (widget.dietOffer.calorific.length > 1)
                                      _emptyDropdown,
                                    ..._mapToDropdown(widget.dietOffer.calorific
                                        .map((e) => e.toString())
                                        .toList()),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedCalorific = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        '21,00 - 39,00 zł / dzień',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        if (widget.onSelect != null)
                          widget.onSelect(widget.dietOffer);
                      },
                      child: Text('Wybierz'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showDialogWithDiet() {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        child: LayoutBuilder(
          builder: (_, constraints) {
            print(constraints.maxHeight);
            print(constraints.maxWidth);
            return Container();
          },
        ),
      ),
    );
  }

  DropdownMenuItem<String> get _emptyDropdown => DropdownMenuItem<String>(
        value: '',
        child: Text(''),
      );

  List<DropdownMenuItem<String>> _mapToDropdown(List<String> values) => values
      .map((value) => DropdownMenuItem<String>(
            child: Text(value),
            value: value,
          ))
      .toList();
}
