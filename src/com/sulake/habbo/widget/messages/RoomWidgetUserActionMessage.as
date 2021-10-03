package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_632:String = "RWUAM_WHISPER_USER";
      
      public static const const_678:String = "RWUAM_IGNORE_USER";
      
      public static const const_704:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_497:String = "RWUAM_KICK_USER";
      
      public static const const_782:String = "RWUAM_BAN_USER";
      
      public static const const_781:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_774:String = "RWUAM_RESPECT_USER";
      
      public static const const_642:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_801:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_596:String = "RWUAM_START_TRADING";
      
      public static const const_646:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_443:String = "RWUAM_KICK_BOT";
      
      public static const const_757:String = "RWUAM_REPORT";
      
      public static const const_415:String = "RWUAM_PICKUP_PET";
      
      public static const const_1479:String = "RWUAM_TRAIN_PET";
      
      public static const const_487:String = " RWUAM_RESPECT_PET";
      
      public static const const_328:String = "RWUAM_REQUEST_PET_UPDATE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
