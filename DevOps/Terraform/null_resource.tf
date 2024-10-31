# what is null_resource
# ---------------------
# it's do nothing

# You can use null_resource to execute local commands or scripts (via local-exec provisioners).

#   1.  Execute Commands
#   2.  Run Shell Scripts
#   3.  Run Ansible Playbook      
#   4.  Run Python Program

resource "null_resource" "run_all" {
    provisioner "local-exec" {
        command = "echo 'Executing commands, scripts, and more!'"
    }
    
    triggers = {
        always_run = timestamp()
    }
}

resource "null_resource" "run_shell_script" {
    provisioner "local-exec" {
        command = "bash ${path.module}/scripts/my-script.sh"
    }
    
    triggers = {
        always_run = timestamp()
    }
}

resource "null_resource" "run_ansible_playbook" {
    provisioner "local-exec" {
        command = "ansible-playbook -i inventory_file playbook.yml"
    }
    
    triggers = {
        always_run = timestamp()
    }
}

resource "null_resource" "run_python_program" {
    provisioner "local-exec" {
        command = "python3 ${path.module}/scripts/my_program.py"
    }
    
    triggers = {
        always_run = timestamp()
    }
}


resource "null_resource" "remote_exec_python" {
    provisioner "remote-exec" {
        connection {
            type     = "ssh"
            user     = "ubuntu"
            host     = aws_instance.example.public_ip
            private_key = file("~/.ssh/my-key.pem")
        }

        inline = [
            "python3 /home/ubuntu/scripts/my_program.py"
        ]
    }
    depends_on = [aws_instance.example]
}