
function Draft() { }
Draft._path = '/dwr';

Draft.getDraft = function(p0, p1, p2, callback) {
    DWREngine._execute(Draft._path, 'Draft', 'getDraft', p0, p1, p2, false, callback);
}

Draft.deleteDraft = function(p0, p1, p2, callback) {
    DWREngine._execute(Draft._path, 'Draft', 'deleteDraft', p0, p1, p2, false, callback);
}

Draft.saveDraft = function(p0, callback) {
    DWREngine._execute(Draft._path, 'Draft', 'saveDraft', p0, false, callback);
}
