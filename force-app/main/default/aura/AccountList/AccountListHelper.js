({
    // Fetch the accounts from the Apex controller
    getAccountList: function(component) {
        var action = component.get('c.getAccounts');
        // Set up the callback
        var self = this;
        action.setCallback(this, function(actionResult) {
            component.set('v.accounts', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
    },

    // Fetch the accounts from the Apex controller
    getDocumentList: function(component) {
        var action = component.get('c.getContentDocumentLink');
        console.log('Inside getDocumentList()...');
        // Set up the callback
        var self = this;
        action.setCallback(this, function(actionResult) {
            console.log('actionResult.getReturnValue():-->' + actionResult.getReturnValue());
            component.set('v.documents', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
    },

    // Fetch the accounts from the Apex controller
    delDocument: function(component, docId) {
        var action = component.get('c.delContentDocumentLink');
        action.setParams({"docId":docId});
        console.log('Inside delDocument()...');
        // Set up the callback
        var self = this;
        action.setCallback(this, function(actionResult) {
            console.log('actionResult.getReturnValue():-->' + actionResult.getReturnValue());
            alert('Result:-->' + actionResult.getReturnValue());
            $A.get('e.force:refreshView').fire();
            //component.set('v.documents', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
    // Fetch the accounts from the Apex controller
    getCaseBackup: function(component, accountId) {
        console.log('accountId:-->' + accountId);
        var action = component.get('c.getCaseBackup');
        action.setParams({"accountId" : accountId});
        console.log('Inside getCaseBackup()...');
        // Set up the callback
        var self = this;
        action.setCallback(this, function(actionResult) {
            console.log('getCaseBackup actionResult.getReturnValue():-->' + JSON.stringify(actionResult.getReturnValue()));
            alert('Result getCaseBackup:-->' + JSON.stringify(actionResult.getReturnValue()));
            //$A.get('e.force:refreshView').fire();
            component.set('v.caseBackups', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})