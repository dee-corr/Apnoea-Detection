#!/usr/bin/env Rscript

#this function transforms a segment of the time series into a series of frequencies
#and compares the values within that segment to a threshhold

#takes three parameters, the first sample in the segment (the start), the last sample in the 
#segment (the end) and the sample frequency 

library(fftw);
load("workspace1.RData");

args<-commandArgs(TRUE);

#start=args[1];
#end=args[2];
#N=args[3];



checkBin(args[1], args[2], args[3]);

checkBin<-function(start, end, N){
  
  #put data set into a variable (a vector)
  z<-read.csv("Treasa1412Test2.txt", header=FALSE);
  #get the third column of the vector and put in a variable
  inputSignal<-z[3];
  
  test=is.numeric(start);
  cat(test);
  cat(end);
  cat("\n");
  
  as.numeric(start);
  as.numeric(end);
  as.numeric(N);
  
  peak=0;
  gstart=start;
  gend=end;
  wstart=gstart;
  wsize=50;
  wjump=32;
  wend=(gstart+wsize);
  
  cat(wend);
  cat("\n");
  cat(gend);
  cat("\n");
  
  while(wend<=gend){
  
  #get the chosen segment from the vector
  segment<-inputSignal[wstart:wend,];
  #cat(segment);
  #get the mean of the set of values
  meanseg = mean(segment);
  #subtract the mean from the segment (removing the offset)
  segment = segment - meanseg; 
  #get the frequency values using the fft algorithm
  fourierComponents = fft(segment);
  #turn all values to positive values
  fourierCoefficients = abs(fourierComponents);
  #the output for greater than sample frequency/2 is redundant information
  #divide the values by N/2
  normalisedFourierComponents = fourierCoefficients/(N/2);
  #View(normalisedFourierComponents);
  cat(normalisedFourierComponents[2]);
  #put the first 25 values in a variable (only relevant for plotting) 
  #mainCoeffs = normalisedFourierComponents[first:last];
  #plot graph
  #plot(mainCoeffs, typ='l');
  
  #loop through values to check if the values(complex numbers) are above or below the threshold
    i=1;
    while(i<=wsize){
      
      normalisedFourierComponents[i]=round(normalisedFourierComponents[i], digits = 6);
      normalisedFourierComponents[i]=Re(normalisedFourierComponents[i]);
      cat(normalisedFourierComponents[i]);
      #if cannot be evaluated
      if(is.na(normalisedFourierComponents[i])) {cat(" Ignore\n")
      #if the real part of the complex number is greater than the threshhold
      #print "Over" to the console
      } else if ((normalisedFourierComponents[i])>0.06){cat(" Over\n");peak=peak+1;
      #if not, print "Under" to the console
      } else{cat(" Under\n")
      }
      #increment to next value
      i=i+1
    }
    wstart=wstart+wjump;
    wend=wend+wjump;
    cat("next\n")
  }
  cat(peak)
}

save.image("workspace1.RData");
