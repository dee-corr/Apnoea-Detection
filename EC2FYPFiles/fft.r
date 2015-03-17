#library(fftw);
#load the workspace
load("~/workspace.RData");

#put the command line arguments into a vector
args<-commandArgs(TRUE);

checkSegments(args[1], args[2], args[3], args[4], args[5], args[6]);
