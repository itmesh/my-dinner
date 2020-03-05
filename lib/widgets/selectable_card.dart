import 'package:flutter/material.dart';
import 'package:getflutter/components/card/gf_card.dart';

class SelectableGFCard extends StatefulWidget {
  final GFCard card;
  final GestureTapCallback onTap;
  final bool selected;

  const SelectableGFCard({
    Key key,
    @required this.card,
    this.onTap,
    this.selected = false,
  })  : assert(card != null, 'child can not be null'),
        super(key: key);

  @override
  _SelectableGFCardState createState() => _SelectableGFCardState(selected);
}

class _SelectableGFCardState extends State<SelectableGFCard> {
  bool selected;

  _SelectableGFCardState(this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.card.margin,
      child: GestureDetector(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap();
            setState(() {
              selected = !selected;
            });
          }
        },
        child: GFCard(
          margin: EdgeInsets.zero,
          title: widget.card.title,
          content: widget.card.content,
          shape: selected
              ? RoundedRectangleBorder(
                  side: BorderSide(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(4.0),
                )
              : null,
        ),
      ),
    );
  }
}

class SelectableCard extends StatefulWidget {
  final Card card;
  final GestureTapCallback onTap;
  final bool selected;

  const SelectableCard({
    Key key,
    @required this.card,
    this.onTap,
    this.selected = false,
  })  : assert(card != null, 'child can not be null'),
        super(key: key);

  @override
  _SelectableCardState createState() => _SelectableCardState(selected);
}

class _SelectableCardState extends State<SelectableCard> {
  bool selected;

  _SelectableCardState(this.selected);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: widget.onTap != null
            ? () {
                widget.onTap();
                setState(() {
                  selected = !selected;
                });
              }
            : null,
        child: Card(
          child: widget.card.child,
          color: widget.card.color,
          key: widget.card.key,
          shape: selected
              ? RoundedRectangleBorder(
                  side: BorderSide(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(4.0),
                )
              : null,
        ),
      ),
    );
  }
}
