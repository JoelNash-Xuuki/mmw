module Score
  def build_score(global_options, options, args)                                                                         
   location = global_options[:n]                                                                                        

   sheetName = "#{location}/#{options[:filename]}" 
   patch = "#{location}/#{options[:patch]}"
   service = "#{options[:patch]}"
   title = "#{options[:title]}"
   artist = "#{options[:artist]}"

   puts "#{sheetName}"
   puts "#{service}"
   puts "#{title}"
   puts "#{artist}"
   puts "#{patch}"

   command = "sheetbuilder #{sheetName} #{service} #{title} #{artist} #{patch}"                            
                                                                                                                        
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
    location = global_options[:n]

    lilypondFileName = "#{location}/#{options[:filename]}"

    puts "#{lilypondFileName}"

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
