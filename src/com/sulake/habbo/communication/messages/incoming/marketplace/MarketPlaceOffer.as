package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2287:int;
      
      private var var_1851:String;
      
      private var var_1653:int;
      
      private var var_337:int;
      
      private var var_2288:int = -1;
      
      private var var_1877:int;
      
      private var var_1652:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2287 = param3;
         this.var_1851 = param4;
         this.var_1653 = param5;
         this.var_337 = param6;
         this.var_2288 = param7;
         this.var_1877 = param8;
         this.var_1652 = param9;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2287;
      }
      
      public function get stuffData() : String
      {
         return this.var_1851;
      }
      
      public function get price() : int
      {
         return this.var_1653;
      }
      
      public function get status() : int
      {
         return this.var_337;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2288;
      }
      
      public function get averagePrice() : int
      {
         return this.var_1877;
      }
      
      public function get offerCount() : int
      {
         return this.var_1652;
      }
   }
}
