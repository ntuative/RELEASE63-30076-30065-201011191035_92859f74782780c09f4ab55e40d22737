package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const ANIMATION_ID_ROLL:int = 3;
      
      private static const const_1154:int = 2;
      
      private static const const_1155:int = 1;
      
      private static const ANIMATION_DURATION:int = 15;
       
      
      private var var_256:Array;
      
      private var var_1004:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_256 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1154)
         {
            this.var_256 = new Array();
            this.var_256.push(const_1155);
            this.var_1004 = ANIMATION_DURATION;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(this.var_1004 > 0)
         {
            --this.var_1004;
         }
         if(this.var_1004 == 0)
         {
            if(this.var_256.length > 0)
            {
               super.setAnimation(this.var_256.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
