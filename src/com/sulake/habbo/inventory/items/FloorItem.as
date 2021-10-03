package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_1851:String;
      
      protected var var_1531:Number;
      
      protected var var_2573:Boolean;
      
      protected var var_2571:Boolean;
      
      protected var var_2110:Boolean;
      
      protected var var_2572:Boolean;
      
      protected var var_2574:int;
      
      protected var var_2111:int;
      
      protected var var_2109:int;
      
      protected var var_2114:int;
      
      protected var var_1673:String;
      
      protected var var_1968:int;
      
      protected var var_814:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2110 = param5;
         this.var_2571 = param6;
         this.var_2573 = param7;
         this.var_2572 = param8;
         this.var_1851 = param9;
         this.var_1531 = param10;
         this.var_2574 = param11;
         this.var_2111 = param12;
         this.var_2109 = param13;
         this.var_2114 = param14;
         this.var_1673 = param15;
         this.var_1968 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_1851;
      }
      
      public function get extra() : Number
      {
         return this.var_1531;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2573;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2571;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2110;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2572;
      }
      
      public function get expires() : int
      {
         return this.var_2574;
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
      
      public function get slotId() : String
      {
         return this.var_1673;
      }
      
      public function get songId() : int
      {
         return this.var_1968;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_814 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_814;
      }
   }
}
