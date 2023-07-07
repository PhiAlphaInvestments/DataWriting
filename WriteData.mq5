//+------------------------------------------------------------------+
//|                                                    WriteData.mq5 |
//|                                                 |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property link      "https://www.mql5.com"
#property version   "1.00"

 
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

 int filehandleSetM1;
   ResetLastError();
   filehandleSetM1=FileOpen("DataTickUS100.csv",FILE_READ|FILE_WRITE|FILE_CSV|FILE_ANSI,",");
   //PrintFormat("File path: %s\\MQL5\\Files\\",TerminalInfoString(TERMINAL_DATA_PATH));
   if(filehandleSetM1!=INVALID_HANDLE)
     {      
      //Print("File opened correctly");
     }
   else{ 
   //Print("Error in opening file,",GetLastError())
   };

    MqlTick last_tickM1;
    
   if(SymbolInfoTick(Symbol(),last_tickM1))
     {
     
      FileSeek(filehandleSetM1,0,SEEK_END);
      FileWrite(filehandleSetM1,"Ask","Bid","Volume","Time");
      
      FileClose(filehandleSetM1);
     }
   else{ 
   //Print("SymbolInfoTick() failed, error = ",GetLastError());
   };
 
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
   datetime now = TimeCurrent();
     
          
         int filehandleM1;
         ResetLastError();
         filehandleM1=FileOpen("DataTickUS100.csv",FILE_READ|FILE_WRITE|FILE_CSV|FILE_ANSI,",");
         //PrintFormat("File path: %s\\MQL5\\Files\\",TerminalInfoString(TERMINAL_DATA_PATH));
         if(filehandleM1!=INVALID_HANDLE)
           {      
            //Print("File opened correctly");
           }
         else{ 
         //Print("Error in opening file,",GetLastError())
         };
      
          MqlTick last_tickM1;
          
         if(SymbolInfoTick(Symbol(),last_tickM1))
           {
            
            //double current_Ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
           
            FileSeek(filehandleM1,0,SEEK_END);
            FileWrite(filehandleM1, SymbolInfoDouble(Symbol(),SYMBOL_ASK),SymbolInfoDouble(Symbol(),SYMBOL_BID),iTickVolume(Symbol(),PERIOD_M1,0), TimeToString(now,TIME_DATE|TIME_SECONDS));
            
            FileClose(filehandleM1);
           }
         else{ 
         //Print("SymbolInfoTick() failed, error = ",GetLastError());
         };
           
   
  }
//+------------------------------------------------------------------+
