package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2142:String;
      
      private var var_1543:String;
      
      private var var_2141:String;
      
      private var var_1541:Boolean;
      
      private var var_1542:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2142 = String(param1["set-type"]);
         this.var_1543 = String(param1["flipped-set-type"]);
         this.var_2141 = String(param1["remove-set-type"]);
         this.var_1541 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1542 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1542;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1542 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2142;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1543;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2141;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1541;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1541 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1543 = param1;
      }
   }
}
