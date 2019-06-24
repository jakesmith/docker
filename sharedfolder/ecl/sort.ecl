#option('dumpStacks', true);

import Std.System.Thorlib;
import Std;

recs := 1600;

rec := RECORD
 string10000 f1;
 unsigned4 f2;
 string4000 f3;
END;

ds := DATASET(recs, TRANSFORM(rec, SELF.f1 := (string)COUNTER; SELF.f2 := HASH(COUNTER); SELF.f3 := (string4)COUNTER));

fname := '~dfsstream::testout_';

s1 := SORT(ds, f2);
SEQUENTIAL(
 OUTPUT(s1, , fname, OVERWRITE);
);
