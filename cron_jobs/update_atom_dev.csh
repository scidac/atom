date
echo '     Setting up the environment'
module load atom/dev
echo 'Done setting up the environment'
cd $ATOM_ROOT
make all ATOM_PLATFORM=$ATOM_PLATFORM ATOM_VERSION=dev
echo 'Done with ATOM make'
