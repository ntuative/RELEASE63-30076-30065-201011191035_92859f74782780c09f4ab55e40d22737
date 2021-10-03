package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1877:int;
      
      private var var_1876:int;
      
      private var var_1875:int;
      
      private var _dayOffsets:Array;
      
      private var var_1402:Array;
      
      private var var_1401:Array;
      
      private var var_1873:int;
      
      private var var_1874:int;
      
      public function MarketplaceItemStats()
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
      
      public function set averagePrice(param1:int) : void
      {
         this.var_1877 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_1876 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_1875 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set method_1(param1:Array) : void
      {
         this.var_1402 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1401 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_1873 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_1874 = param1;
      }
   }
}
