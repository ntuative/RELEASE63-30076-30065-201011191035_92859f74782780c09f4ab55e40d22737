package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1968:int;
      
      private var var_2476:int;
      
      private var var_2477:String;
      
      private var var_2478:String;
      
      private var var_2475:int = 0;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this.var_1968 = param1;
         this.var_2476 = param2;
         this.var_2477 = param3;
         this.var_2478 = param4;
      }
      
      public function get id() : int
      {
         return this.var_1968;
      }
      
      public function get length() : int
      {
         return this.var_2476;
      }
      
      public function get name() : String
      {
         return this.var_2477;
      }
      
      public function get creator() : String
      {
         return this.var_2478;
      }
      
      public function get startPlayHeadPos() : int
      {
         return this.var_2475;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         this.var_2475 = param1;
      }
   }
}
