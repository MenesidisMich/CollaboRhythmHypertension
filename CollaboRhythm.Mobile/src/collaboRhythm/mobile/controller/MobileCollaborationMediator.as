/**
 * Copyright 2011 John Moore, Scott Gilroy
 *
 * This file is part of CollaboRhythm.
 *
 * CollaboRhythm is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
 *
 * CollaboRhythm is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with CollaboRhythm.  If not, see <http://www.gnu.org/licenses/>.
*/
package collaboRhythm.mobile.controller
{
import collaboRhythm.core.controller.ApplicationControllerBase;
import collaboRhythm.core.controller.CollaborationMediatorBase;
import collaboRhythm.plugins.problems.controller.ProblemsAppController;
import collaboRhythm.shared.controller.apps.WorkstationAppControllerBase;
import collaboRhythm.shared.model.User;

public class MobileCollaborationMediator extends CollaborationMediatorBase
	{
		private var _mobileApplicationController:MobileApplicationController;
	
		protected override function get applicationController():ApplicationControllerBase
		{
			return _mobileApplicationController;
		}
		
		public function MobileCollaborationMediator(mobileApplicationController:MobileApplicationController)
		{
			_mobileApplicationController = mobileApplicationController;
			super();
		}
		
		protected override function prepareForPatientMode():void
		{
		}
		
		protected override function openValidatedUser(user:User):void
		{
			_appControllersMediator.initializeForUser(user);
			var app:WorkstationAppControllerBase;
			_appControllersMediator.createDynamicApps();
//			app = _appControllersMediator.createApp(BloodPressureAppController, "Blood Pressure");
			app = _appControllersMediator.createApp(ProblemsAppController, "Problems");
			
			_mobileApplicationController.initializeActiveView();
		}
	}
}