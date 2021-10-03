package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1602:int = 1;
      
      public static const const_1627:int = 2;
      
      public static const const_1654:int = 3;
      
      public static const const_1564:int = 4;
      
      public static const const_1390:int = 5;
      
      public static const const_1692:int = 6;
      
      public static const const_1287:int = 7;
      
      public static const const_1379:int = 8;
      
      public static const const_1725:int = 9;
      
      public static const const_1426:int = 10;
      
      public static const const_1330:int = 11;
      
      public static const const_1275:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1516:int;
      
      private var var_2496:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1516 = param1.readInteger();
         this.var_2496 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1516;
      }
      
      public function get info() : String
      {
         return this.var_2496;
      }
   }
}
