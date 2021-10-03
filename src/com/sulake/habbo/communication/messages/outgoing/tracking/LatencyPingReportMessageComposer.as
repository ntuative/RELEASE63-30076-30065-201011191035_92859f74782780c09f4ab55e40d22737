package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_1960:int;
      
      private var var_1962:int;
      
      private var var_1961:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_1960 = param1;
         this.var_1962 = param2;
         this.var_1961 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1960,this.var_1962,this.var_1961];
      }
      
      public function dispose() : void
      {
      }
   }
}
