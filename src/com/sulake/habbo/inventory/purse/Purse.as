package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1637:int = 0;
      
      private var var_1638:int = 0;
      
      private var var_2075:int = 0;
      
      private var var_2076:Boolean = false;
      
      private var var_1951:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1637 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1638 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2075 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2076 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_1951 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1637;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1638;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2075;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2076;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_1951;
      }
   }
}
