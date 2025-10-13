require 'open3'    

module SoundDesigner
  def render_sound_design_file(global_options,options,args)
    location = global_options[:n]

    patchName = "#{location}/#{options[:patch]}"                                                                                                                         
    csdFile = "#{location}/#{options[:csound]}"                                                                                                                          
    midiChn = options[:midichn]

    puts "#{patchName}"
    puts "#{csdFile}"
    puts "#{midiChn}"

    command = "modsyn #{patchName} #{csdFile} #{midiChn}"
    @output = `#{command}`
    if $?.exitstatus == 0                                                                                             
       puts "Success: Csound file created successfully."                                                         
    else                                                                                                              
      puts "Error: Sound rendering failed."                                                                              
      puts "Details: #{@output}"  # Print the captured error output                                                      
      raise RuntimeError, "Error: Sound rendering failed."                                                            
    end
  end

  def render_sound_audio_file(global_options, options, args)                                                                                                               
   location = global_options[:n]                                                                                                                                          
   midiChn = options[:midichn]                                                                                                                                            
   csdFile = "#{location}/#{options[:csound]}"                                                                                                                            
                                                                                                                                                                      
   puts "#{csdFile}"                                                                                                                                                      
   puts "#{midiChn}"                                                                                                                                                      
                                                                                                                                                                          
   command = "csound -d -o #{location}/stems/track-#{midiChn}.wav #{csdFile}"                                                                                                          
   stdout, stderr, status = Open3.capture3(command)                                                                                                                       
                                                                                                                                                                          
   if status.success?                                                                                                                                                     
     puts "Success: Audio file created successfully."                                                                                                                     
   else                                                                                                                                                                   
     puts "Error: Audio file creation failed."                                                                                                                            
     puts "Details: #{stderr}"  # Print the captured error output                                                                                                         
     raise RuntimeError, "Error: Sound rendering failed."                                                                                                                 
   end                                                                                                                                                                    
                                                                                                                                                                          
   # Optionally, you can limit the output by processing `stdout` and `stderr`                                                                                             
   # For example, to print only the first 10 lines of the output:                                                                                                         
   puts stdout.lines.first(10).join                                                                                                                                       
   puts stderr.lines.first(10).join                                                                                                                                       
 end
end
