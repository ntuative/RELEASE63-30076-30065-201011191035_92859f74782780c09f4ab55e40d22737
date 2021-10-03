package com.sulake.habbo.avatar.geometry
{
   public class Node3D
   {
       
      
      private var var_773:Vector3D;
      
      private var var_1532:Vector3D;
      
      private var var_2121:Boolean = false;
      
      public function Node3D(param1:Number, param2:Number, param3:Number)
      {
         this.var_1532 = new Vector3D();
         super();
         this.var_773 = new Vector3D(param1,param2,param3);
         if(param1 != 0 || param2 != 0 || param3 != 0)
         {
            this.var_2121 = true;
         }
      }
      
      public function get location() : Vector3D
      {
         return this.var_773;
      }
      
      public function get transformedLocation() : Vector3D
      {
         return this.var_1532;
      }
      
      public function applyTransform(param1:Matrix4x4) : void
      {
         if(this.var_2121)
         {
            this.var_1532 = param1.vectorMultiplication(this.var_773);
         }
      }
   }
}
