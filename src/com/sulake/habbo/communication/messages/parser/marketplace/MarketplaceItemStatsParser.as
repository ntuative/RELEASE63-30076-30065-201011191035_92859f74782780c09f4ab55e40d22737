package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_1877:int;
      
      private var var_1876:int;
      
      private var var_1875:int;
      
      private var _dayOffsets:Array;
      
      private var var_1402:Array;
      
      private var var_1401:Array;
      
      private var var_1873:int;
      
      private var var_1874:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_1877;
      }
      
      public function get offerCount() : int
      {
         return this.var_1876;
      }
      
      public function get historyLength() : int
      {
         return this.var_1875;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get method_1() : Array
      {
         return this.var_1402;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1401;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_1873;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_1874;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1877 = param1.readInteger();
         this.var_1876 = param1.readInteger();
         this.var_1875 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1402 = [];
         this.var_1401 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1402.push(param1.readInteger());
            this.var_1401.push(param1.readInteger());
            _loc3_++;
         }
         this.var_1874 = param1.readInteger();
         this.var_1873 = param1.readInteger();
         return true;
      }
   }
}
