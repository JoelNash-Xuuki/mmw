module Score
  def build_score(global_options, options, args)                                                                         
   sheetName = options[:filename]                                                                                       
   location = global_options[:n]                                                                                        

   command = "sheetbuilder #{sheetName} xuuki song-title vyvn patches/testPatch-3 test-song"                            
                                                                                                                        
   # Capture both stdout and stderr                                                                                     
   @output = `#{command} 2>&1`                                                                                          
                                                                                                                        
   if $?.exitstatus == 0                                                                                                
     puts "Success: .ly file built"                                                                                     
   else                                                                                                                 
     puts "Error: Score build failed."                                                                                  
     puts "Details: #{@output}"  # Print the captured error output                                                      
     raise RuntimeError, "Error: Score build failed."                                                                   
   end                                                                                                                  
 end  

  def render_score(global_options,options,args)
    lilypondFileName = options[:filename]
    location = global_options[:n]
    puts "#{location}#{lilypondFileName}.ly"
    command = "lilypond -dmidi-extension=mid -o #{location} #{lilypondFileName} > /dev/null 2>&1"
    @output = `#{command}`
    if $?.exitstatus == 0                                                                                             
       puts "Success: Score rendering completed successfully."                                                         
    else                                                                                                              
      puts "Error: Score rendering failed."                                                                              
      puts "Details: #{@output}"  # Print the captured error output                                                      
      raise RuntimeError, "Error: Score rendering failed."                                                            
    end
  end
end
