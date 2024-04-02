

####################
# Github Action role
####################
resource "aws_iam_user" "github_action_user" {
  name = "github-action-user"
}

resource "aws_iam_user_policy" "github_action_user_permission" {
  user   = aws_iam_user.github_action_user.name
  policy = data.aws_iam_policy_document.github_policy.json
}

data "aws_iam_policy_document" "github_policy" {
  statement {
    effect    = "Allow"
    actions   = ["ecr:*", "eks:*", "ec2:*", "iam:GetUser"]
    resources = ["*"]
  }
}
