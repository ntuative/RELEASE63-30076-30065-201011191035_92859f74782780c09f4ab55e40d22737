package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoucherRedeemOkMessageParser implements IMessageParser
   {
       
      
      private var var_771:String = "";
      
      private var var_957:String = "";
      
      public function VoucherRedeemOkMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_957 = "";
         this.var_771 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_957 = param1.readString();
         this.var_771 = param1.readString();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_771;
      }
      
      public function get productDescription() : String
      {
         return this.var_957;
      }
   }
}
