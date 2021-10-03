package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_618:String = "";
      
      public static const const_491:int = 0;
      
      public static const const_518:int = 255;
      
      public static const const_716:Boolean = false;
      
      public static const const_448:int = 0;
      
      public static const const_399:int = 0;
      
      public static const const_414:int = 0;
      
      public static const const_963:int = 1;
      
      public static const const_904:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2138:String = "";
      
      private var var_1484:int = 0;
      
      private var var_2225:int = 255;
      
      private var var_2227:Boolean = false;
      
      private var var_2226:int = 0;
      
      private var var_2228:int = 0;
      
      private var var_2229:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2138 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2138;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1484 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1484;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2225 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2225;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2227 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2227;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2226 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2226;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2228 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2228;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2229 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2229;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
