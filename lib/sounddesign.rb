module SoundDesigner
  def render_sound(global_options,options,args)
    location = global_options[:n]

    patchName = "#{location}/#{options[:patch]}"                                                                                                                         
    csdFile = "#{location}/#{options[:csound]}"                                                                                                                          
    midiChannel = options[:midichn]

    puts "#{patchName}"
    puts "#{csdFile}"
    puts "#{midiChannel}"

    command = "modsyn #{patchName} #{csdFile} #{midiChannel}"
    @output = `#{command}`
    if $?.exitstatus == 0                                                                                             
       puts "Success: Csound file created successfully."                                                         
    else                                                                                                              
      puts "Error: Sound rendering failed."                                                                              
      puts "Details: #{@output}"  # Print the captured error output                                                      
      raise RuntimeError, "Error: Sound rendering failed."                                                            
    end
  end
end
