
function UploadMonitor() { }
UploadMonitor._path = '/dwr';

UploadMonitor.getUploadInfo = function(callback) {
    DWREngine._execute(UploadMonitor._path, 'UploadMonitor', 'getUploadInfo', callback);
}
