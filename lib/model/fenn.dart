class Fenn{
  final String name;
  final int bal;
  final int kredit;

  Fenn({required this.name, required this.bal, required this.kredit});

  @override
  String toString() {
    // TODO: implement toString
    return '$name $bal $kredit';
  }
}