String numberEnglishToBangla({required dynamic num, required String lang, bool isNumber = true}) {
  Map numData = {
    'বাংলা': {
      "1": '১',
      "2": '২',
      "3": '৩',
      "4": '৪',
      "5": '৫',
      "6": '৬',
      "7": '৭',
      "8": '৮',
      "9": '৯',
      "0": '০',
    },
    'en': {
      "1": '1',
      "2": '2',
      "3": '3',
      "4": '4',
      "5": '5',
      "6": '6',
      "7": '7',
      "8": '8',
      "9": '9',
      "0": '0',
    }
  };
  String str = num.toString();
  List<String> numList = str.split('.');
  try{
    if(isNumber && int.parse(numList[0]) >= 1){

      str = int.parse(numList[0]).toString();
    }
    else {
      str = numList[0];
    }
  }
  catch(e){
    str = numList[0];
  }

  String ans = '';
  int length = str.length;

  for (int i = 0; i < str.length; i++) {
    if(numData[lang].containsKey(str[i])){
      ans += numData[lang][str[i]];
      if(isNumber){
        if (length > 3) {
          if ((length - (i + 1)) % 3 == 0 && i != length - 1) {
            ans += ',';
          }
        }
      }

    }
    else {
      ans += str[i];

    }
  }

  if(numList.length > 1){
    ans += '.';
    for (int i = 0; i < numList[1].length; i++){
      if(numData[lang].containsKey(numList[1][i])){
        ans += numData[lang][numList[1][i]];
      }
      else {
        ans += str[i];
      }
    }

  }

  return ans;

}