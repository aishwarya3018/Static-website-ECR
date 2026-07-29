resource "aws_iam_role" "github_actions" {

  name = "github-actions-ecr-role"


  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Principal = {

          Federated = aws_iam_openid_connect_provider.github.arn

        }

        Action = "sts:AssumeRoleWithWebIdentity"


        Condition = {

          StringLike = {

            "token.actions.githubusercontent.com:sub" = "repo:aishwarya3018/Static-website-ECR:*"

          }

        }

      }

    ]

  })

}