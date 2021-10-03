package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2216:int;
      
      private var var_1208:String;
      
      private var _objId:int;
      
      private var var_1434:int;
      
      private var _category:int;
      
      private var var_1851:String;
      
      private var var_2217:Boolean;
      
      private var var_2215:Boolean;
      
      private var var_2214:Boolean;
      
      private var var_2218:Boolean;
      
      private var var_2120:int;
      
      private var var_1531:int;
      
      private var var_1673:String = "";
      
      private var var_1968:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2216 = param1;
         this.var_1208 = param2;
         this._objId = param3;
         this.var_1434 = param4;
         this._category = param5;
         this.var_1851 = param6;
         this.var_2217 = param7;
         this.var_2215 = param8;
         this.var_2214 = param9;
         this.var_2218 = param10;
         this.var_2120 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1673 = param1;
         this.var_1531 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2216;
      }
      
      public function get itemType() : String
      {
         return this.var_1208;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1434;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1851;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2217;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2215;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2214;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2218;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2120;
      }
      
      public function get slotId() : String
      {
         return this.var_1673;
      }
      
      public function get songId() : int
      {
         return this.var_1968;
      }
      
      public function get extra() : int
      {
         return this.var_1531;
      }
   }
}
