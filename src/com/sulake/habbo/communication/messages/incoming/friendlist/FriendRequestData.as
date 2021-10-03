package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_965:int;
      
      private var var_2240:String;
      
      private var var_2239:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_965 = param1.readInteger();
         this.var_2240 = param1.readString();
         this.var_2239 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_965;
      }
      
      public function get requesterName() : String
      {
         return this.var_2240;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2239;
      }
   }
}
