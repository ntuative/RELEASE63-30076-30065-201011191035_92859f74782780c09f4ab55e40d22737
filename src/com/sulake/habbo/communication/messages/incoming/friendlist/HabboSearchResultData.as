package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2331:int;
      
      private var var_1447:String;
      
      private var var_1966:String;
      
      private var var_2333:Boolean;
      
      private var var_2332:Boolean;
      
      private var var_2334:int;
      
      private var var_1967:String;
      
      private var var_2335:String;
      
      private var var_1448:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2331 = param1.readInteger();
         this.var_1447 = param1.readString();
         this.var_1966 = param1.readString();
         this.var_2333 = param1.readBoolean();
         this.var_2332 = param1.readBoolean();
         param1.readString();
         this.var_2334 = param1.readInteger();
         this.var_1967 = param1.readString();
         this.var_2335 = param1.readString();
         this.var_1448 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2331;
      }
      
      public function get avatarName() : String
      {
         return this.var_1447;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1966;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2333;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2332;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2334;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1967;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2335;
      }
      
      public function get realName() : String
      {
         return this.var_1448;
      }
   }
}
