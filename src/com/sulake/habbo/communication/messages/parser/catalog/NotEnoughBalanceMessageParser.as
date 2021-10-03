package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1678:int = 0;
      
      private var var_1677:int = 0;
      
      private var var_1654:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1678;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1677;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1654;
      }
      
      public function flush() : Boolean
      {
         this.var_1678 = 0;
         this.var_1677 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1678 = param1.readInteger();
         this.var_1677 = param1.readInteger();
         this.var_1654 = param1.readInteger();
         return true;
      }
   }
}
