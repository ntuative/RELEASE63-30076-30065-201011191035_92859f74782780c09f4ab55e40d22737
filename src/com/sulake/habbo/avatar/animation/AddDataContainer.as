package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var _id:String;
      
      private var var_1709:String;
      
      private var var_930:String;
      
      private var var_1484:String;
      
      private var var_701:Number = 1;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         this._id = String(param1.@id);
         this.var_1709 = String(param1.@align);
         this.var_930 = String(param1.@base);
         this.var_1484 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            this.var_701 = Number(_loc2_);
            if(this.var_701 > 1)
            {
               this.var_701 /= 100;
            }
         }
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get align() : String
      {
         return this.var_1709;
      }
      
      public function get base() : String
      {
         return this.var_930;
      }
      
      public function get ink() : String
      {
         return this.var_1484;
      }
      
      public function get blend() : Number
      {
         return this.var_701;
      }
      
      public function get isBlended() : Boolean
      {
         return this.var_701 != 1;
      }
   }
}
