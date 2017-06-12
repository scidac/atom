module load atom/dev
cd $OMFIT_ROOT
git pull
git submodule init
git submodule update
python -m compileall src/
chmod -R g+rwX * 
omfit build_modules_cache
