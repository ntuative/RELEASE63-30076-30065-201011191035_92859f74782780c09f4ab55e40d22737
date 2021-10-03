package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1533:int;
      
      private var var_2143:String;
      
      private var var_1659:int;
      
      private var var_574:String;
      
      private var var_1212:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1533 = param1.readInteger();
         this.var_2143 = param1.readString();
         this.var_1659 = param1.readInteger();
         this.var_574 = param1.readString();
         this.var_1212 = param1.readInteger();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1533;
      }
      
      public function get petName() : String
      {
         return this.var_2143;
      }
      
      public function get level() : int
      {
         return this.var_1659;
      }
      
      public function get figure() : String
      {
         return this.var_574;
      }
      
      public function get petType() : int
      {
         return this.var_1212;
      }
   }
}
