package com.sulake.habbo.widget.messages
{
   public class RoomWidgetEcotronBoxOpenedMessage extends RoomWidgetMessage
   {
      
      public static const const_1443:String = "RWEBOM_ECOTRONBOX_OPENED";
       
      
      private var var_1208:String;
      
      private var var_1434:int;
      
      public function RoomWidgetEcotronBoxOpenedMessage(param1:String, param2:String, param3:int)
      {
         super(param1);
         this.var_1208 = param2;
         this.var_1434 = param3;
      }
      
      public function get itemType() : String
      {
         return this.var_1208;
      }
      
      public function get classId() : int
      {
         return this.var_1434;
      }
   }
}
