import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/catalog.dart';

void main() {
  Item _itemModel;
  StreamController<Item> _controller;

  setUp(() {
    _controller = StreamController<Item>();
    _itemModel = Item(1, "name");
  });
     
  group('[Item model]', () {
    test('[Model] check individual values', () async {
      _itemModel = Item(
        1,
        "name",
      );
      expect(_itemModel.id.runtimeType, equals(int));
      expect(_itemModel.id, isNotNull);
      expect(_itemModel.name.runtimeType, equals(String));
      expect(_itemModel.name, isNotNull);
    });

    testWidgets('[Provider] Update when the value changes', (tester) async {
      final _provideKey = GlobalKey();
      final _childKey = GlobalKey();
      BuildContext context;
      // await tester.pumpWidget(StreamProvider(
      //   key: _provideKey,
      //   builder: (c) {
      //     context = c;
      //     return _controller.stream;
      //   },
      //   create: (BuildContext context) {  },
      //   child: Container(key: _childKey),
      // )
      // );
    });
  });
}
