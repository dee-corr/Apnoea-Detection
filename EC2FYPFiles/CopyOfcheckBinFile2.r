checkBin<-function(f,l,N){ 
z<-read.csv("~/Treasa1412Test2.txt", header=FALSE);
inputSignal<-z[3];
while(f<=241){
bin<- inputSignal[f:l,];
meanbin = mean(bin); 
bin = bin - meanbin; 
fourierComponents = fft(bin);
fourierCoefficients = abs(fourierComponents);
normalizedFourierComponents = fourierCoefficients/(N/2);
mainCoeffs = normalizedFourierComponents[1:10];
i=1;
while(i<10){
cat(normalizedFourierComponents[i])
if(normalizedFourierComponents[i]>0.2){cat("Over")}
else{cat("Under")}
i=i+1}
f=f+20;
l=l+20}
}
