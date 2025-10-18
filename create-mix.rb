File.open('mix.eca', 'w') do |file|                                                                                                          
  file.puts <<~EOF                                                                                                                           
    INSCALE=0                                                                                                                                
    NOTINSCALE=-1                                                                                                                            
    A=#{INSCALE}                                                                                                                             
    Bb=#{INSCALE}                                                                                                                            
    B=#{NOTINSCALE}                                                                                                                          
    C=#{INSCALE}                                                                                                                             
    Db=#{NOTINSCALE}                                                                                                                         
    D=#{INSCALE}                                                                                                                             
    Eb=#{INSCALE}                                                                                                                            
    E=#{NOTINSCALE}                                                                                                                          
    F=#{INSCALE}                                                                                                                             
    Gb=#{NOTINSCALE}                                                                                                                         
    G=#{INSCALE}                                                                                                                             
    Ab=#{NOTINSCALE}                                                                                                                         
    CORRECTION_STRENGTH=0.95                                                                                                                 
    ecasound -n "Track" -b:512 -t:27.428 -f:16,2,48000 \\                                                                                    
      -a:vocal -i "processed/vocal.wav" \\                                                                                                   
      -a:vocal \\                                                                                                                            
      -el:autotalent,440.00,12,0,#{A},#{Bb},#{B},#{C},#{Db},#{D},#{Eb},#{E},#{F},#{Gb},#{G},#{Ab},#{CORRECTION_STRENGTH},0,0,0.1,10,0,0,0,0, 
0.99 \\                                                                                                                                      
      -a:bass -i "stems/track-1.wav" -y:3.428 -erc:1,2 -epp:50 -efl:20.08 -eadb:0 \\                                                         
      -a:met -i:null -pn:metronome,140 -ea:0 \\                                                                                              
      -a:vocal,bass -o jack,system                                                                                                           
  EOF                                                                                                                                        
end                                                                                                                                          
                                                                                                                 
