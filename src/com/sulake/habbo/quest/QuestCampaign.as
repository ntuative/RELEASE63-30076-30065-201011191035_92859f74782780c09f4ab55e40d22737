package com.sulake.habbo.quest
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.quest.enum.QuestStatusEnum;
   import com.sulake.habbo.window.utils.IConfirmDialog;
   import flash.events.Event;
   
   public class QuestCampaign
   {
       
      
      private var _controller:QuestController;
      
      private var _id:String;
      
      private var var_1654:int;
      
      private var var_186:Array;
      
      private var var_503:Quest;
      
      private var var_404:QuestView;
      
      private var _window:IFrameWindow;
      
      private var var_1403:IWindowContainer;
      
      private var var_1165:IWindowContainer;
      
      private var var_173:IItemListWindow;
      
      private var var_185:IFrameWindow;
      
      public function QuestCampaign(param1:QuestController, param2:String, param3:int)
      {
         this.var_186 = [];
         super();
         this._controller = param1;
         this._id = param2;
         this.var_1654 = param3;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_186)
         {
            for each(_loc1_ in this.var_186)
            {
               this.var_173.removeListItem(_loc1_.view);
               _loc1_.dispose();
            }
            this.var_186 = null;
            this.var_173.destroyListItems();
            this.var_173.removeListItems();
         }
         if(this.var_404)
         {
            this.var_404.dispose();
            this.var_404 = null;
         }
         this.var_503 = null;
         this._window.dispose();
         this._window = null;
         this.closeQuestCompleted();
      }
      
      public function isVisible() : Boolean
      {
         return this._window != null && this._window.visible;
      }
      
      public function close() : void
      {
         if(this._window)
         {
            this._window.visible = false;
         }
      }
      
      private function reset() : void
      {
         var _loc1_:* = null;
         if(this.var_186)
         {
            for each(_loc1_ in this.var_186)
            {
               this.var_173.removeListItem(_loc1_.view);
               _loc1_.dispose();
            }
            this.var_186 = null;
            this.var_173.destroyListItems();
            this.var_173.removeListItems();
         }
         this.var_503 = null;
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            this._window.visible = true;
            return;
         }
         this._window = IFrameWindow(this._controller.questEngine.getXmlWindow("QuestEngine"));
         this._window.findChildByTag("close").procedure = this.onWindowClose;
         this._window.center();
         this.var_1403 = this._window.findChildByName("quest.container") as IWindowContainer;
         this.var_1165 = this._window.findChildByName("currency.container") as IWindowContainer;
         this.var_173 = this._window.findChildByName("quests") as IItemListWindow;
         var _loc1_:* = "icon_" + this.id + "_pixeltype";
         var _loc2_:IBitmapWrapperWindow = this.var_1165.findChildByName("currency.icon") as IBitmapWrapperWindow;
         this._controller.questEngine.setImageFromAsset(_loc2_,_loc1_,this.onPreviewImageReady);
         this.var_1165.findChildByName("currency.amount").caption = "${quest_" + this.id + ".currency}";
         var _loc3_:String = "quest_" + this.id;
         var _loc4_:* = _loc3_ + ".title";
         this._window.caption = "${" + _loc4_ + "}";
         this.updatePurse();
      }
      
      public function updatePurse() : void
      {
         var _loc1_:int = this._controller.questEngine.getActivityPointsForType(this.var_1654);
         this._controller.questEngine.localization.registerParameter("quest_" + this.id + ".currency","amount",_loc1_.toString());
      }
      
      private function onPreviewImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(!this._window)
         {
            return;
         }
         if(_loc2_ != null)
         {
            _loc3_ = this.var_1165.findChildByName("currency.icon") as IBitmapWrapperWindow;
            this._controller.questEngine.setImageFromAsset(_loc3_,_loc2_.assetName,this.onPreviewImageReady);
         }
      }
      
      public function get controller() : QuestController
      {
         return this._controller;
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.close();
         }
      }
      
      public function openCampaign(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         this.prepareWindow();
         this.reset();
         param1.sort(this.orderByName,Array.NUMERIC);
         this.var_186 = [];
         for each(_loc2_ in param1)
         {
            this.var_186.push(new Quest(_loc2_,this));
         }
         _loc3_ = null;
         for each(_loc4_ in this.var_186)
         {
            this.var_173.addListItem(_loc4_.view);
            if(!_loc3_ && (_loc4_.status == QuestStatusEnum.const_41 || _loc4_.status == QuestStatusEnum.const_403))
            {
               _loc3_ = _loc4_;
            }
         }
         if(_loc3_)
         {
            this.activateListItem(_loc3_);
            if(this.var_173.maxScrollV > 0)
            {
               this.var_173.scrollV = _loc3_.view.y / this.var_173.maxScrollV;
            }
         }
         else if(this.var_186.length > 0)
         {
            this.activateListItem(this.var_186[0]);
         }
      }
      
      private function orderByName(param1:QuestMessageData, param2:QuestMessageData) : Number
      {
         var _loc3_:String = param1.method_6;
         var _loc4_:String = param2.method_6;
         var _loc5_:uint = param1.sortCode;
         var _loc6_:uint = param2.sortCode;
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc5_ > _loc6_)
         {
            return 1;
         }
         if(_loc5_ < _loc6_)
         {
            return -1;
         }
         return 0;
      }
      
      private function orderByDate(param1:QuestMessageData, param2:QuestMessageData) : Number
      {
         var _loc3_:String = param1.endDateTimeStamp;
         var _loc4_:String = param2.endDateTimeStamp;
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         return 0;
      }
      
      public function get id() : String
      {
         Logger.log("QuestCampaign: return " + this._id + " instead of xmas10.");
         return "xmas10";
      }
      
      public function method_12() : void
      {
         var _loc1_:IItemListWindow = this._window.findChildByName("quests") as IItemListWindow;
         _loc1_.invalidate();
      }
      
      public function activateListItem(param1:Quest) : void
      {
         if(this.var_503 != null)
         {
            this.var_503.selected = false;
         }
         this.var_503 = param1;
         this.var_503.selected = true;
         this.showQuestData(this.var_503);
      }
      
      private function showQuestData(param1:Quest) : void
      {
         this.var_1403.removeChildAt(0);
         if(this.var_404)
         {
            this.var_404.dispose();
            this.var_404 = null;
         }
         this.var_404 = new QuestView(this,param1);
         this.var_1403.addChild(this.var_404.view);
         this.var_404.init();
      }
      
      public function questAccepted(param1:QuestMessageData) : void
      {
         this.modifyQuestData(param1);
      }
      
      public function questCompleted(param1:QuestMessageData) : void
      {
         this.modifyQuestData(param1);
         this.closeQuestCompleted();
         this.var_185 = IFrameWindow(this._controller.questEngine.getXmlWindow("QuestCompletedDialog"));
         this.var_185.findChildByTag("close").procedure = this.onCompletedDialogClose;
         this.var_185.center();
         var _loc2_:IWindow = this.var_185.findChildByName("button.catalog");
         if(_loc2_)
         {
            _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onOpenCatalog);
         }
         var _loc3_:String = "quest_" + this.id;
         var _loc4_:String = _loc3_ + "_" + param1.localizationCode;
         this.var_185.caption = "${quest.completed}";
         this.var_185.findChildByName("description").caption = "${" + _loc4_ + ".completed.desc}";
         this.var_185.findChildByName("reward.description").caption = "${" + _loc3_ + ".completed.reward}";
         this.var_185.findChildByName("reward.currency.desc").caption = "${" + _loc3_ + ".completed.currency}";
         this._controller.questEngine.localization.registerParameter(_loc3_ + ".completed.currency","amount",param1.rewardCurrencyAmount.toString());
         var _loc5_:String = "icon_" + this.id + "_reward_" + param1.rewardCurrencyAmount;
         var _loc6_:IBitmapWrapperWindow = this.var_185.findChildByName("reward.currency.icon") as IBitmapWrapperWindow;
         this._controller.questEngine.setImageFromAsset(_loc6_,_loc5_,this.onQuestCompletedRewardImageReady);
      }
      
      private function onOpenCatalog(param1:Event, param2:IWindow = null) : void
      {
         this.closeQuestCompleted();
         this._controller.questEngine.openCatalog();
      }
      
      private function onQuestCompletedRewardImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(!this.var_185)
         {
            return;
         }
         if(_loc2_ != null)
         {
            _loc3_ = this.var_185.findChildByName("reward.currency.icon") as IBitmapWrapperWindow;
            this._controller.questEngine.setImageFromAsset(_loc3_,_loc2_.assetName,this.onQuestCompletedRewardImageReady);
         }
      }
      
      private function closeQuestCompleted() : void
      {
         if(this.var_185)
         {
            this.var_185.dispose();
            this.var_185 = null;
         }
      }
      
      private function onCompletedDialogClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.closeQuestCompleted();
         }
      }
      
      private function modifyQuestData(param1:QuestMessageData) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc3_:int = 0;
         for each(_loc4_ in this.var_186)
         {
            if(_loc4_.id == param1.id)
            {
               _loc2_ = _loc4_;
               break;
            }
            _loc3_++;
         }
         if(_loc2_)
         {
            _loc5_ = new Quest(param1,this);
            this.var_186[_loc3_] = _loc5_;
            _loc6_ = this.var_173.getListItemIndex(_loc2_.view);
            this.var_173.removeListItem(_loc2_.view);
            if(_loc6_ > -1)
            {
               this.var_173.addListItemAt(_loc5_.view,_loc6_);
            }
            else
            {
               this.var_173.addListItem(_loc5_.view);
            }
            if(this.var_503 == _loc2_)
            {
               this.activateListItem(_loc5_);
            }
            _loc2_.dispose();
            _loc2_ = null;
         }
      }
      
      private function onConfirm(param1:IConfirmDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function find(param1:String) : IWindow
      {
         var _loc2_:* = null;
         if(this._window is IWindowContainer)
         {
            _loc2_ = IWindowContainer(this._window).findChildByName(param1);
         }
         else if(this._window is IItemListWindow)
         {
            _loc2_ = IItemListWindow(this._window).getListItemByName(param1);
         }
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
   }
}
