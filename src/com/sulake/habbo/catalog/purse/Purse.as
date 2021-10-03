package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_465:int = 0;
       
      
      private var var_2279:int = 0;
      
      private var var_1281:Dictionary;
      
      private var var_1637:int = 0;
      
      private var var_1638:int = 0;
      
      private var var_1951:Boolean = false;
      
      private var var_1954:int = 0;
      
      private var var_1947:int = 0;
      
      public function Purse()
      {
         this.var_1281 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2279;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2279 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1637;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1637 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1638;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1638 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1637 > 0 || this.var_1638 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_1951;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_1951 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_1954;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_1954 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_1947;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_1947 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1281;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1281 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1281[param1];
      }
   }
}
