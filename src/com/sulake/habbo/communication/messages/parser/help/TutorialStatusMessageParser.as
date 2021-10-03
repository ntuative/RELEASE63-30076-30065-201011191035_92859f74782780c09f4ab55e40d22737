package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1326:Boolean;
      
      private var var_1084:Boolean;
      
      private var var_1325:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1326;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1084;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1325;
      }
      
      public function flush() : Boolean
      {
         this.var_1326 = false;
         this.var_1084 = false;
         this.var_1325 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1326 = param1.readBoolean();
         this.var_1084 = param1.readBoolean();
         this.var_1325 = param1.readBoolean();
         return true;
      }
   }
}
