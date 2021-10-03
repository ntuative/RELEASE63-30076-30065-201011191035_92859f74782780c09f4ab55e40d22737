package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2315:int;
      
      private var var_2310:int;
      
      private var var_2311:int;
      
      private var var_2313:int;
      
      private var var_2314:int;
      
      private var var_2312:int;
      
      private var var_89:Array;
      
      private var var_198:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_89 = new Array();
         this.var_198 = new Array();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2315 = param1.readInteger();
         this.var_2310 = param1.readInteger();
         this.var_2311 = param1.readInteger();
         this.var_2313 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_89.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_198.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2314 = param1.readInteger();
         this.var_2312 = param1.readInteger();
         return true;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2315;
      }
      
      public function get method_14() : int
      {
         return this.var_2310;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2311;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2314;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2312;
      }
      
      public function get categories() : Array
      {
         return this.var_89;
      }
      
      public function get friends() : Array
      {
         return this.var_198;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2313;
      }
   }
}
