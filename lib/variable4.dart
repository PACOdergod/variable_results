library variable_result;

import 'package:meta/meta.dart';

@sealed
abstract class Variable4<F, S, T, FO> {
  const Variable4();

  factory Variable4.first(F _) => First(_);
  factory Variable4.second(S _) => Second(_);
  factory Variable4.third(T _) => Third(_);
  factory Variable4.fourth(FO _) => Fourth(_);

  bool get isFirst;
  bool get isSecond;
  bool get isThird;
  bool get isFourth;

  W map<W>(
    W Function(F first) mapFirst,
    W Function(S second) mapSecond,
    W Function(T third) mapThird,
    W Function(FO fourth) mapFourth,
  );

  when(
    Function(F first) whenFirst,
    Function(S second) whenSecond,
    Function(T third) whenThird,
    Function(FO fourth) whenFourth,
  );
}

class First<F, S, T, FO> extends Variable4<F, S, T, FO> {
  final F _first;
  First(this._first);

  @override
  bool get isFirst => true;
  @override
  bool get isSecond => false;
  @override
  bool get isThird => false;
  @override
  bool get isFourth => false;

  @override
  W map<W>(
    W Function(F first) mapFirst, 
    W Function(S second) mapSecond, 
    W Function(T third) mapThird, 
    W Function(FO fourth) mapFourth
  ) {return mapFirst(_first);}

  @override
  when(
    Function(F first) whenFirst, 
    Function(S second) whenSecond, 
    Function(T third) whenThird, 
    Function(FO fourth) whenFourth
  ) {whenFirst(_first);}
}

class Second<F, S, T, FO> extends Variable4<F, S, T, FO> {
  final S _second;
  Second(this._second);
  
  @override
  bool get isFirst => false;
  @override
  bool get isSecond => true;
  @override
  bool get isThird => false;
  @override
  bool get isFourth => false;

  @override
  W map<W>(
    W Function(F first) mapFirst, 
    W Function(S second) mapSecond, 
    W Function(T third) mapThird, 
    W Function(FO fourth) mapFourth
  ) {return mapSecond(_second);}

  @override
  when(
    Function(F first) whenFirst, 
    Function(S second) whenSecond, 
    Function(T third) whenThird, 
    Function(FO fourth) whenFourth
  ) {whenSecond(_second);}
}

class Third<F, S, T, FO> extends Variable4<F, S, T, FO> {
  final T _third;
  Third(this._third);

  @override
  bool get isFirst => false;
  @override
  bool get isSecond => false;
  @override
  bool get isThird => true;
  @override
  bool get isFourth => false;

  @override
  W map<W>(
    W Function(F first) mapFirst, 
    W Function(S second) mapSecond, 
    W Function(T third) mapThird, 
    W Function(FO fourth) mapFourth
  ) {return mapThird(_third);}

  @override
  when(
    Function(F first) whenFirst, 
    Function(S second) whenSecond, 
    Function(T third) whenThird, 
    Function(FO fourth) whenFourth
  ) {whenThird(_third);}
}

class Fourth<F, S, T, FO> extends Variable4<F, S, T, FO> {
  final FO _fourth;
  Fourth(this._fourth);

  @override
  bool get isFirst => false;
  @override
  bool get isSecond => false;
  @override
  bool get isThird => false;
  @override
  bool get isFourth => true;

  @override
  W map<W>(
    W Function(F first) mapFirst, 
    W Function(S second) mapSecond, 
    W Function(T third) mapThird, 
    W Function(FO fourth) mapFourth
  ) {return mapFourth(_fourth);}

  @override
  when(
    Function(F first) whenFirst, 
    Function(S second) whenSecond, 
    Function(T third) whenThird, 
    Function(FO fourth) whenFourth
  ) {whenFourth(_fourth);}
}