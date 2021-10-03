package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_694:int = 1;
      
      public static const const_561:int = 2;
      
      public static const const_608:int = 3;
      
      public static const const_1069:int = 4;
      
      public static const const_754:int = 5;
      
      public static const const_1073:int = 6;
       
      
      private var _type:int;
      
      private var var_927:int;
      
      private var var_2219:String;
      
      private var var_2504:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_927 = param2;
         this.var_2219 = param3;
         this.var_2504 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2219;
      }
      
      public function get time() : String
      {
         return this.var_2504;
      }
      
      public function get senderId() : int
      {
         return this.var_927;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
