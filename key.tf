resource "tls_private_key" "example" {                                     
  algorithm = "RSA"                                                        
  rsa_bits  = "4096"                                                       
}                                                                          
                                                                           
resource "aws_key_pair" "mykeypair" {                                      
  key_name   = "mykey"                                                     
  public_key = tls_private_key.example.public_key_openssh                  
}                                                                          
                                                                           
resource "local_file" "local_ssh_private_key" {                            
  content         = tls_private_key.example.private_key_pem                
  filename        = "mykey"                                                
  file_permission = "644"                                                  
}                                                                          
                                                                           
resource "local_file" "local_ssh_public_key" {                             
  content         = tls_private_key.example.public_key_openssh             
  filename        = "mykey.pub"                                            
  file_permission = "600"                                                  
}                                                                          