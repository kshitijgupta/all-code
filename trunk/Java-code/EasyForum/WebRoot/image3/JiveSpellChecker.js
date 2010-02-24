
function JiveSpellChecker() { }
JiveSpellChecker._path = '/dwr';

JiveSpellChecker.execute = function(callback) {
    DWREngine._execute(JiveSpellChecker._path, 'JiveSpellChecker', 'execute', callback);
}

JiveSpellChecker.getWords = function(callback) {
    DWREngine._execute(JiveSpellChecker._path, 'JiveSpellChecker', 'getWords', callback);
}

JiveSpellChecker.setWords = function(p0, callback) {
    DWREngine._execute(JiveSpellChecker._path, 'JiveSpellChecker', 'setWords', p0, callback);
}

JiveSpellChecker.checkWords = function(p0, callback) {
    DWREngine._execute(JiveSpellChecker._path, 'JiveSpellChecker', 'checkWords', p0, callback);
}
