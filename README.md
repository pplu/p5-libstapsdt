These are the notes for getting this lib running

```
sudo apt-get install libelf1 libelf-dev
git clone https://github.com/sthima/libstapsdt.git
cd libstapsdt/
make
cd ..
git clone git@github.com:pplu/p5-libstapsdt.git
cd p5-libstapsdt
carton
LD_LIBRARY_PATH=../libstapsdt/out carton exec perl ./test.pl
```

