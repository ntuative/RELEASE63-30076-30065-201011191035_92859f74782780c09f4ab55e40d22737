package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_627:TileHeightMap = null;
      
      private var var_936:LegacyWallGeometry = null;
      
      private var var_937:RoomCamera = null;
      
      private var var_628:SelectedRoomObjectData = null;
      
      private var var_629:SelectedRoomObjectData = null;
      
      private var var_1942:String = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_936 = new LegacyWallGeometry();
         this.var_937 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_627;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_627 != null)
         {
            this.var_627.dispose();
         }
         this.var_627 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_936;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_937;
      }
      
      public function get worldType() : String
      {
         return this.var_1942;
      }
      
      public function set worldType(param1:String) : void
      {
         this.var_1942 = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_628;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_628 != null)
         {
            this.var_628.dispose();
         }
         this.var_628 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_629;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_629 != null)
         {
            this.var_629.dispose();
         }
         this.var_629 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_627 != null)
         {
            this.var_627.dispose();
            this.var_627 = null;
         }
         if(this.var_936 != null)
         {
            this.var_936.dispose();
            this.var_936 = null;
         }
         if(this.var_937 != null)
         {
            this.var_937.dispose();
            this.var_937 = null;
         }
         if(this.var_628 != null)
         {
            this.var_628.dispose();
            this.var_628 = null;
         }
         if(this.var_629 != null)
         {
            this.var_629.dispose();
            this.var_629 = null;
         }
      }
   }
}
