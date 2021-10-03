package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_1051:String = "select_outfit";
       
      
      private var var_2435:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_1051);
         this.var_2435 = param1;
      }
      
      public function get outfitId() : int
      {
         return this.var_2435;
      }
   }
}
