/*##############################################################################

    HPCC SYSTEMS software Copyright (C) 2012 HPCC Systems.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
############################################################################## */

#option('forceRemoteKeyedLookup', true);
#option('forceRemoteKeyedFetch', true);


myrec := RECORD
 unsigned6 id;
 string50 str;
end;

rhs := DATASET(10000, TRANSFORM(myrec, SELF.id := HASH(COUNTER); SELF.str := (string)SELF.id));

dist := NOFOLD(DISTRIBUTE(NOFOLD(rhs), HASH(id)));

myrecfp := RECORD(myrec)
 unsigned8 filepos{virtual(fileposition)};
END;

distds := DATASET('~distds', myrecfp, FLAT);

idx := INDEX(distds, { id }, { distds }, '~idx.idx');

j := JOIN(dist, idx, LEFT.id=RIGHT.id);
fkj := JOIN(dist, distds, LEFT.id=RIGHT.id, KEYED(idx));

SEQUENTIAL(
// OUTPUT(dist, , '~distds', OVERWRITE);
// BUILDINDEX(idx, OVERWRITE);
 SUM(fkj, id);
);
