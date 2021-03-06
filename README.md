## Symlinking Tests

This repo is intended as a testing bed for the ongoing Broccoli speed improvements (mostly focused
on introducing symlinks instead of copying files around). The project has ~5600 files (240MB)
checked in in the `bower_components/` directory to ensure "slowness".

### Current (stefanpenner/ember-cli#master as of aa4e696)

Initial build:

```
Build successful - 9256ms.

Slowest Trees                  | Total
-------------------------------+----------------
CustomStaticCompiler           | 3477ms
TreeMerger (appAndDependencies) | 1449ms
TreeMerger (ExternalTree)      | 1411ms
TreeMerger (stylesAndVendor)   | 1406ms
```

Rebuild:

```
file changed app.js

Build successful - 11168ms.

Slowest Trees                  | Total
-------------------------------+----------------
CustomStaticCompiler           | 3511ms
TreeMerger (ExternalTree)      | 2047ms
TreeMerger (stylesAndVendor)   | 1933ms
TreeMerger (appAndDependencies) | 1899ms
```

### With symlinking (stefanpenner/ember-cli#symlinking as of c364f4ef)

Initial build:

```
Build successful - 530ms.

Slowest Trees                  | Total
-------------------------------+----------------
TreeMerger (vendor)            | 125ms
Concat                         | 108ms
ES3SafeFilter                  | 37ms
ES6Concatenator                | 32ms
```

Rebuild:

```
file changed app.js

Build successful - 346ms.

Slowest Trees                  | Total
-------------------------------+----------------
TreeMerger (vendor)            | 122ms
Concat                         | 33ms
TreeMerger (appAndDependencies) | 20ms
```

### WAT!!!! I WANT!!!

A branch has been setup on ember-cli that you can reference from your project's
`package.json`. Simply use `stefanpenner/ember-cli#symlinking` instead of the specific
version number in your `package.json`.

### Packages needing to be published:

* node-walk-sync
* broccoli-merge-trees
* broccoli-filter
* broccoli-file-mover
* broccoli-file-remover
* broccoli-static-compiler
