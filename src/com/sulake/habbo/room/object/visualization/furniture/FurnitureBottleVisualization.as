package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_809:int = 20;
      
      private static const const_534:int = 9;
      
      private static const ANIMATION_ID_ROLL:int = -1;
       
      
      private var var_256:Array;
      
      private var var_624:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         this.var_256 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_624)
            {
               this.var_624 = true;
               this.var_256 = new Array();
               this.var_256.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_624)
            {
               this.var_624 = false;
               this.var_256 = new Array();
               this.var_256.push(const_809);
               this.var_256.push(const_534 + param1);
               this.var_256.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(0))
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
