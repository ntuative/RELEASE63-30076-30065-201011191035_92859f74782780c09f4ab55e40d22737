package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_447:int = -2.147483648E9;
      
      private var var_449:int = 2.147483647E9;
      
      private var var_450:int = -2.147483648E9;
      
      private var var_448:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         this._target = param1;
      }
      
      public function get minWidth() : int
      {
         return this.var_447;
      }
      
      public function get maxWidth() : int
      {
         return this.var_449;
      }
      
      public function get minHeight() : int
      {
         return this.var_450;
      }
      
      public function get maxHeight() : int
      {
         return this.var_448;
      }
      
      public function set minWidth(param1:int) : void
      {
         this.var_447 = param1;
         if(this.var_447 > int.MIN_VALUE && !this._target.disposed && this._target.width < this.var_447)
         {
            this._target.width = this.var_447;
         }
      }
      
      public function set maxWidth(param1:int) : void
      {
         this.var_449 = param1;
         if(this.var_449 < int.MAX_VALUE && !this._target.disposed && this._target.width > this.var_449)
         {
            this._target.width = this.var_449;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         this.var_450 = param1;
         if(this.var_450 > int.MIN_VALUE && !this._target.disposed && this._target.height < this.var_450)
         {
            this._target.height = this.var_450;
         }
      }
      
      public function set maxHeight(param1:int) : void
      {
         this.var_448 = param1;
         if(this.var_448 < int.MAX_VALUE && !this._target.disposed && this._target.height > this.var_448)
         {
            this._target.height = this.var_448;
         }
      }
      
      public function get isEmpty() : Boolean
      {
         return this.var_447 == int.MIN_VALUE && this.var_449 == int.MAX_VALUE && this.var_450 == int.MIN_VALUE && this.var_448 == int.MAX_VALUE;
      }
      
      public function setEmpty() : void
      {
         this.var_447 = int.MIN_VALUE;
         this.var_449 = int.MAX_VALUE;
         this.var_450 = int.MIN_VALUE;
         this.var_448 = int.MAX_VALUE;
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_447 = this.var_447;
         _loc2_.var_449 = this.var_449;
         _loc2_.var_450 = this.var_450;
         _loc2_.var_448 = this.var_448;
         return _loc2_;
      }
   }
}
