#this function transforms a segment of the time series into a series of frequencies
#and compares the values within that segment to a threshhold

#takes three parameters, the first sample in the segment (the start), the last sample in the 
#segment (the end) and the sample frequency 
checkBin<-function(f,l,N){
  
  #put data set into a variable (a vector)
  z<-read.csv("~/Treasa1412Test2.txt", header=FALSE);
  #get the third column of the vector and put in a variable
  inputSignal<-z[3];
  #get the chosen segment from the vector
  segment<- inputSignal[f:l,];
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
  cat(normalisedFourierComponents[2]);
  #put the first 25 values in a variable (only relevant for plotting) 
  mainCoeffs = normalisedFourierComponents[1:((l-f)/2)];
  #plot graph
  plot(mainCoeffs, ylim=c(0.000, 0.10));
  
  #loop through values to check if the values(complex numbers) are above or below the threshhold
  while(i<50){
    
    round(x, digits = 0)
    #if cannot be evaluated
    if(is.na(normalizedFourierComponents[i])) {cat("Unknown");cat("\n")
    #if the real part of the complex number is greater than the threshhold
    #print "Over" to the console
    } else if (Re(normalizedFourierComponents[i])>0.02){cat("Over");cat("\n")
    #if not, print "Under" to the console
    } else{cat("Under");cat("\n")
    }
    #increment to next value
    i=i+1;
  }
}

