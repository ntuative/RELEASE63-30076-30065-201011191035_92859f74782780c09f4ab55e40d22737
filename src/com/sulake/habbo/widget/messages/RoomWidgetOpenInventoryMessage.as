package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_670:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1004:String = "inventory_effects";
      
      public static const const_883:String = "inventory_badges";
      
      public static const const_1446:String = "inventory_clothes";
      
      public static const const_1292:String = "inventory_furniture";
       
      
      private var var_2414:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_670);
         this.var_2414 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2414;
      }
   }
}
