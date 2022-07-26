// Increase Font Size Text : all App
double fontSizeTextSmall = 14.0;
double fontSizeText = 16.0;
double heightTitleDivider = 35;
double appBarTitleFontSizeText = 18.0;
double heightSumItem = 25.0;
double topCombobox = 18.0;
double fontSizeHeader = 25.0;
double fontSizeHeaderHomeScreen = 23.0;
double fontSizeActionBtn = 20.0;
double fontSizeToaster = 16.0;

double changeValuePercent(double val,  valPercent){
  return val + (val * valPercent / 100.0);
}

changeValuesPercent(int valPercent){
  fontSizeHeader = 25.0;
  fontSizeHeaderHomeScreen = 23.0;
  fontSizeActionBtn = 20.0;
  fontSizeToaster = 16.0;

  fontSizeTextSmall = 14.0;
  fontSizeText = 16.0;
  heightSumItem = 25.0;
  appBarTitleFontSizeText = 18.0;
  topCombobox = 18.0;
  heightTitleDivider = 35;

  fontSizeHeader = changeValuePercent(fontSizeHeader, valPercent);
  fontSizeHeaderHomeScreen = changeValuePercent(fontSizeHeaderHomeScreen, valPercent);
  fontSizeActionBtn = changeValuePercent(fontSizeActionBtn, valPercent);
  fontSizeToaster = changeValuePercent(fontSizeToaster, valPercent);
  fontSizeText = changeValuePercent(fontSizeText, valPercent);
  fontSizeTextSmall = changeValuePercent(fontSizeTextSmall, valPercent);
  heightSumItem = changeValuePercent(heightSumItem, valPercent/3);
  topCombobox = changeValuePercent(topCombobox, valPercent/3);
  appBarTitleFontSizeText = changeValuePercent(appBarTitleFontSizeText, valPercent);
  heightTitleDivider = changeValuePercent(heightTitleDivider, valPercent/2);
}