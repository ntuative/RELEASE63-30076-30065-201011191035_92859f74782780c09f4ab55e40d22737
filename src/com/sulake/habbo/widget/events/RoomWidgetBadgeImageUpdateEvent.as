package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_778:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_1964:String;
      
      private var var_2084:BitmapData;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_778,param3,param4);
         this.var_1964 = param1;
         this.var_2084 = param2;
      }
      
      public function get badgeID() : String
      {
         return this.var_1964;
      }
      
      public function get badgeImage() : BitmapData
      {
         return this.var_2084;
      }
   }
}
