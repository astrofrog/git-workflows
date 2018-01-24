### About

The purpose of the scripts here were to split out the Astropy sphinx theme from
the astropy core and astropy-helpers repository. The complication is that
the theme was first developed in the core astropy package then moved to
astropy-helpers but the history was not preserved in the move.

Here the scripts recover the original history from the core repo then attach
it to the extracted history from astropy-helpers.

To reproduce the git workflow, run the following scripts in this directory::

    ./1.run_astropy.sh
    ./2.run_helpers.sh
    ./3.join_branches.sh

Note that the first script will require several hours to run, so be patient!
