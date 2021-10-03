package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2038:Number;
      
      private var var_2039:Number;
      
      private var var_774:Number;
      
      private var var_773:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2038 = param1;
         this.var_2039 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_774 = param1;
         this.var_773 = 0;
      }
      
      public function update() : void
      {
         this.var_774 += this.var_2039;
         this.var_773 += this.var_774;
         if(this.var_773 > 0)
         {
            this.var_773 = 0;
            this.var_774 = this.var_2038 * -1 * this.var_774;
         }
      }
      
      public function get location() : Number
      {
         return this.var_773;
      }
   }
}
