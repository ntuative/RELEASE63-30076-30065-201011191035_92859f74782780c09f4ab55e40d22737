package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_1866:String;
      
      private var var_1865:Class;
      
      private var var_1867:Class;
      
      private var var_1399:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_1866 = param1;
         this.var_1865 = param2;
         this.var_1867 = param3;
         if(rest == null)
         {
            this.var_1399 = new Array();
         }
         else
         {
            this.var_1399 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_1866;
      }
      
      public function get assetClass() : Class
      {
         return this.var_1865;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_1867;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1399;
      }
   }
}
