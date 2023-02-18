library variable_result;

import 'package:meta/meta.dart';

@sealed
abstract class Variable3<F, S, T> {
  const Variable3();

  factory Variable3.first(F _) => First(_);
  factory Variable3.second(S _) => Second(_);
  factory Variable3.third(T _) => Third(_);

  bool get isFirst;
  bool get isSecond;
  bool get isThird;

  W map<W>(
    W Function(F first) mapFirst,
    W Function(S second) mapSecond,
    W Function(T third) mapThird,
  );

  when(
    Function(F first) whenFirst,
    Function(S second) whenSecond,
    Function(T third) whenThird,
  );
}

@immutable
class First<F, S, T> extends Variable3<F, S, T> {
  final F _first;
  const First(this._first);

  @override
  bool get isFirst => true;
  @override
  bool get isSecond => false;
  @override
  bool get isThird => false;

  @override
  W map<W>(
    W Function(F first) mapFirst, 
    W Function(S second) mapSecond,
    W Function(T third) mapThird,
  ) {return mapFirst(_first);}

  @override
  when(
    Function(F first) whenFirst, 
    Function(S second) whenSecond,
    Function(T third) whenThird,
  ) {whenFirst(_first);}

}

@immutable
class Second<F, S, T> extends Variable3<F, S, T> {
  final S _second;
  const Second(this._second);

  @override
  bool get isFirst => false;
  @override
  bool get isSecond => true;
  @override
  bool get isThird => false;

  @override
  W map<W>(
    W Function(F first) mapFirst, 
    W Function(S second) mapSecond,
    W Function(T third) mapThird,
  ) {return mapSecond(_second);}

  @override
  when(
    Function(F first) whenFirst, 
    Function(S second) whenSecond,
    Function(T third) whenThird,
  ) {whenSecond(_second);}
}

@immutable
class Third<F, S, T> extends Variable3<F, S, T> {
  final T _third;
  const Third(this._third);

  @override
  bool get isFirst => false;
  @override
  bool get isSecond => false;
  @override
  bool get isThird => true;

  @override
  W map<W>(
    W Function(F first) mapFirst, 
    W Function(S second) mapSecond,
    W Function(T third) mapThird,
  ) {return mapThird(_third);}

  @override
  when(
    Function(F first) whenFirst, 
    Function(S second) whenSecond,
    Function(T third) whenThird,
  ) {whenThird(_third);}
}

