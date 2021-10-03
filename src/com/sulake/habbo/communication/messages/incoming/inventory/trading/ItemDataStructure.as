package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2052:int;
      
      private var var_1208:String;
      
      private var var_2112:int;
      
      private var var_2113:int;
      
      private var _category:int;
      
      private var var_1851:String;
      
      private var var_1531:int;
      
      private var var_2115:int;
      
      private var var_2111:int;
      
      private var var_2109:int;
      
      private var var_2114:int;
      
      private var var_2110:Boolean;
      
      private var var_2637:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2052 = param1;
         this.var_1208 = param2;
         this.var_2112 = param3;
         this.var_2113 = param4;
         this._category = param5;
         this.var_1851 = param6;
         this.var_1531 = param7;
         this.var_2115 = param8;
         this.var_2111 = param9;
         this.var_2109 = param10;
         this.var_2114 = param11;
         this.var_2110 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2052;
      }
      
      public function get itemType() : String
      {
         return this.var_1208;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2112;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2113;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1851;
      }
      
      public function get extra() : int
      {
         return this.var_1531;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2115;
      }
      
      public function get creationDay() : int
      {
         return this.var_2111;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2109;
      }
      
      public function get creationYear() : int
      {
         return this.var_2114;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2110;
      }
      
      public function get songID() : int
      {
         return this.var_1531;
      }
   }
}
