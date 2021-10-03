package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1533:int;
      
      private var var_1659:int;
      
      private var var_2090:int;
      
      private var var_2093:int;
      
      private var var_2095:int;
      
      private var _energy:int;
      
      private var var_2096:int;
      
      private var _nutrition:int;
      
      private var var_2089:int;
      
      private var var_2087:int;
      
      private var _ownerName:String;
      
      private var var_2105:int;
      
      private var var_2088:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1533;
      }
      
      public function get level() : int
      {
         return this.var_1659;
      }
      
      public function get levelMax() : int
      {
         return this.var_2090;
      }
      
      public function get experience() : int
      {
         return this.var_2093;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2095;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2096;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2089;
      }
      
      public function get ownerId() : int
      {
         return this.var_2087;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2105;
      }
      
      public function get age() : int
      {
         return this.var_2088;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1533 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1659 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2090 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2093 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2095 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2096 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2089 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2087 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2105 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_2088 = param1;
      }
   }
}
