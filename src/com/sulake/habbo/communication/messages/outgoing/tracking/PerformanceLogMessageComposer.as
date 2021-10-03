package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2017:int = 0;
      
      private var var_1243:String = "";
      
      private var var_1568:String = "";
      
      private var var_2013:String = "";
      
      private var var_2016:String = "";
      
      private var var_1480:int = 0;
      
      private var var_2018:int = 0;
      
      private var var_2015:int = 0;
      
      private var var_1241:int = 0;
      
      private var var_2014:int = 0;
      
      private var var_1240:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2017 = param1;
         this.var_1243 = param2;
         this.var_1568 = param3;
         this.var_2013 = param4;
         this.var_2016 = param5;
         if(param6)
         {
            this.var_1480 = 1;
         }
         else
         {
            this.var_1480 = 0;
         }
         this.var_2018 = param7;
         this.var_2015 = param8;
         this.var_1241 = param9;
         this.var_2014 = param10;
         this.var_1240 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2017,this.var_1243,this.var_1568,this.var_2013,this.var_2016,this.var_1480,this.var_2018,this.var_2015,this.var_1241,this.var_2014,this.var_1240];
      }
   }
}
