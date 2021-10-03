package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1546:IID;
      
      private var var_921:Boolean;
      
      private var var_990:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1546 = param1;
         this.var_990 = new Array();
         this.var_921 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1546;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_921;
      }
      
      public function get receivers() : Array
      {
         return this.var_990;
      }
      
      public function dispose() : void
      {
         if(!this.var_921)
         {
            this.var_921 = true;
            this.var_1546 = null;
            while(this.var_990.length > 0)
            {
               this.var_990.pop();
            }
            this.var_990 = null;
         }
      }
   }
}
