package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_1883:int;
      
      private var var_1884:int;
      
      private var var_632:Boolean;
      
      private var var_1879:int;
      
      private var var_1881:int;
      
      private var var_1882:int;
      
      private var var_1880:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_1883 = param1.readInteger();
         this.var_1884 = param1.readInteger();
         this.var_632 = param1.readBoolean();
         this.var_1879 = param1.readInteger();
         this.var_1881 = param1.readInteger();
         this.var_1882 = param1.readInteger();
         this.var_1880 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_1883;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_1884;
      }
      
      public function get online() : Boolean
      {
         return this.var_632;
      }
      
      public function get cfhCount() : int
      {
         return this.var_1879;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_1881;
      }
      
      public function get cautionCount() : int
      {
         return this.var_1882;
      }
      
      public function get banCount() : int
      {
         return this.var_1880;
      }
   }
}
