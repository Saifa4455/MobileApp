void main() {
  //var resultGen = callGen(1991);
  //print(resultGen);
  //print(callGen(1991));

  //var x = callColor("Yellow");
  //print(x);

  callWeb("Youtube", port: "443", protocal: "https");
}

String callGen(int year) {
  //print(year);

  /*if(year >= 1996) {
    print("Gen Z");
  }else {
    print("Gen Y or Upper");
  }*/

  var x = (year >= 1996) ? "Gen Z" : "Gen Y or Upper";
  return x;
}

int callColor([String newColor = "pink"]) {

  List<String> colors = ["red", "blue", "green", "black"];

  colors.add(newColor);

  for(var i in colors) {
    print(i);
  }

  return colors.length;
}

void callWeb(String web, {String protocal = "http", String port = "80"}) => print("$web $protocal port : $port");