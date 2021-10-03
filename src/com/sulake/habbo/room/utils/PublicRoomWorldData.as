package com.sulake.habbo.room.utils
{
   public class PublicRoomWorldData
   {
       
      
      private var var_1942:String = "";
      
      private var var_2168:Number = 1.0;
      
      private var _scale:Number = 1.0;
      
      public function PublicRoomWorldData(param1:String, param2:Number, param3:Number)
      {
         super();
         this.var_1942 = param1;
         this._scale = param2;
         this.var_2168 = param3;
      }
      
      public function get heightScale() : Number
      {
         return this.var_2168;
      }
      
      public function get scale() : Number
      {
         return this._scale;
      }
   }
}
