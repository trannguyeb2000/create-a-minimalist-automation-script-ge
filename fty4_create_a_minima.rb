# Define a class to generate automation scripts
class AutomationScriptGenerator
  # Initialize with a script name and a list of tasks
  def initialize(script_name, tasks)
    @script_name = script_name
    @tasks = tasks
  end

  # Generate the automation script
  def generate_script
    script = "# #{@script_name}\n\n"
    @tasks.each do |task|
      script << "## #{task[:description]}\n"
      script << "#{task[:command]}\n\n"
    end
    script
  end
end

# Define a notebook to store tasks
class Notebook
  def initialize
    @tasks = []
  end

  # Add a task to the notebook
  def add_task(description, command)
    @tasks << { description: description, command: command }
  end

  # Generate an automation script from the tasks
  def generate_script(script_name)
    AutomationScriptGenerator.new(script_name, @tasks).generate_script
  end
end

# Create a new notebook
notebook = Notebook.new

# Add tasks to the notebook
notebook.add_task("Backup database", "mysqldump -u root -p password database_name > backup.sql")
notebook.add_task("Compress files", "tar -czf files.tar.gz /path/to/files")
notebook.add_task("Send notification", "echo 'Script completed!' | mail -s 'Automation Script' user@example.com")

# Generate the automation script
script = notebook.generate_script("my_automation_script")

# Output the generated script
puts script