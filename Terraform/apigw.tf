resource "aws_api_gateway_rest_api" "myapi1" {
   name = "blb-api1"

   endpoint_configuration {
     types = ["REGIONAL"]
   }

   description = "api for site visit counter challenge"
 }


#  resource "aws_api_gateway_resource" "api_resource" {
# #   parent_id   = aws_api_gateway_rest_api.example.root_resource_id
# #   path_part   = "example"
# #   rest_api_id = aws_api_gateway_rest_api.example.id
# }

#  resource "aws_api_gateway_deployment" "example" {
#    rest_api_id = aws_api_gateway_rest_api.example.id

#    triggers = {
#      redeployment = sha1(jsonencode(aws_api_gateway_rest_api.example.body))
#    }

#    lifecycle {
#      create_before_destroy = true
#    }
#  }

#  resource "aws_api_gateway_stage" "example" {
#    deployment_id = aws_api_gateway_deployment.example.id
#    rest_api_id   = aws_api_gateway_rest_api.example.id
#    stage_name    = "example"
#  }

