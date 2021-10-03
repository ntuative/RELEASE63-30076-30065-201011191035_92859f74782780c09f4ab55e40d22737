package com.sulake.habbo.avatar
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class AvatarImageBodyPartContainer
   {
       
      
      private var var_39:BitmapData;
      
      private var var_505:Point;
      
      private var _offset:Point;
      
      public function AvatarImageBodyPartContainer(param1:BitmapData, param2:Point)
      {
         this._offset = new Point(0,0);
         super();
         this.var_39 = param1;
         this.var_505 = param2;
         this.cleanPoints();
      }
      
      public function dispose() : void
      {
         if(this.var_39)
         {
            this.var_39.dispose();
         }
         this.var_39 = null;
         this.var_505 = null;
         this._offset = null;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_39 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_39;
      }
      
      public function setRegPoint(param1:Point) : void
      {
         this.var_505 = param1;
         this.cleanPoints();
      }
      
      public function get regPoint() : Point
      {
         return this.var_505.add(this._offset);
      }
      
      public function set offset(param1:Point) : void
      {
         this._offset = param1;
         this.cleanPoints();
      }
      
      private function cleanPoints() : void
      {
         this.var_505.x = int(this.var_505.x);
         this.var_505.y = int(this.var_505.y);
         this._offset.x = int(this._offset.x);
         this._offset.y = int(this._offset.y);
      }
   }
}
