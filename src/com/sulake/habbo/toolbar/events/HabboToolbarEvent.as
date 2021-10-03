package com.sulake.habbo.toolbar.events
{
   import flash.events.Event;
   
   public class HabboToolbarEvent extends Event
   {
      
      public static const const_71:String = "HTE_INITIALIZED";
      
      public static const const_39:String = "HTE_TOOLBAR_CLICK";
      
      public static const TOOLBAR_ORIENTATION:String = "HTE_TOOLBAR_ORIENTATION";
       
      
      private var var_660:String;
      
      private var var_473:String;
      
      private var var_1247:String;
      
      public function HabboToolbarEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set iconId(param1:String) : void
      {
         this.var_660 = param1;
      }
      
      public function get iconId() : String
      {
         return this.var_660;
      }
      
      public function set orientation(param1:String) : void
      {
         this.var_473 = param1;
      }
      
      public function get orientation() : String
      {
         return this.var_473;
      }
      
      public function set iconName(param1:String) : void
      {
         this.var_1247 = param1;
      }
      
      public function get iconName() : String
      {
         return this.var_1247;
      }
   }
}
