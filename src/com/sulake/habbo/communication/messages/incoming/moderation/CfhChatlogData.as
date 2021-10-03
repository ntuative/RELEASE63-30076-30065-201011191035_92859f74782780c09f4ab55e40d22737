package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1782:int;
      
      private var var_2494:int;
      
      private var var_1221:int;
      
      private var var_1915:int;
      
      private var var_105:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1782 = param1.readInteger();
         this.var_2494 = param1.readInteger();
         this.var_1221 = param1.readInteger();
         this.var_1915 = param1.readInteger();
         this.var_105 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1782);
      }
      
      public function get callId() : int
      {
         return this.var_1782;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2494;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1221;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_1915;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_105;
      }
   }
}
