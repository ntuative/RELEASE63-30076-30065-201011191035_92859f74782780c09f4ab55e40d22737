package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1308:Boolean = false;
      
      private var var_1653:int;
      
      private var var_1414:Array;
      
      private var var_618:Array;
      
      private var var_617:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1308 = _loc2_.isWrappingEnabled;
         this.var_1653 = _loc2_.wrappingPrice;
         this.var_1414 = _loc2_.stuffTypes;
         this.var_618 = _loc2_.boxTypes;
         this.var_617 = _loc2_.ribbonTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1308;
      }
      
      public function get price() : int
      {
         return this.var_1653;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1414;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_618;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_617;
      }
   }
}
