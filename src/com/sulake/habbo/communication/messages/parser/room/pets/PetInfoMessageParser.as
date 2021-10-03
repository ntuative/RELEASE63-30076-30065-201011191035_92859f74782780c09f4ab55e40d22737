package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1533:int;
      
      private var _name:String;
      
      private var var_1659:int;
      
      private var var_2125:int;
      
      private var var_2093:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_574:String;
      
      private var var_2122:int;
      
      private var var_2123:int;
      
      private var var_2124:int;
      
      private var var_2105:int;
      
      private var var_2087:int;
      
      private var _ownerName:String;
      
      private var var_2088:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1533;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1659;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2125;
      }
      
      public function get experience() : int
      {
         return this.var_2093;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_574;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2122;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2123;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2124;
      }
      
      public function get respect() : int
      {
         return this.var_2105;
      }
      
      public function get ownerId() : int
      {
         return this.var_2087;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_2088;
      }
      
      public function flush() : Boolean
      {
         this.var_1533 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1533 = param1.readInteger();
         this._name = param1.readString();
         this.var_1659 = param1.readInteger();
         this.var_2125 = param1.readInteger();
         this.var_2093 = param1.readInteger();
         this.var_2122 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2123 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2124 = param1.readInteger();
         this.var_574 = param1.readString();
         this.var_2105 = param1.readInteger();
         this.var_2087 = param1.readInteger();
         this.var_2088 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
