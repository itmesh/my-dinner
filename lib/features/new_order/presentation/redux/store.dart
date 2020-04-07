import 'package:my_dinner/features/new_order/presentation/redux/new_order_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class NewOrderRedux {
  static Store<NewOrderState> _store;

  static Store<NewOrderState> get store {
    if (_store == null) {
      throw Exception('store is not initialized');
    } else {
      return _store;
    }
  }

  static Future<Store<NewOrderState>> init() async {
    _store = Store(
      newOrderReducer,
      initialState: NewOrderState(),
      middleware: [thunkMiddleware]
    );
    return _store;
  }
}
