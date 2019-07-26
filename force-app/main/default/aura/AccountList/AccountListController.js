({
    doInit: function(component, event, helper) {
        console.log('Inside doInit...');
        // Fetch the account list from the Apex controller
        helper.getAccountList(component);
        helper.getDocumentList(component);
        helper.getCaseBackup(component, '0010b00002C4jhoAAB');
    },
    deleteAccount: function(component, event, helper) {
        // Prevent the form from getting submitted
        event.preventDefault();
        // Get the value from the field that's in the form
        var accountName = event.target.getElementsByClassName('account-name')[0].value;
        confirm('Delete the ' + accountName + ' account? (don’t worry, this won’t actually work!)');
        
    },

    deleteDocument: function(component, event, helper) {
        // Prevent the form from getting submitted
        event.preventDefault();
        // Get the value from the field that's in the form
        var docId = event.target.getElementsByClassName('doc-id')[0].value;
        //confirm('Delete the ' + docId + ' Document? (don’t worry, this won’t actually work!)');
        helper.delDocument(component, docId);
    },

    handleUploadFinished: function (cmp, event) {
        // This will contain the List of File uploaded data and status
        var uploadedFiles = event.getParam("files");
        alert("Files uploaded : " + uploadedFiles.length);
        $A.get('e.force:refreshView').fire();
    }
})