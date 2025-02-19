import 'package:flutter/material.dart';

import '../data_state/data_state.dart';

typedef WidgetStateBuilder<T> = Widget Function(BuildContext context,DataState<T> state);

class StatusComponent<T extends Object> extends StatelessWidget {

  final DataState<T> state;
  final WidgetStateBuilder<T>? onError;
  final WidgetStateBuilder<T> onSuccess;
  final WidgetStateBuilder<T>? onLoading;
  final WidgetStateBuilder<T>? onInit;


  const StatusComponent({
    Key? key,
    required this.state,
    required this.onSuccess,
    this.onError,
    this.onLoading,
    this.onInit
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch(state.status){
      case DataStatus.error:
        return onError?.call(context,state) ?? Center(
          child: Text(state.message),
        );
      case DataStatus.success:
        return onSuccess(context,state);
      case DataStatus.init:
        return onInit?.call(context,state) ?? const Center(
          child: CircularProgressIndicator(),
        );
      case DataStatus.loading:
        return onLoading?.call(context,state) ?? const Center(
          child: CircularProgressIndicator(),
        );
    }
  }

  factory StatusComponent.sliver({
    Key? key,
    required DataState<T> state,
    WidgetStateBuilder<T>? onError,
    required WidgetStateBuilder<T> onSuccess,
    WidgetStateBuilder<T>? onLoading,
    WidgetStateBuilder<T>? onInit,
  }) => StatusComponent(
      key: key,
      state: state,
      onSuccess: onSuccess,
      onError: onError ?? (_,state) => SliverToBoxAdapter(
        child: Text(state.message),
      ),
      onLoading: onLoading ?? (_,state) => const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        )
      ),
      onInit: onInit ?? (_,state) => const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        )
      ),
  );
}