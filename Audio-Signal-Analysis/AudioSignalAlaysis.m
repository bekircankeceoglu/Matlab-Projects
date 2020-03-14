%{
Author: Bekircan Keceoglu
-Soru:1 
-Adım:2
%}

% read audio
[y,Fs] = audioread('sound04.wav');

% label axis properly
F = fftshift(abs(fft(y)));

f = linspace(-Fs/2, Fs/2, numel(y)+1);

f(end) = []; 



% tum tuslari kontrol et
counter = 1;
for m = 0:9 
    [fTemp result f1 f2]= seperateFreq(f,F,m);
    if result == true
        subplot(3,4,counter)
        plot(f, fTemp)
        title(strcat("Number",int2str(m)," freq1:",int2str(f1),"Hz freq2:",int2str(f2),"Hz"))
        xlabel("f(Hz)")
        xlim([0 4000])
        ylabel("Magnitude")
        counter = counter + 1;
    end
end


% Inputs:
% f : frequency
% F : fft response
% button : button no
% Outputs:
% finalF : magnitude
% result : found button flag
% freq1  : f1
% freq2  : f2
function [finalF result freq1 freq2] = seperateFreq(f,F,button)
    finalF = zeros(length(F),1);
    counter = 1;
    result1 = false;
    result2 = false;
    
    freq1 = 0;
    freq2 = 0;
    for index=1:length(F)
        counter = counter + 1;
       % 1
       if button == 0
           if f(counter)> 931 && f(counter) < 951  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              if f(counter) > freq1
                freq1 = f(counter);
              end    
              result1 = true;
           elseif f(counter)> 1326 && f(counter) < 1346  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              result2 = true;
              if f(counter) > freq2
                freq2 = f(counter);
              end  
           else
              finalF(counter,1) = 0;
           end
       elseif button == 1
           if f(counter)> 687 && f(counter) < 707  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              if f(counter) > freq1
                freq1 = f(counter);
              end  
              result1 = true;
           elseif f(counter)> 1199 && f(counter) < 1219  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              if f(counter) > freq2
                freq2 = f(counter);
              end  
              result2 = true;
           else
              finalF(counter,1) = 0;
           end
       elseif button == 2
           if f(counter)> 687 && f(counter) < 707  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              if f(counter) > freq1
                freq1 = f(counter);
              end  
              result1 = true;
           elseif f(counter)> 1326 && f(counter) < 1346  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              if f(counter) > freq2
                freq2 = f(counter);
              end  
              result2 = true;
           else
              finalF(counter,1) = 0;
           end
       elseif button == 3
           if f(counter)> 687 && f(counter) < 707  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              if f(counter) > freq1
                freq1 = f(counter);
              end  
              result1 = true;
           elseif f(counter)> 1467 && f(counter) < 1487  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              if f(counter) > freq2
                freq2 = f(counter);
              end  
              result2 = true;
           else
              finalF(counter,1) = 0;
           end
       elseif button == 4
           if f(counter)> 760 && f(counter) < 780  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              if f(counter) > freq1
                freq1 = f(counter);
              end
              result1 = true;
           elseif f(counter)> 1199 && f(counter) < 1219  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              if f(counter) > freq2
                freq2 = f(counter);
              end
              result2 = true;
           else
              finalF(counter,1) = 0;
           end
       elseif button == 5
           if f(counter)> 760 && f(counter) < 780  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              if f(counter) > freq1
                freq1 = f(counter);
              end
              result1 = true;
           elseif f(counter)> 1326 && f(counter) < 1346  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              if f(counter) > freq2
                freq2 = f(counter);
              end
              result2 = true;
           else
              finalF(counter,1) = 0;
           end
       elseif button == 6
           if f(counter)> 760 && f(counter) < 780  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              if f(counter) > freq1
                freq1 = f(counter);
              end
              result1 = true;
           elseif f(counter)> 1467 && f(counter) < 1487  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              if f(counter) > freq2
                freq2 = f(counter);
              end
              result2 = true;
           else
              finalF(counter,1) = 0;
           end
       elseif button == 7
           if f(counter)> 842 && f(counter) < 862  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              if f(counter) > freq1
                freq1 = f(counter);
              end
              result1 = true;
           elseif f(counter)> 1199 && f(counter) < 1219  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              if f(counter) > freq2
                freq2 = f(counter);
              end
              result2 = true;
           else
              finalF(counter,1) = 0;
           end
       elseif button == 8
           if f(counter)> 842 && f(counter) < 862  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              if f(counter) > freq1
                freq1 = f(counter);
              end
              result1 = true;
           elseif f(counter)> 1326 && f(counter) < 1346  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              if f(counter) > freq2
                freq2 = f(counter);
              end
              result2 = true;
           else
              finalF(counter,1) = 0;
           end
       elseif button == 9
           if f(counter)> 842 && f(counter) < 862  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              if f(counter) > freq1
                freq1 = f(counter);
              end
              result1 = true;
           elseif f(counter)> 1467 && f(counter) < 1487  && (F(counter) > 20)
              finalF(counter,1) = F(counter,1);
              if f(counter) > freq2
                freq2 = f(counter);
              end
              result2 = true;
           else
              finalF(counter,1) = 0;
           end
       end
       
       if counter == length(F)
           result = result1 * result2;
           break;
       end
       result = result1 * result2;
    end
end
