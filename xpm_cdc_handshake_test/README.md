
## Pre-requirements

- Arty A7-35T
- Vivado 2020.2

## Build

```
ruby create_prj.rb
vivado -mode batch -source ./create_prj.tcl
```

## Result

Behavior at SW1 pushed

![result](docs/xpm_synch_behave_test.png)


