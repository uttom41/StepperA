/// /*** Uttam kumar mitra ***/
/// create date 7/04/2023; 10:36 PM
///
///
///
/// A circular array of dash offsets and lengths.
///
/// For example, the array `[5, 10]` would result in dashes 5 pixels long
/// followed by blank spaces 10 pixels long.  The array `[5, 10, 5]` would
/// result in a 5 pixel dash, a 10 pixel gap, a 5 pixel dash, a 5 pixel gap,

class CircularIntervalList<T> {
  CircularIntervalList(this._value);

  final List<T> _value;
  int _index = 0;

  T get next {
    if (_index >= _value.length) {
      _index = 0;
    }
    return _value[_index++];
  }
}
