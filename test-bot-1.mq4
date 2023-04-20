//+------------------------------------------------------------------+
//|                                                   test-bot-1.mq4 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

int order = 0;


 // int ticket; //your ticket from OrderSend in global variable


int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   double fastMovingAverage = iMA(NULL, 0, 21, 0, MODE_SMA, PRICE_CLOSE, 0);
   double slowMovingAverage = iMA(NULL, 0, 150, 0, MODE_SMA, PRICE_CLOSE, 0);
   
   double currentPrice = Open[0];
   
   //Alert(OrderSelect(order, SELECT_BY_TICKET));
   
   //if(OrderSelect(order, SELECT_BY_TICKET) == true) {
      
      //Alert("Profit: " + OrderProfit());
      
   //} else {
      if (fastMovingAverage > slowMovingAverage) {
         // Buy
         order = OrderSend(NULL, OP_BUY, 1, currentPrice, 0, NULL, NULL, NULL, 0, 0, NULL);
      } else if (slowMovingAverage > fastMovingAverage) {
         // Sell
         order = OrderSend(NULL, OP_SELL, 1, currentPrice, 0, NULL, NULL, NULL, 0, 0, NULL);
      }
   //}
   
   
   //Alert(GetLastError());//---
   
  }
//+------------------------------------------------------------------+
