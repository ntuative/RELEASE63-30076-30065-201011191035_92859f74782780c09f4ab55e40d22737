package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_464:WallRasterizer;
      
      private var var_465:FloorRasterizer;
      
      private var var_688:WallAdRasterizer;
      
      private var var_463:LandscapeRasterizer;
      
      private var var_687:PlaneMaskManager;
      
      private var var_858:Boolean = false;
      
      public function RoomVisualizationData()
      {
         super();
         this.var_464 = new WallRasterizer();
         this.var_465 = new FloorRasterizer();
         this.var_688 = new WallAdRasterizer();
         this.var_463 = new LandscapeRasterizer();
         this.var_687 = new PlaneMaskManager();
      }
      
      public function get initialized() : Boolean
      {
         return this.var_858;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return this.var_465;
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return this.var_464;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return this.var_688;
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return this.var_463;
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return this.var_687;
      }
      
      public function dispose() : void
      {
         if(this.var_464 != null)
         {
            this.var_464.dispose();
            this.var_464 = null;
         }
         if(this.var_465 != null)
         {
            this.var_465.dispose();
            this.var_465 = null;
         }
         if(this.var_688 != null)
         {
            this.var_688.dispose();
            this.var_688 = null;
         }
         if(this.var_463 != null)
         {
            this.var_463.dispose();
            this.var_463 = null;
         }
         if(this.var_687 != null)
         {
            this.var_687.dispose();
            this.var_687 = null;
         }
      }
      
      public function clearCache() : void
      {
         if(this.var_464 != null)
         {
            this.var_464.clearCache();
         }
         if(this.var_465 != null)
         {
            this.var_465.clearCache();
         }
         if(this.var_463 != null)
         {
            this.var_463.clearCache();
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         this.reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            this.var_464.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            this.var_465.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            this.var_688.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            this.var_463.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            this.var_687.initialize(_loc11_);
         }
         return true;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(this.var_858)
         {
            return;
         }
         this.var_464.initializeAssetCollection(param1);
         this.var_465.initializeAssetCollection(param1);
         this.var_688.initializeAssetCollection(param1);
         this.var_463.initializeAssetCollection(param1);
         this.var_687.initializeAssetCollection(param1);
         this.var_858 = true;
      }
      
      protected function reset() : void
      {
      }
   }
}
