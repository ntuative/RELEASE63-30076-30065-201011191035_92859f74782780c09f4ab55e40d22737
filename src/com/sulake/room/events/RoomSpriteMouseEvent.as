package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1634:String = "";
      
      private var var_1940:String = "";
      
      private var var_1941:String = "";
      
      private var var_1936:Number = 0;
      
      private var var_1938:Number = 0;
      
      private var var_1937:Number = 0;
      
      private var var_1939:Number = 0;
      
      private var var_1894:Boolean = false;
      
      private var var_1891:Boolean = false;
      
      private var var_1893:Boolean = false;
      
      private var var_1892:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1634 = param2;
         this.var_1940 = param3;
         this.var_1941 = param4;
         this.var_1936 = param5;
         this.var_1938 = param6;
         this.var_1937 = param7;
         this.var_1939 = param8;
         this.var_1894 = param9;
         this.var_1891 = param10;
         this.var_1893 = param11;
         this.var_1892 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1634;
      }
      
      public function get canvasId() : String
      {
         return this.var_1940;
      }
      
      public function get spriteTag() : String
      {
         return this.var_1941;
      }
      
      public function get screenX() : Number
      {
         return this.var_1936;
      }
      
      public function get screenY() : Number
      {
         return this.var_1938;
      }
      
      public function get localX() : Number
      {
         return this.var_1937;
      }
      
      public function get localY() : Number
      {
         return this.var_1939;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_1894;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_1891;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_1893;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_1892;
      }
   }
}
