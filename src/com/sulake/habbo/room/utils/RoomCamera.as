package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_818:int = 3;
       
      
      private var var_2151:int = -1;
      
      private var var_2152:int = -2;
      
      private var var_299:Vector3d = null;
      
      private var var_356:Vector3d = null;
      
      private var var_2150:Boolean = false;
      
      private var var_2146:Boolean = false;
      
      private var var_2149:Boolean = false;
      
      private var var_2154:Boolean = false;
      
      private var var_2153:int = 0;
      
      private var var_2148:int = 0;
      
      private var var_2145:int = 0;
      
      private var var_2147:int = 0;
      
      private var var_1229:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_356;
      }
      
      public function get targetId() : int
      {
         return this.var_2151;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2152;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2150;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2146;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2149;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2154;
      }
      
      public function get screenWd() : int
      {
         return this.var_2153;
      }
      
      public function get screenHt() : int
      {
         return this.var_2148;
      }
      
      public function get roomWd() : int
      {
         return this.var_2145;
      }
      
      public function get roomHt() : int
      {
         return this.var_2147;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2151 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2152 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2150 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2146 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2149 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2154 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2153 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2148 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2145 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2147 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_299 == null)
         {
            this.var_299 = new Vector3d();
         }
         if(this.var_299.x != param1.x || this.var_299.y != param1.y || this.var_299.z != param1.z)
         {
            this.var_299.assign(param1);
            this.var_1229 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_299 = null;
         this.var_356 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_356 != null)
         {
            return;
         }
         this.var_356 = new Vector3d();
         this.var_356.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_299 != null && this.var_356 != null)
         {
            ++this.var_1229;
            _loc4_ = Vector3d.dif(this.var_299,this.var_356);
            if(_loc4_.length <= param2)
            {
               this.var_356 = this.var_299;
               this.var_299 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_818 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1229 <= const_818)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_356 = Vector3d.sum(this.var_356,_loc4_);
            }
         }
      }
   }
}
