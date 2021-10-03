package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_601:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_882:String = "RWOCM_CLUB_MAIN";
       
      
      private var var_2546:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_601);
         this.var_2546 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2546;
      }
   }
}
