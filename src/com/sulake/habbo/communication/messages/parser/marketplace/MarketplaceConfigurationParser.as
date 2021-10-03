package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1308:Boolean;
      
      private var var_1898:int;
      
      private var var_1587:int;
      
      private var var_1586:int;
      
      private var var_1896:int;
      
      private var var_1897:int;
      
      private var var_1895:int;
      
      private var var_1899:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1308;
      }
      
      public function get commission() : int
      {
         return this.var_1898;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1587;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1586;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_1897;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_1896;
      }
      
      public function get expirationHours() : int
      {
         return this.var_1895;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_1899;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1308 = param1.readBoolean();
         this.var_1898 = param1.readInteger();
         this.var_1587 = param1.readInteger();
         this.var_1586 = param1.readInteger();
         this.var_1897 = param1.readInteger();
         this.var_1896 = param1.readInteger();
         this.var_1895 = param1.readInteger();
         this.var_1899 = param1.readInteger();
         return true;
      }
   }
}
