/*
 * FlexMonkey 1.0, Copyright 2008, 2009, 2010 by Gorilla Logic, Inc.
 * FlexMonkey 1.0 is distributed under the GNU General Public License, v2.
 */
package com.gorillalogic.flexmonkey.controllers.helpers {

    import com.gorillajawn.gate.GateCommand;
    import com.gorillajawn.gate.SerialGate;
    import com.gorillalogic.flexmonkey.controllers.helpers.cmds.OpenProjectCommand;
    import com.gorillalogic.flexmonkey.controllers.helpers.cmds.OpenSuitesCommand;
    import com.gorillalogic.flexmonkey.controllers.helpers.cmds.ParseSuiteDataCommand;
    import com.gorillalogic.flexmonkey.controllers.helpers.cmds.SaveNewMonkeySuiteCommand;
    import com.gorillalogic.flexmonkey.controllers.helpers.cmds.SavePreferencesCommand;
    import com.gorillalogic.flexmonkey.controllers.helpers.cmds.SaveProjectCommand;
    import com.gorillalogic.flexmonkey.events.ApplicationEvent;
    import com.gorillalogic.flexmonkey.events.ProjectFilesEvent;
    import com.gorillalogic.flexmonkey.model.ApplicationModel;
    import com.gorillalogic.framework.FMHub;

    public class NewProjectGate extends SerialGate {

        public function NewProjectGate() {
            this.successHandler = newProjectSuccessHandler;
            this.faultHandler = newProjectFault;
        }

        override protected function register():void {
            this.commands = [];
            this.commands.push(new SavePreferencesCommand());
            this.commands.push(new SaveProjectCommand());
            this.commands.push(new SaveNewMonkeySuiteCommand());
            this.commands.push(new OpenProjectCommand());
            this.commands.push(new OpenSuitesCommand());
            this.commands.push(new ParseSuiteDataCommand());
        }

        private function newProjectSuccessHandler():void {
            ApplicationModel.instance.isNewProject = false;
			FMHub.instance.dispatchEvent(new ProjectFilesEvent(ProjectFilesEvent.TEST_PROJECT_FILE_OPENED));
			FMHub.instance.dispatchEvent(new ApplicationEvent(ApplicationEvent.UPDATE_SUMMARY));
        }

        private function newProjectFault(cmd:GateCommand, msg:String):void {
            FMHub.instance.dispatchEvent(new ProjectFilesEvent(ProjectFilesEvent.FAILED_TO_OPEN_PROJECT, msg));
        }
    }

}
