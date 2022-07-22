import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectorViewModelBuilder<T extends ChangeNotifier, K>
    extends StatelessWidget {
  const SelectorViewModelBuilder({
    Key? key,
    required this.selector,
    required this.builder,
    this.child,
    this.shouldRebuild,
  }) : super(key: key);

  final K Function(T model) selector;
  final Widget Function(BuildContext context, K value) builder;
  final Widget? child;
  final bool Function(K, K)? shouldRebuild;
  @override
  Widget build(BuildContext context) {
    return Selector<T, K>(
      key: key,
      shouldRebuild: shouldRebuild,
      selector: (BuildContext context, T model) => selector(model),
      builder: (BuildContext _, K value, Widget? child) => builder(_, value),
      child: child,
    );
  }
}
