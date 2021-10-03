package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_81:String = "i";
      
      public static const const_87:String = "s";
      
      public static const const_241:String = "e";
       
      
      private var var_1661:String;
      
      private var var_2066:int;
      
      private var var_1298:String;
      
      private var var_1297:int;
      
      private var var_1662:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1661 = param1.readString();
         this.var_2066 = param1.readInteger();
         this.var_1298 = param1.readString();
         this.var_1297 = param1.readInteger();
         this.var_1662 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1661;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2066;
      }
      
      public function get extraParam() : String
      {
         return this.var_1298;
      }
      
      public function get productCount() : int
      {
         return this.var_1297;
      }
      
      public function get expiration() : int
      {
         return this.var_1662;
      }
   }
}
