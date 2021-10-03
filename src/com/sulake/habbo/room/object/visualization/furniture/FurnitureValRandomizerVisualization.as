package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_809:int = 20;
      
      private static const const_534:int = 10;
      
      private static const const_1113:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
      
      private static const ANIMATION_ID_OFF:int = 30;
       
      
      private var var_256:Array;
      
      private var var_624:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_256 = new Array();
         super();
         super.setAnimation(ANIMATION_ID_OFF);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_624)
            {
               this.var_624 = true;
               this.var_256 = new Array();
               this.var_256.push(const_1113);
               this.var_256.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_534)
         {
            if(this.var_624)
            {
               this.var_624 = false;
               this.var_256 = new Array();
               if(_direction == 2)
               {
                  this.var_256.push(const_809 + 5 - param1);
                  this.var_256.push(const_534 + 5 - param1);
               }
               else
               {
                  this.var_256.push(const_809 + param1);
                  this.var_256.push(const_534 + param1);
               }
               this.var_256.push(ANIMATION_ID_OFF);
               return;
            }
            super.setAnimation(ANIMATION_ID_OFF);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(11))
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
