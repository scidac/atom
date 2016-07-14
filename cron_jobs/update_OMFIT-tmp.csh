module load atom/dev
module load omfit
cd $OMFIT_ROOT
git pull
git submodule init
git submodule update
python -m compileall src/
chmod -R g+rwX * 
