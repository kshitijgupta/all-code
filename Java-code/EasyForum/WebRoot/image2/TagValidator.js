
function TagValidator() { }
TagValidator._path = '/dwr';

TagValidator.isValid = function(p0, callback) {
    DWREngine._execute(TagValidator._path, 'TagValidator', 'isValid', p0, callback);
}
