class IntData {
  int data;
  IntData(this.data);
}

class DoubleData {
  double data;
  DoubleData(this.data);
}

class Data<T> {
  T data;
  Data(this.data);
}

void main() {
  IntData i1 = IntData(3);
  DoubleData dd = DoubleData(243.34);

  Data<int> t1 = Data<int>(55);
  Data<double> d1 = Data<double>(33.11);
  print(d1.data);

  print(i1.data);
  print(dd.data);
}
