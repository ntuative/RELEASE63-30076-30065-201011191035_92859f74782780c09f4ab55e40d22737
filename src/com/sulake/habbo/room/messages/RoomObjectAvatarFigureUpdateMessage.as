package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_574:String;
      
      private var var_2091:String;
      
      private var var_849:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_574 = param1;
         this.var_849 = param2;
         this.var_2091 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_574;
      }
      
      public function get race() : String
      {
         return this.var_2091;
      }
      
      public function get gender() : String
      {
         return this.var_849;
      }
   }
}
