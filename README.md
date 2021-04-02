# POSITION_SM30
 Fix positioning in sm30.
 
 This is how to fix positioning in standard transaction SM30 when searching row by typing key values.
 
 Standard perform "popup_positionieren" using full key search in table EXTRACT with binary type row key.
 And if some keys don't inputed, positioning doesn't work correctly.
 
 For fix it you need to add [perform](https://github.com/Sgudkov/POSITION_SM30/blob/main/Fix_positioning.abap) to event with name AE of maintenance view.
  
 
 
