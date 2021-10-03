package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1673:int;
      
      private var var_2193:String;
      
      private var var_849:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1673 = param1.readInteger();
         this.var_2193 = param1.readString();
         this.var_849 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1673;
      }
      
      public function get figureString() : String
      {
         return this.var_2193;
      }
      
      public function get gender() : String
      {
         return this.var_849;
      }
   }
}
