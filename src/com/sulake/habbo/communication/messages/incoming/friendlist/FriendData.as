package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_849:int;
      
      private var var_632:Boolean;
      
      private var var_1584:Boolean;
      
      private var var_574:String;
      
      private var var_1267:int;
      
      private var var_1585:String;
      
      private var var_1449:String;
      
      private var var_1448:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_849 = param1.readInteger();
         this.var_632 = param1.readBoolean();
         this.var_1584 = param1.readBoolean();
         this.var_574 = param1.readString();
         this.var_1267 = param1.readInteger();
         this.var_1585 = param1.readString();
         this.var_1449 = param1.readString();
         this.var_1448 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_849;
      }
      
      public function get online() : Boolean
      {
         return this.var_632;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1584;
      }
      
      public function get figure() : String
      {
         return this.var_574;
      }
      
      public function get categoryId() : int
      {
         return this.var_1267;
      }
      
      public function get motto() : String
      {
         return this.var_1585;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1449;
      }
      
      public function get realName() : String
      {
         return this.var_1448;
      }
   }
}
