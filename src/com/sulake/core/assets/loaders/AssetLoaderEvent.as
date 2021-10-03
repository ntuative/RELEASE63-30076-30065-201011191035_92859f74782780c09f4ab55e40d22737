package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_30:String = "AssetLoaderEventComplete";
      
      public static const const_928:String = "AssetLoaderEventProgress";
      
      public static const const_948:String = "AssetLoaderEventUnload";
      
      public static const const_1086:String = "AssetLoaderEventStatus";
      
      public static const const_44:String = "AssetLoaderEventError";
      
      public static const const_1067:String = "AssetLoaderEventOpen";
       
      
      private var var_337:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         this.var_337 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return this.var_337;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,this.var_337);
      }
   }
}
