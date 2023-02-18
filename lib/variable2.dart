library variable_result;

import 'package:meta/meta.dart';

@sealed
abstract class Variable2<F, S> {
  const Variable2();

  factory Variable2.first(F _) => First(_);
  factory Variable2.second(S _) => Second(_);

  bool get isFirst;
  bool get isSecond;

  W map<W>(
    W Function(F first) mapFirst,
    W Function(S second) mapSecond,
  );

  when(
    Function(F first) whenFirst,
    Function(S second) whenSecond,
  );
}

@immutable
class First<F, S> extends Variable2<F, S> {
  final F _first;
  const First(this._first);

  @override
  bool get isFirst => true;
  @override
  bool get isSecond => false;

  @override
  W map<W>(
    W Function(F first) mapFirst, 
    W Function(S second) mapSecond
  ) {return mapFirst(_first);}

  @override
  when(
    Function(F first) whenFirst, 
    Function(S second) whenSecond
  ) {whenFirst(_first);}
}

@immutable
class Second<F, S> extends Variable2<F, S> {
  final S _second;
  const Second(this._second);

  @override
  bool get isFirst => false;
  @override
  bool get isSecond => true;

  @override
  W map<W>(
    W Function(F first) mapFirst, 
    W Function(S second) mapSecond
  ) {return mapSecond(_second);}

  @override
  when(
    Function(F first) whenFirst, 
    Function(S second) whenSecond
  ) {whenSecond(_second);}
}