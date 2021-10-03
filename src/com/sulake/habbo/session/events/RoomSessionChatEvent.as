package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionChatEvent extends RoomSessionEvent
   {
      
      public static const const_168:String = "RSCE_CHAT_EVENT";
      
      public static const const_407:String = "RSCE_FLOOD_EVENT";
      
      public static const const_140:int = 0;
      
      public static const const_128:int = 1;
      
      public static const const_105:int = 2;
      
      public static const const_278:int = 3;
      
      public static const const_284:int = 4;
       
      
      private var _userId:int = 0;
      
      private var _text:String = "";
      
      private var var_1169:int = 0;
      
      private var var_1217:Array;
      
      public function RoomSessionChatEvent(param1:String, param2:IRoomSession, param3:int, param4:String, param5:int = 0, param6:Array = null, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param2,param7,param8);
         this._userId = param3;
         this._text = param4;
         this.var_1169 = param5;
         this.var_1217 = param6;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function get chatType() : int
      {
         return this.var_1169;
      }
      
      public function get links() : Array
      {
         return this.var_1217;
      }
   }
}
